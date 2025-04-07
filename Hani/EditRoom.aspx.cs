//using System;
//using System.IO;
//using System.Linq;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace Group5.Hani
//{
//    public partial class EditRoom : System.Web.UI.Page
//    {
//        private string filePath = System.Web.HttpContext.Current.Server.MapPath("RoomsData.txt");

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            lblmsg.Visible = false;
//            if (!IsPostBack)
//            {
//                LoadRooms();
//            }
//        }

//        private void LoadRooms()
//        {
//            if (!File.Exists(filePath))
//                return;

//            ddlRooms.Items.Clear();
//            var lines = File.ReadAllLines(filePath);
//            foreach (var line in lines)
//            {
//                var data = line.Split('|');
//                if (data.Length >= 6)
//                {
//                    ddlRooms.Items.Add(new ListItem(data[1], data[0])); // Room Name as Text, Room ID as Value
//                }
//            }
//            ddlRooms.Items.Insert(0, new ListItem("-- Select a Room --", ""));
//        }

//        protected void ddlRooms_SelectedIndexChanged(object sender, EventArgs e)
//        {
//            if (string.IsNullOrEmpty(ddlRooms.SelectedValue))
//                return;

//            var lines = File.ReadAllLines(filePath);
//            foreach (var line in lines)
//            {
//                var data = line.Split('|');
//                if (data[0] == ddlRooms.SelectedValue)
//                {
//                    txtRoomName.Text = data[1];
//                    txtCapacity.Text = data[2];
//                    txtDescription.Text = data[3];
//                    ViewState["CurrentImage"] = data[4]; // Store current image path
//                    break;
//                }
//            }
//        }

//        protected void btnUpdateRoom_Click(object sender, EventArgs e)
//        {
//            if (string.IsNullOrEmpty(ddlRooms.SelectedValue))
//            {
//                lblmsg.Text = "Please select a room to edit.";
//                lblmsg.ForeColor = System.Drawing.Color.Red;
//                lblmsg.Visible = true;
//                return;
//            }

//            string roomId = ddlRooms.SelectedValue;
//            string newRoomName = txtRoomName.Text.Trim();
//            string newCapacity = txtCapacity.Text.Trim();
//            string newDescription = txtDescription.Text.Trim();
//            string imagePath = ViewState["CurrentImage"]?.ToString();

//            // Handle image upload if a new one is provided
//            if (fuImage.HasFile)
//            {
//                string uploadFolder = Server.MapPath("~/Uploads/");
//                if (!Directory.Exists(uploadFolder))
//                {
//                    Directory.CreateDirectory(uploadFolder);
//                }

//                string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
//                string fileExtension = Path.GetExtension(fileName).ToLower();
//                string allowedExtensions = ".jpg,.jpeg,.png,.gif";

//                if (!allowedExtensions.Contains(fileExtension))
//                {
//                    lblmsg.Text = "Only JPG, JPEG, PNG, and GIF files are allowed.";
//                    lblmsg.ForeColor = System.Drawing.Color.Red;
//                    lblmsg.Visible = true;
//                    return;
//                }

//                string uniqueFileName = Guid.NewGuid().ToString() + fileExtension;
//                imagePath = "~/Uploads/" + uniqueFileName;
//                fuImage.SaveAs(uploadFolder + uniqueFileName);
//            }

//            var lines = File.ReadAllLines(filePath).ToList();
//            for (int i = 0; i < lines.Count; i++)
//            {
//                var data = lines[i].Split('|');
//                if (data[0] == roomId)
//                {
//                    lines[i] = $"{roomId}|{newRoomName}|{newCapacity}|{newDescription}|{imagePath}|{data[5]}";
//                    break;
//                }
//            }

//            File.WriteAllLines(filePath, lines);

//            lblmsg.Text = "Room details updated successfully!";
//            lblmsg.ForeColor = System.Drawing.Color.Green;
//            lblmsg.Visible = true;
//        }
//    }
//}

using System;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace Group5.Hani
{
    public partial class EditRoom : System.Web.UI.Page
    {
        private string filePath = System.Web.HttpContext.Current.Server.MapPath("RoomsData.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            lblmsg.Visible = false;

            if (!IsPostBack)
            {
                string roomId = Request.QueryString["roomId"];
                if (!string.IsNullOrEmpty(roomId))
                {
                    LoadRoomDetails(roomId);
                }
            }
        }

        private void LoadRoomDetails(string roomId)
        {
            if (!File.Exists(filePath))
                return;

            var lines = File.ReadAllLines(filePath);
            foreach (var line in lines)
            {
                var data = line.Split('|');
                if (data[0] == roomId)
                {
                    txtRoomName.Text = data[1];
                    txtCapacity.Text = data[2];
                    txtDescription.Text = data[3];
                    ViewState["CurrentImage"] = data[4];
                    ViewState["RoomId"] = roomId;
                    break;
                }
            }
        }

        //protected void ddlRooms_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string selectedRoomId = ddlRooms.SelectedValue;
        //    if (!string.IsNullOrEmpty(selectedRoomId))
        //    {
        //        LoadRoomDetails(selectedRoomId);
        //    }
        //}


        protected void btnUpdateRoom_Click(object sender, EventArgs e)
        {
            string roomId = ViewState["RoomId"]?.ToString();
            if (string.IsNullOrEmpty(roomId))
            {
                lblmsg.Text = "Invalid Room ID.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Visible = true;
                return;
            }

            string newRoomName = txtRoomName.Text.Trim();
            string newCapacity = txtCapacity.Text.Trim();
            string newDescription = txtDescription.Text.Trim();
            string imagePath = ViewState["CurrentImage"]?.ToString();

            if (fuImage.HasFile)
            {
                string uploadFolder = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }

                string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                string fileExtension = Path.GetExtension(fileName).ToLower();
                string allowedExtensions = ".jpg,.jpeg,.png,.gif";

                if (!allowedExtensions.Contains(fileExtension))
                {
                    lblmsg.Text = "Only JPG, JPEG, PNG, and GIF files are allowed.";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    lblmsg.Visible = true;
                    return;
                }

                string uniqueFileName = Guid.NewGuid().ToString() + fileExtension;
                imagePath = "~/Uploads/" + uniqueFileName;
                fuImage.SaveAs(uploadFolder + uniqueFileName);
            }

            var lines = File.ReadAllLines(filePath).ToList();
            for (int i = 0; i < lines.Count; i++)
            {
                var data = lines[i].Split('|');
                if (data[0] == roomId)
                {
                    lines[i] = $"{roomId}|{newRoomName}|{newCapacity}|{newDescription}|{imagePath}|{data[5]}";
                    break;
                }
            }

            File.WriteAllLines(filePath, lines);

            lblmsg.Text = "Room details updated successfully!";
            lblmsg.ForeColor = System.Drawing.Color.Green;
            lblmsg.Visible = true;
            Response.Redirect("AdminRooms.aspx");
        }
    }
}
