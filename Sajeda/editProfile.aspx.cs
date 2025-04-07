using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Net.Mail;
namespace Group5
{
    public partial class editProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
       

            if (!IsPostBack)
            {
                load();
                LoadProfileImageOnOtherPage();
            }
        }


        protected void edit_Click(object sender, EventArgs e) {

           string filePath = Server.MapPath("/Suhaib/users.txt");
            if (File.Exists(filePath))
            {
               string[] content = File.ReadAllLines(filePath);
               string fileLoged = Server.MapPath("~/loggedinuser.txt");
               string userID = File.ReadAllText(fileLoged);

                for (int i = 0; i < content.Length; i++)
                {
                    string[] user = content[i].Split(',');
                    if (user[2] == userID)
                    {
                        user[0] = name.Text;
                        user[3] = email.Text;
                        user[1] = phone.Text;
                        File.WriteAllText(fileLoged, studentnum.Text);
                        content[i] = $"{user[0]},{user[1]},{user[2]},{user[3]},{user[4]},{user[5]},{user[6]},{user[7]}";

                        //Response.Write("<script>alert('information changed!');</script>");

                        break;
                    }
                }
                File.WriteAllLines(filePath, content);

                validationMessage.Text = "Saved successfully!";
                validationMessage.ForeColor = System.Drawing.Color.GreenYellow;
                validationMessage.Visible = true;
                return;
            }
            //Response.Redirect("Profile.aspx");
        }


        private void load()
        {
            string filePath = Server.MapPath("/Suhaib/users.txt");
            if (File.Exists(filePath))
            {
                string[] content = File.ReadAllLines(filePath);
                string fileLoged = Server.MapPath("~/loggedinuser.txt");
                string userID = File.ReadAllText(fileLoged);

                foreach (string line in content)
                {
                    string[] user = line.Split(',');
                    if (user[2] == userID)
                    {
                        studentnum.Text = user[2];
                        name.Text = user[0];
                        email.Text = user[3];
                        phone.Text = user[1];

                    }
                }
            }
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












        //string usersFilePath = Server.MapPath("users.txt");
        //if (File.Exists(usersFilePath))
        //{
        //    string[] userRecords = File.ReadAllLines(usersFilePath);

        //    // Validate input before processing
        //    if (!IsValidName(name.Text)) { 
        //    //{
        //    //    validationMessage.Text = "Invalid name. Only letters and spaces are allowed.";
        //    //    validationMessage.ForeColor = System.Drawing.Color.Red;
        //    //    validationMessage.Visible = true;
        //        return;
        //    }

        //    if (!IsValidEmail(email.Text))
        //    {
        //        //validationMessage.Text = "Invalid email format.";
        //        //validationMessage.ForeColor = System.Drawing.Color.Red;
        //        //validationMessage.Visible = true;
        //        return;
        //    }

        //    for (int i = 0; i < userRecords.Length; i++)
        //    {
        //        string[] userData = userRecords[i].Split(',');

        //        if (userData[7] == "true") // Checking if the user is active
        //        {
        //            userRecords[i] = $"{userData[0]},{name.Text},{email.Text},{userData[3]},{userData[4]},{userData[5]},{phone.Text},{userData[6]},true";
        //            File.WriteAllLines(usersFilePath, userRecords);

        //            //validationMessage.Text = "Saved successfully!";
        //            //validationMessage.ForeColor = System.Drawing.Color.Green;
        //            //validationMessage.Visible = true;
        //            return;
        //        }
        //    }
        //}


        //// Method to validate the full name (only letters and spaces allowed)
        //        private bool IsValidName(string name)
        //        {
        //            return !string.IsNullOrWhiteSpace(name) && Regex.IsMatch(name, @"^[A-Za-z\s]+$");
        //        }

        //        // Method to validate the email format
        //        private bool IsValidEmail(string email)
        //        {
        //            return !string.IsNullOrWhiteSpace(email) && Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$");
        //        }


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

        protected void editimg_Click(object sender, EventArgs e)
        {
            Response.Redirect("updateImg.aspx");
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

     
    }
}

/*
 string file = Server.MapPath("users.txt");
            if (File.Exists(file))
            {
                string user = File.ReadAllText(file);
                string[] userData = user.Split(',');

                string file2 = Server.MapPath("logUser.txt");
                string[] users = File.ReadAllLines(file2);
                foreach (string u in users)
                {
                    string[] userData2 = u.Split(',');
                    if (userData2[1] == userData[1] && userData2.Length > 3)
                    {
                        name.Text = userData2[1];
                        email.Text = userData2[2];
                        phone.Text = userData2[3];
                        age.Text = userData2[4];
                        address.Text = userData2[5];

                        userName.Text = userData2[0];
                        userPhone.Text = userData2[3];
                        userAge.Text = userData2[4];
                        userAddress.Text = userData2[5];
                        break;
                    }
                    else
                    {
                        name.Text = userData[0];
                        userName.Text = userData[0];
                        email.Text = userData[1];
                    }
                }
            }
 
 */