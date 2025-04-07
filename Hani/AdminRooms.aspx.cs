//using System;
//using System.Collections.Generic;
//using System.IO;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace Group5.Hani
//{
//    public partial class AdminRooms : System.Web.UI.Page
//    {
//        private string reservationsFilePath;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            reservationsFilePath = Server.MapPath("Reservations.txt");

//            if (!IsPostBack)
//            {
//                LoadReservations();
//            }
//        }

//        private void LoadReservations()
//        {
//            List<Reservation> reservations = new List<Reservation>();

//            if (File.Exists(reservationsFilePath))
//            {
//                string[] lines = File.ReadAllLines(reservationsFilePath);
//                foreach (string line in lines)
//                {
//                    string[] data = line.Split('|');
//                    if (data.Length >= 4)
//                    {
//                        reservations.Add(new Reservation
//                        {
//                            RoomID = data[0],
//                            Date = data[1],
//                            StartTime = data[2],
//                            Status = data[3]
//                        });
//                    }
//                }
//            }

//            gvReservations.DataSource = reservations;
//            gvReservations.DataBind();
//        }

//        protected void gvReservations_RowCommand(object sender, GridViewCommandEventArgs e)
//        {
//            string roomId = e.CommandArgument.ToString();

//            if (e.CommandName == "Accept" || e.CommandName == "Reject")
//            {
//                string newStatus = (e.CommandName == "Accept") ? "Reserved" : "Rejected";
//                UpdateReservationStatus(roomId, newStatus);
//            }
//            else if (e.CommandName == "ApproveCancel")
//            {
//                RemoveReservation(roomId);
//            }
//            else if (e.CommandName == "RejectCancel")
//            {
//                UpdateReservationStatus(roomId, "Reserved");
//            }
//        }

//        private void UpdateReservationStatus(string roomId, string newStatus)
//        {
//            if (!File.Exists(reservationsFilePath))
//                return;

//            string[] lines = File.ReadAllLines(reservationsFilePath);
//            List<string> updatedLines = new List<string>();

//            foreach (string line in lines)
//            {
//                string[] data = line.Split('|');
//                if (data.Length >= 4 && data[0] == roomId)
//                {
//                    data[3] = newStatus;
//                }
//                updatedLines.Add(string.Join("|", data));
//            }

//            File.WriteAllLines(reservationsFilePath, updatedLines);
//            LoadReservations();
//        }

//        private void RemoveReservation(string roomId)
//        {
//            if (!File.Exists(reservationsFilePath))
//                return;

//            string[] lines = File.ReadAllLines(reservationsFilePath);
//            List<string> updatedLines = new List<string>();

//            foreach (string line in lines)
//            {
//                string[] data = line.Split('|');
//                if (data.Length >= 4 && data[0] == roomId && data[3] == "Cancel Pending")
//                {
//                    continue; // Remove the reservation
//                }
//                updatedLines.Add(line);
//            }

//            File.WriteAllLines(reservationsFilePath, updatedLines);
//            LoadReservations();
//        }
//    }

//    public class Reservation
//    {
//        public string RoomID { get; set; }
//        public string Date { get; set; }
//        public string StartTime { get; set; }
//        public string Status { get; set; }
//    }
//}



