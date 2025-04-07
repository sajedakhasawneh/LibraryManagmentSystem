//using System;
//using System.Collections.Generic;
//using System.IO;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace Group5.Hani
//{
//    public partial class Rooms : System.Web.UI.Page
//    {
//        private string roomsFilePath;
//        private string reservationsFilePath;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            roomsFilePath = Server.MapPath("RoomsData.txt");
//            reservationsFilePath = Server.MapPath("Reservations.txt");

//            if (!IsPostBack)
//            {
//                LoadRooms();
//            }
//        }
////        protected void btnApprove_Click(object sender, EventArgs e)
////{
////    Button btn = (Button)sender;
////    string roomId = btn.CommandArgument;

////    ApproveReservation(roomId);

////    Response.Write("<script>alert('Reservation approved successfully!');</script>");
////}

//        protected void ApproveReservation(string roomId)
//        {
//            if (!File.Exists(reservationsFilePath))
//                return;

//            string[] lines = File.ReadAllLines(reservationsFilePath);
//            List<string> updatedLines = new List<string>();

//            foreach (string line in lines)
//            {
//                string[] data = line.Split('|');
//                if (data.Length >= 4 && data[0] == roomId && data[3] == "Pending")
//                {
//                    data[3] = "Reserved"; // Change status to Reserved
//                }
//                updatedLines.Add(string.Join("|", data));
//            }

//            File.WriteAllLines(reservationsFilePath, updatedLines);
//            LoadRooms(); // Refresh the UI
//        }

//        protected void btnReserve_Click(object sender, EventArgs e)
//        {
//            Button btn = (Button)sender;
//            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
//            Panel pnlTimePicker = (Panel)item.FindControl("pnlTimePicker");

//            pnlTimePicker.CssClass += " open"; // Show the panel by adding the "open" class
//        }

//        protected void rptRooms_ItemDataBound(object sender, RepeaterItemEventArgs e)
//        {
//            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
//            {
//                Button btnCancel = (Button)e.Item.FindControl("btnCancel");
//                Label lblStatus = (Label)e.Item.FindControl("lblStatus");
//                DropDownList ddlStartTime = (DropDownList)e.Item.FindControl("ddlStartTime");

//                Button reserveButton = (Button)e.Item.FindControl("btnReserve");
//                string roomId = reserveButton.CommandArgument;
//                string status = GetReservationStatus(roomId);

//                lblStatus.Text = $"Status: {status}";
//                lblStatus.CssClass = "status-label " + (status == "Available" ? "status-available" : status == "Pending" ? "status-pending" : "status-reserved");

//                btnCancel.Visible = (status == "Reserved" || status == "Cancel Pending");
//                btnCancel.Enabled = (status != "Cancel Pending");

//                // Fill dropdown with time slots
//                if (ddlStartTime != null && ddlStartTime.Items.Count == 0)
//                {
//                    for (int hour = 0; hour < 24; hour++)
//                    {
//                        ddlStartTime.Items.Add(new ListItem($"{hour}:00 - {(hour + 2) % 24}:00", hour.ToString()));
//                    }
//                }
//            }
//        }

//        protected string GetReservationStatus(string roomId)
//        {
//            if (!File.Exists(reservationsFilePath))
//                return "Available";

//            string[] lines = File.ReadAllLines(reservationsFilePath);
//            foreach (string line in lines)
//            {
//                string[] data = line.Split('|');
//                if (data.Length >= 4 && data[0] == roomId)
//                {
//                    return data[3];
//                }
//            }
//            return "Available";
//        }

//        protected void btnConfirmReserve_Click(object sender, EventArgs e)
//        {
//            Button btn = (Button)sender;
//            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

//            DropDownList ddlStartTime = (DropDownList)item.FindControl("ddlStartTime");
//            TextBox txtDatePicker = (TextBox)item.FindControl("txtDatePicker");
//            Button reserveButton = (Button)item.FindControl("btnReserve");

//            if (ddlStartTime == null || ddlStartTime.SelectedItem == null || txtDatePicker == null || string.IsNullOrEmpty(txtDatePicker.Text))
//            {
//                Response.Write("<script>alert('Please select a date and time before confirming reservation.');</script>");
//                return;
//            }

//            string selectedTime = ddlStartTime.SelectedValue;
//            string selectedDate = txtDatePicker.Text;
//            string roomId = btn.CommandArgument;

//            List<string> reservations = new List<string>();
//            bool found = false;

//            if (File.Exists(reservationsFilePath))
//            {
//                string[] lines = File.ReadAllLines(reservationsFilePath);
//                foreach (string line in lines)
//                {
//                    string[] data = line.Split('|');
//                    if (data.Length >= 4 && data[0] == roomId)
//                    {
//                        data[1] = selectedDate;
//                        data[2] = selectedTime;
//                        data[3] = "Pending"; // Set status to Pending
//                        found = true;
//                    }
//                    reservations.Add(string.Join("|", data));
//                }
//            }

