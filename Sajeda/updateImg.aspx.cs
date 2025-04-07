using System;
using System.Data.SqlClient;
using System.IO;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Group5
{
    public partial class updateImg : System.Web.UI.Page
    {
        private string imageFolderPath;
        private string imgTxtFile;

        protected void Page_Load(object sender, EventArgs e)
        {
            imageFolderPath = Server.MapPath("~/img/");
            imgTxtFile = Server.MapPath("~/img/img.txt");

            if (!IsPostBack)
            {
                LoadProfileImage();
            }
        }

        private void LoadProfileImage()
        {
            if (File.Exists(imgTxtFile))
            {
                string[] lines = File.ReadAllLines(imgTxtFile);
                if (lines.Length > 0)
                {
                    imgProfile.ImageUrl = lines[0]; // Load the first saved image
                    Session["UserImagePath"] = lines[0];
                }
                else
                {
                    imgProfile.ImageUrl = "/img/default.png"; // Default image if file is empty
                }
            }
            else
            {
                imgProfile.ImageUrl = "/img/default.png"; // Default image if file doesn't exist
            }
        }

        protected void Editimg_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                try
                {
                    // Ensure the image folder exists
                    if (!Directory.Exists(imageFolderPath))
                    {
                        Directory.CreateDirectory(imageFolderPath);
                    }

                    // Generate a unique filename
                    string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fileUpload.FileName);
                    string savePath = Path.Combine(imageFolderPath, fileName);

                    // Save the uploaded file
                    fileUpload.SaveAs(savePath);

                    // Store relative path --relative URL 
                    string imagePath = "/img/" + fileName;

                    // Ensure img.txt file exists
                    if (!File.Exists(imgTxtFile))
                    {
                        File.Create(imgTxtFile).Close(); // Create and close the file
                    }

                    // Save image path to img.txt (overwrite previous image path)
                    File.WriteAllText(imgTxtFile, imagePath);

                    // Store in session to reflect update immediately
                    Session["UserImagePath"] = imagePath;

                    // Update the displayed image
                    imgProfile.ImageUrl = imagePath;

                    // Show success message
                    Editmessage.Text = "Image uploaded successfully!";
                    Editmessage.ForeColor = System.Drawing.Color.Green;
                    Editmessage.Visible = true;
                }
                catch (Exception ex)
                {
                    Editmessage.Text = "Error: " + ex.Message;
                    Editmessage.ForeColor = System.Drawing.Color.Red;
                    Editmessage.Visible = true;
                }
            }
            else
            {
                Editmessage.Text = "Please select an image.";
                Editmessage.ForeColor = System.Drawing.Color.Red;
                Editmessage.Visible = true;
            }
            Response.Redirect("editProfile.aspx");
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    





protected void resetPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("resetPassword.aspx");
        }

        protected void showRooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("rooms.aspx");
        }

        protected void showBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx");
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            // Edit user details
        }

        protected void update_Click(object sender, EventArgs e)
        {
            // Update user data
        }

        //protected void cancel_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Profile.aspx");
        //}
    } 
}