using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5.Hani
{
    public partial class AdminRooms : System.Web.UI.Page
    {
        private string roomsFilePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            roomsFilePath = Server.MapPath("RoomsData.txt");

            if (!IsPostBack)
            {
                LoadRooms();
            }
        }

        private void LoadRooms()
        {
            RoomContainer.Controls.Clear(); // Clear existing controls before reloading

            if (!File.Exists(roomsFilePath))
                return;

            string[] lines = File.ReadAllLines(roomsFilePath);
            foreach (string line in lines)
            {
                string[] data = line.Split('|');
                if (data.Length >= 6)
                {
                    string roomId = data[0];
                    string roomName = data[1];
                    string capacity = data[2];
                    string description = data[3];
                    string imagePath = data[4];
                    string status = data[5];

                    // Create Room Card
                    Panel cardPanel = new Panel { CssClass = "card shadow-lg m-2", Width = 300 };

                    // Image
                    Image img = new Image
                    {
                        ImageUrl = imagePath,
                        CssClass = "card-img-top",
                        Width = Unit.Percentage(100),
                        Height = 200,
                        AlternateText = roomName
                    };
                    cardPanel.Controls.Add(img);

                    // Card Body
                    Panel bodyPanel = new Panel { CssClass = "card-body" };

                    // Room Name
                    Label lblRoomName = new Label
                    {
                        Text = "<h5 class='card-title'>" + roomName + "</h5>",
                        EnableViewState = false
                    };
                    bodyPanel.Controls.Add(lblRoomName);

                    // Room Details
                    Label lblDetails = new Label
                    {
                        Text = $"<p class='card-text'>Capacity: {capacity} <br />Status: {status}</p>",
                        EnableViewState = false
                    };
                    bodyPanel.Controls.Add(lblDetails);

                    // Buttons Container
                    Panel buttonPanel = new Panel { CssClass = "d-flex justify-content-between mt-2" };

                    // Edit Button
                    Button btnEdit = new Button
                    {
                        Text = "Edit",
                        CssClass = "btn btn-primary",
                        PostBackUrl = "EditRoom.aspx?roomId=" + roomId
                    };
                    buttonPanel.Controls.Add(btnEdit);

                    // Delete Button with JavaScript Confirmation
                    Button btnDelete = new Button
                    {
                        Text = "Delete",
                        CssClass = "btn btn-danger ms-2",
                        OnClientClick = $"return confirmDelete('{roomId}');"  // JavaScript Function
                    };
                    buttonPanel.Controls.Add(btnDelete);

                    bodyPanel.Controls.Add(buttonPanel);
                    cardPanel.Controls.Add(bodyPanel);
                    RoomContainer.Controls.Add(cardPanel);
                }
            }
        }




        protected void ExportRooms_Click(object sender, EventArgs e)
        {
            if (!File.Exists(roomsFilePath))
            {
                return;
            }

            // Prepare CSV content
            List<string> csvLines = new List<string>();
            csvLines.Add("Room ID,Room Name,Capacity,Description,Status"); // CSV Headers

            string[] lines = File.ReadAllLines(roomsFilePath);
            foreach (string line in lines)
            {
                string[] data = line.Split('|');
                if (data.Length >= 6)
                {
                    string csvLine = $"{data[0]},{data[1]},{data[2]},{data[3]},{data[5]}";
                    csvLines.Add(csvLine);
                }
            }

            // Send CSV file as a response
            string csvContent = string.Join(Environment.NewLine, csvLines);
            string fileName = "RoomsExport.csv";

            Response.Clear();
            Response.ContentType = "text/csv";
            Response.AddHeader("Content-Disposition", $"attachment;filename={fileName}");
            Response.Write(csvContent);
            Response.End();
        }






        protected void DeleteRoom(string roomId)
        {
            if (!File.Exists(roomsFilePath))
                return;

            List<string> updatedLines = new List<string>();
            string[] lines = File.ReadAllLines(roomsFilePath);

            foreach (string line in lines)
            {
                string[] data = line.Split('|');
                if (data[0] != roomId)  // Exclude the room being deleted
                {
                    updatedLines.Add(line);
                }
            }

            File.WriteAllLines(roomsFilePath, updatedLines);
            LoadRooms(); // Refresh the list after deletion
        }

        protected void ConfirmDelete_Click(object sender, EventArgs e)
        {
            string roomId = HiddenFieldRoomId.Value;  // Get Room ID from hidden field
            if (!string.IsNullOrEmpty(roomId))
            {
                DeleteRoom(roomId);
            }
        }

        protected void TakeMeBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("\\Habib\\Habib1.aspx"); // Change "Dashboard.aspx" to your desired previous page
        }

    }
}