//            if (!found)
//            {
//                string reservation = $"{roomId}|{selectedDate}|{selectedTime}|Pending";
//                reservations.Add(reservation);
//            }

//            File.WriteAllLines(reservationsFilePath, reservations);

//            Response.Write("<script>alert('Reservation successful. Status: Pending until the Admin Approve');</script>");

//            LoadRooms(); // Refresh UI
//        }


//        protected void btnCancelReservation_Click(object sender, EventArgs e)
//        {
//            Button btn = (Button)sender;
//            string roomId = btn.CommandArgument;

//            if (!File.Exists(reservationsFilePath))
//                return;

//            string[] lines = File.ReadAllLines(reservationsFilePath);
//            List<string> updatedLines = new List<string>();

//            foreach (string line in lines)
//            {
//                string[] data = line.Split('|');
//                if (data.Length >= 4 && data[0] == roomId && data[3] == "Reserved")
//                {
//                    data[3] = "Cancel Pending";
//                }
//                updatedLines.Add(string.Join("|", data));
//            }

//            File.WriteAllLines(reservationsFilePath, updatedLines);
//            LoadRooms();
//        }

//        private void LoadRooms()
//        {
//            List<Room> rooms = new List<Room>();

//            if (File.Exists(roomsFilePath))
//            {
//                string[] lines = File.ReadAllLines(roomsFilePath);
//                foreach (string line in lines)
//                {
//                    string[] data = line.Split('|');
//                    if (data.Length >= 5)
//                    {
//                        string roomId = data[0];
//                        string status = GetReservationStatus(roomId);

//                        rooms.Add(new Room
//                        {
//                            ID = roomId,
//                            Name = data[1],
//                            Capacity = data[2],
//                            Description = data[3],
//                            Image = ResolveUrl(data[4].Replace("~", "")),
//                            Status = status
//                        });
//                    }
//                }
//            }

//            rptRooms.DataSource = rooms;
//            rptRooms.DataBind();
//        }

//        public class Room
//        {
//            public string ID { get; set; }
//            public string Name { get; set; }
//            public string Capacity { get; set; }
//            public string Description { get; set; }
//            public string Image { get; set; }
//            public string Status { get; set; }
//        }
//    }

//}


