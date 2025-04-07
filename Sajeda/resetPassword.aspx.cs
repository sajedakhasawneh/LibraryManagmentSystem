using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Group5
{
    public partial class resetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                LoadProfileImageOnOtherPage();
            }
        }


        protected void edit_Click(object sender, EventArgs e)
        {
            string usersFile = Server.MapPath("/Suhaib/users.txt");
            string[] readData = File.ReadAllLines(usersFile);

            for (int i = 0; i < readData.Length; i++)
            {
                string[] splitFile = readData[i].Split(',');

                if (splitFile[4] == current.Text) // Check if current password matches
                {
                    if (newpassword.Text != confirm.Text) // Check if new passwords match
                    {
                        checkPassword.Text = "Passwords do not match.";
                        checkPassword.ForeColor = System.Drawing.Color.Red;
                        checkPassword.Visible = true;
                        return;
                    }

                    if (!IsValidPassword(newpassword.Text)) // Validate new password
                    {
                        checkPassword.Text = "Password must be at least 8 characters long, contain one uppercase letter and one digit.";
                        checkPassword.ForeColor = System.Drawing.Color.Red;
                        checkPassword.Visible = true;
                        return;
                    }

                    // Update password
                    readData[i] = $"{splitFile[0]},{splitFile[1]},{splitFile[2]},{splitFile[3]},{newpassword.Text},{splitFile[5]},{splitFile[6]},{splitFile[7]}";
                    File.WriteAllLines(usersFile, readData);

                    checkPassword.Text = "Password changed successfully!";
                    checkPassword.ForeColor = System.Drawing.Color.Green; // Success message in green
                    checkPassword.Visible = true;
                    return;
                }
            }

            // If loop completes without finding the correct password
            checkPassword.Text = "Your old password was entered incorrectly, please enter again";
            checkPassword.ForeColor = System.Drawing.Color.Red;
            checkPassword.Visible = true;
        }

        // Password validation method
        private bool IsValidPassword(string password)
        {
            return password.Length >= 8 &&
                   password.Any(char.IsUpper) &&
                   password.Any(char.IsDigit);
        }




        protected void showRooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("rooms.aspx");
        }

        protected void showBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx");
        }


        protected void editprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("editProfile.aspx");
        }

 
        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void resetPassword_Click1(object sender, EventArgs e)
        {
            Response.Redirect("resetPassword.aspx");
        }

        protected void editimg_Click(object sender, EventArgs e)
        {
            Response.Redirect("updateImg.aspx");
        }






        private void LoadProfileImageOnOtherPage()
        {
            if (Session["UserImagePath"] != null)
            {
                imgProfileOtherPage.ImageUrl = Session["UserImagePath"].ToString();
            }
            else
            {
                imgProfileOtherPage.ImageUrl = "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"; // Default image
            }
        }

      

        protected void setNewPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("resetPassword.aspx");
        }
    }



}

