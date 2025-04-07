using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5.Hani
{
    public partial class Requests : System.Web.UI.Page
    {
        private string reservationsFilePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            reservationsFilePath = Server.MapPath("Reservations.txt");

            if (!IsPostBack)
            {
                LoadReservations();
            }
        }

        private void LoadReservations()
        {
            List<Reservation> reservations = new List<Reservation>();

            if (File.Exists(reservationsFilePath))
            {
                string[] lines = File.ReadAllLines(reservationsFilePath);
                foreach (string line in lines)
                {
                    string[] data = line.Split('|');
                    if (data.Length >= 4)
                    {
                        reservations.Add(new Reservation
                        {
                            RoomID = data[0],
                            Date = data[1],
                            StartTime = data[2],
                            Status = data[3]
                        });
                    }
                }
            }

            gvReservations.DataSource = reservations;
            gvReservations.DataBind();
        }

        protected void gvReservations_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string roomId = e.CommandArgument.ToString();

            if (e.CommandName == "Accept" || e.CommandName == "Reject")
            {
                string newStatus = (e.CommandName == "Accept") ? "Reserved" : "Rejected";
                UpdateReservationStatus(roomId, newStatus);
            }
            else if (e.CommandName == "ApproveCancel")
            {
                RemoveReservation(roomId);
            }
            else if (e.CommandName == "RejectCancel")
            {
                UpdateReservationStatus(roomId, "Reserved");
            }
        }

        private void UpdateReservationStatus(string roomId, string newStatus)
        {
            if (!File.Exists(reservationsFilePath))
                return;

            string[] lines = File.ReadAllLines(reservationsFilePath);
            List<string> updatedLines = new List<string>();

            foreach (string line in lines)
            {
                string[] data = line.Split('|');
                if (data.Length >= 4 && data[0] == roomId)
                {
                    data[3] = newStatus;
                }
                updatedLines.Add(string.Join("|", data));
            }

            File.WriteAllLines(reservationsFilePath, updatedLines);
            LoadReservations();
        }

        private void RemoveReservation(string roomId)
        {
            if (!File.Exists(reservationsFilePath))
                return;

            string[] lines = File.ReadAllLines(reservationsFilePath);
            List<string> updatedLines = new List<string>();

            foreach (string line in lines)
            {
                string[] data = line.Split('|');
                if (data.Length >= 4 && data[0] == roomId && data[3] == "Cancel Pending")
                {
                    continue; // Remove the reservation
                }
                updatedLines.Add(line);
            }

            File.WriteAllLines(reservationsFilePath, updatedLines);
            LoadReservations();
        }

        protected void TakeMeBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("\\Hani\\AdminRooms.aspx"); // Change "Dashboard.aspx" to your desired previous page
        }

    }



    public class Reservation
    {
        public string RoomID { get; set; }
        public string Date { get; set; }
        public string StartTime { get; set; }
        public string Status { get; set; }
    }
}


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