using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5.Hani
{
    public partial class Rooms : System.Web.UI.Page
    {
        private string roomsFilePath;
        private string reservationsFilePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            roomsFilePath = Server.MapPath("RoomsData.txt");
            reservationsFilePath = Server.MapPath("Reservations.txt");

            if (!IsPostBack)
            {
                LoadRooms();
            }
        }
        //        protected void btnApprove_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    string roomId = btn.CommandArgument;

        //    ApproveReservation(roomId);

        //    Response.Write("<script>alert('Reservation approved successfully!');</script>");
        //}

        protected void ApproveReservation(string roomId)
        {
            if (!File.Exists(reservationsFilePath))
                return;

            string[] lines = File.ReadAllLines(reservationsFilePath);
            List<string> updatedLines = new List<string>();

            foreach (string line in lines)
            {
                string[] data = line.Split('|');
                if (data.Length >= 4 && data[0] == roomId && data[3] == "Pending")
                {
                    data[3] = "Reserved"; // Change status to Reserved
                }
                updatedLines.Add(string.Join("|", data));
            }

            File.WriteAllLines(reservationsFilePath, updatedLines);
            LoadRooms(); // Refresh the UI
        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            Panel pnlTimePicker = (Panel)item.FindControl("pnlTimePicker");

            pnlTimePicker.CssClass += " open"; // Show the panel by adding the "open" class
        }

        //protected void rptRooms_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Button btnCancel = (Button)e.Item.FindControl("btnCancel");
        //        Label lblStatus = (Label)e.Item.FindControl("lblStatus");
        //        DropDownList ddlStartTime = (DropDownList)e.Item.FindControl("ddlStartTime");

        //        Button reserveButton = (Button)e.Item.FindControl("btnReserve");
        //        string roomId = reserveButton.CommandArgument;
        //        string status = GetReservationStatus(roomId);

        //        lblStatus.Text = $"Status: {status}";
        //        lblStatus.CssClass = "status-label " + (status == "Available" ? "status-available" : status == "Pending" ? "status-pending" : "status-reserved");

        //        btnCancel.Visible = (status == "Reserved" || status == "Cancel Pending");
        //        btnCancel.Enabled = (status != "Cancel Pending");

        //        // Fill dropdown with time slots
        //        if (ddlStartTime != null && ddlStartTime.Items.Count == 0)
        //        {
        //            for (int hour = 0; hour < 24; hour++)
        //            {
        //                ddlStartTime.Items.Add(new ListItem($"{hour}:00 - {(hour + 2) % 24}:00", hour.ToString()));
        //            }
        //        }
        //    }
        //}






        protected void rptRooms_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnCancel = (Button)e.Item.FindControl("btnCancel");
                Label lblStatus = (Label)e.Item.FindControl("lblStatus");
                DropDownList ddlStartTime = (DropDownList)e.Item.FindControl("ddlStartTime");
                Button reserveButton = (Button)e.Item.FindControl("btnReserve");

                string roomId = reserveButton.CommandArgument;
                string status = GetReservationStatus(roomId);

                lblStatus.Text = $"Status: {status}";
                lblStatus.CssClass = "status-label " + (status == "Available" ? "status-available" : status == "Pending" ? "status-pending" : "status-reserved");

                btnCancel.Visible = (status == "Reserved" || status == "Cancel Pending");
                btnCancel.Enabled = (status != "Cancel Pending");

                // Hide Reserve button if status is "Reserved"
                reserveButton.Visible = !(status == "Reserved" || status == "Cancel Pending"  || status == "Pending");



                // Fill dropdown with time slots
                if (ddlStartTime != null && ddlStartTime.Items.Count == 0)
                {
                    for (int hour = 0; hour < 24; hour++)
                    {
                        ddlStartTime.Items.Add(new ListItem($"{hour}:00 - {(hour + 2) % 24}:00", hour.ToString()));
                    }
                }
            }
        }




        protected void btnApprove_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string roomId = btn.CommandArgument;

            ApproveReservation(roomId);

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Approved', 'Reservation approved successfully!', 'success');", true);
        }

        protected string GetReservationStatus(string roomId)
        {
            if (!File.Exists(reservationsFilePath))
                return "Available";

            string[] lines = File.ReadAllLines(reservationsFilePath);
            foreach (string line in lines)
            {
                string[] data = line.Split('|');
                if (data.Length >= 4 && data[0] == roomId)
                {
                    return data[3];
                }
            }
            return "Available";
        }

        protected void btnConfirmReserve_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            DropDownList ddlStartTime = (DropDownList)item.FindControl("ddlStartTime");
            TextBox txtDatePicker = (TextBox)item.FindControl("txtDatePicker");
            Button reserveButton = (Button)item.FindControl("btnReserve");

            if (ddlStartTime == null || ddlStartTime.SelectedItem == null || txtDatePicker == null || string.IsNullOrEmpty(txtDatePicker.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Error', 'Please select a date and time before confirming reservation.', 'error');", true);
                return;
            }

            string selectedTime = ddlStartTime.SelectedValue;
            string selectedDate = txtDatePicker.Text;
            string roomId = btn.CommandArgument;

            List<string> reservations = new List<string>();
            bool found = false;

            if (File.Exists(reservationsFilePath))
            {
                string[] lines = File.ReadAllLines(reservationsFilePath);
                foreach (string line in lines)
                {
                    string[] data = line.Split('|');
                    if (data.Length >= 4 && data[0] == roomId)
                    {
                        data[1] = selectedDate;
                        data[2] = selectedTime;
                        data[3] = "Pending"; // Set status to Pending
                        found = true;
                    }
                    reservations.Add(string.Join("|", data));
                }
            }

            if (!found)
            {
                string reservation = $"{roomId}|{selectedDate}|{selectedTime}|Pending";
                reservations.Add(reservation);
            }

            File.WriteAllLines(reservationsFilePath, reservations);

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Success', 'Reservation successful. Status: Pending until the Admin Approve', 'success');", true);

            LoadRooms(); // Refresh UI
        }



        protected void btnCancelReservation_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string roomId = btn.CommandArgument;

            if (!File.Exists(reservationsFilePath))
                return;

            string[] lines = File.ReadAllLines(reservationsFilePath);
            List<string> updatedLines = new List<string>();

            foreach (string line in lines)
            {
                string[] data = line.Split('|');
                if (data.Length >= 4 && data[0] == roomId && data[3] == "Reserved")
                {
                    data[3] = "Cancel Pending";
                }
                updatedLines.Add(string.Join("|", data));
            }

            File.WriteAllLines(reservationsFilePath, updatedLines);
            LoadRooms();
        }

        private void LoadRooms()
        {
            List<Room> rooms = new List<Room>();

            if (File.Exists(roomsFilePath))
            {
                string[] lines = File.ReadAllLines(roomsFilePath);
                foreach (string line in lines)
                {
                    string[] data = line.Split('|');
                    if (data.Length >= 5)
                    {
                        string roomId = data[0];
                        string status = GetReservationStatus(roomId);

                        rooms.Add(new Room
                        {
                            ID = roomId,
                            Name = data[1],
                            Capacity = data[2],
                            Description = data[3],
                            Image = ResolveUrl(data[4].Replace("~", "")),
                            Status = status
                        });
                    }
                }
            }

            rptRooms.DataSource = rooms;
            rptRooms.DataBind();
        }



        public class Room
        {
            public string ID { get; set; }
            public string Name { get; set; }
            public string Capacity { get; set; }
            public string Description { get; set; }
            public string Image { get; set; }
            public string Status { get; set; }
        }
    }

}
