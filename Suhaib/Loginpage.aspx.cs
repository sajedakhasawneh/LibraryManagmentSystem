using System;
using System.IO;
using System.Web.UI;

namespace Group5.Suhaib
{
    public partial class Loginpage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    
        protected void login_Click(object sender, EventArgs e)
        {
            string universityId = uniID.Text.Trim();
            string password = Password.Text.Trim();
            string filePath = Server.MapPath("users.txt");

            // Check if the user is Admin
            if (universityId == "Admin" && password == "Admin")
            {
                Response.Redirect("~/Habib/Habib1.aspx");
                return;
            }

            // Check if users.txt exists
            if (!File.Exists(filePath))
            {
                Response.Write("<script>alert('No users registered yet.');</script>");
                return;
            }

            // Read users.txt and validate credentials
            string[] users = File.ReadAllLines(filePath);
            bool isUserValid = false;
            string userData = "";

            for (int i = 1; i < users.Length; i++) // Skip header
            {
                string[] userDetails = users[i].Split(',');

                if (userDetails.Length >= 5 && userDetails[2] == universityId && userDetails[4] == password)
                {
                    isUserValid = true;
                    userData = userDetails[2];
                    break;
                }
            }

            if (isUserValid)
            {
                // Create a file for the logged-in user
                string userFilePath = Server.MapPath("~/loggedinuser.txt");

                if (File.Exists(userFilePath))
                {
                    File.WriteAllText(userFilePath, userData);
                }

                Response.Redirect("~/Habib/Home.aspx");            }
            else
            {
                Response.Write("<script>alert('Invalid University ID or Password.');</script>");
            }
        }
    }
}
