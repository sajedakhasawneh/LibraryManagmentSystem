using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5.Hani
{
    public partial class AddRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblmsg.Visible = false;
        }

        protected void btnAddRoom_Click(object sender, EventArgs e)
        {
            string roomName = txtRoomName.Text.Trim();
            string capacity = txtCapacity.Text.Trim();
            string description = txtDescription.Text.Trim();
            string imagePath = ""; // Will store uploaded image path
            string status = "Available"; // Default status
            string filePath = Server.MapPath("RoomsData.txt");

            // Validate inputs
            if (string.IsNullOrEmpty(roomName) || string.IsNullOrEmpty(capacity) || string.IsNullOrEmpty(description) || !fuImage.HasFile)
            {
                lblmsg.Text = "All fields are required, including an image.";
                lblmsg.Visible = true;
                lblmsg.Style["color"] = "red"; // Set text color to red
                lblmsg.Style["font-weight"] = "bold"; // Optional: Make the text bold
                return;
            }

            // Generate Unique Room ID
            int roomId = GenerateUniqueRoomId(filePath);

            // Handle Image Upload
            string uploadFolder = Server.MapPath("~/Uploads/");
            if (!Directory.Exists(uploadFolder))
            {
                Directory.CreateDirectory(uploadFolder);
            }

            string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            string allowedExtensions = ".jpg,.jpeg,.png,.gif";

            if (!allowedExtensions.Contains(fileExtension.ToLower()))
            {
                lblmsg.Text = "Only JPG, JPEG, PNG, and GIF files are allowed.";
                lblmsg.Visible = true;
                return;
            }

            string uniqueFileName = Guid.NewGuid().ToString() + fileExtension;
            imagePath = "~/Uploads/" + uniqueFileName;
            fuImage.SaveAs(uploadFolder + uniqueFileName);

            // Save Data to .txt File (Format: RoomID|RoomName|Capacity|Description|ImagePath|Status)
            string roomData = $"{roomId}|{roomName}|{capacity}|{description}|{imagePath}|{status}";

            if (!File.Exists(filePath))
            {
                File.Create(filePath).Close();
            }

            File.AppendAllText(filePath, roomData + Environment.NewLine);
          
            lblmsg.Text = "Room added successfully!";
            lblmsg.Visible = true;

            // Clear inputs
            txtRoomName.Text = "";
            txtCapacity.Text = "";
            txtDescription.Text = "";
            Response.Redirect("AdminRooms.aspx");
        }


        private int GenerateUniqueRoomId(string filePath)
        {
            if (!File.Exists(filePath))
            {
                return 1; // Start from 1 if no file exists
            }

            var lines = File.ReadAllLines(filePath);
            if (lines.Length == 0)
            {
                return 1;
            }

            int maxId = lines.Select(line => line.Split('|')[0])
                             .Where(id => int.TryParse(id, out _))
                             .Select(int.Parse)
                             .DefaultIfEmpty(0)
                             .Max();

            return maxId + 1;
        }
    }
}
