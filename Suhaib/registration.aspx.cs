using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.UI;



namespace Group5.Suhaib
{
    public partial class registration : Page
    {
        //protected void Page_Load_custom(object sender, EventArgs e)
        //{
        //}

        //protected void submit_Click(object sender, EventArgs e)
        //{
        //    // Get user input values
        //    string fullName = name.Text.Trim();
        //    string phoneNumber = phone.Text.Trim();
        //    string universityId = uniID.Text.Trim();
        //    string emailAddress = email.Text.Trim();
        //    string password = Password.Text.Trim();
        //    string confirmPassword = conpassword.Text.Trim();
        //    string gender = Female.Checked ? "Female" : (Male.Checked ? "Male" : "Not Specified");
        //    string college = ddlState.SelectedItem.Text;
        //    string major = DropDownList1.SelectedItem.Text;

        //    // Define regex patterns
        //    Regex nameRegex = new Regex(@"^[A-Z][a-z]+\s[A-Z][a-z]+$"); // Full name validation
        //    Regex phoneRegex = new Regex(@"^07\d{8}$"); // Phone number validation (07xxxxxxxx)
        //    Regex emailRegex = new Regex(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"); // Email validation
        //    Regex uniIdRegex = new Regex(@"^\d{10}$"); // University ID validation (exactly 10 digits)
        //    Regex passwordRegex = new Regex(@"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"); // Password: 8+ chars, 1 uppercase, 1 number, 1 special char

        //    // Validate inputs
        //    if (!nameRegex.IsMatch(fullName))
        //    {
        //        Response.Write("<script>alert('Invalid full name. Use proper capitalization and spacing.');</script>");
        //        return;
        //    }

        //    if (!phoneRegex.IsMatch(phoneNumber))
        //    {
        //        Response.Write("<script>alert('Invalid phone number. It must start with 07 and be exactly 10 digits.');</script>");
        //        return;
        //    }

        //    if (!emailRegex.IsMatch(emailAddress))
        //    {
        //        Response.Write("<script>alert('Invalid email format. Please enter a valid email address.');</script>");
        //        return;
        //    }

        //    if (!uniIdRegex.IsMatch(universityId))
        //    {
        //        Response.Write("<script>alert('Invalid University ID. It must be exactly 10 digits.');</script>");
        //        return;
        //    }

        //    if (!passwordRegex.IsMatch(password))
        //    {
        //        Response.Write("<script>alert('Password must be at least 8 characters long, contain 1 uppercase letter, 1 number, and 1 special character.');</script>");
        //        return;
        //    }

        //    if (password != confirmPassword)
        //    {
        //        Response.Write("<script>alert('Passwords do not match!');</script>");
        //        return;
        //    }

        //    // Define the file path (relative to project folder)
        //    string filePath = Server.MapPath("users.txt");

        //    // Create the file if it doesn't exist and add a header row
        //    if (!File.Exists(filePath))
        //    {
        //        using (StreamWriter sw = File.CreateText(filePath))
        //        {
        //            sw.WriteLine("Full Name,Phone Number,University ID,Email,Password,Gender,College,Major"); // Header row
        //        }
        //    }

        //    // Append user data to the file
        //    using (StreamWriter writer = File.AppendText(filePath))
        //    {
        //        writer.WriteLine($"{fullName},{phoneNumber},{universityId},{emailAddress},{password},{gender},{college},{major}");
        //    }

        //    // Redirect to the Login page after successful registration
        //    Response.Redirect("Loginpage.aspx");
        //}





        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            // Get user input values
            string fullName = name.Text.Trim();
            string phoneNumber = phone.Text.Trim();
            string universityId = uniID.Text.Trim();
            string emailAddress = email.Text.Trim();
            string password = Password.Text.Trim();
            string confirmPassword = conpassword.Text.Trim();
            string gender = Female.Checked ? "Female" : (Male.Checked ? "Male" : "Not Specified");
            string college = ddlState.SelectedItem.Text;
            string major = DropDownList1.SelectedItem.Text;

            // Define regex patterns
            Regex nameRegex = new Regex(@"^[A-Z][a-z]+\s[A-Z][a-z]+$"); // Full name validation
            Regex phoneRegex = new Regex(@"^07\d{8}$"); // Phone number validation (07xxxxxxxx)
            Regex emailRegex = new Regex(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"); // Email validation
            Regex uniIdRegex = new Regex(@"^\d{10}$"); // University ID validation (exactly 10 digits)
            Regex passwordRegex = new Regex(@"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"); // Password validation

            // Validate inputs
            if (!nameRegex.IsMatch(fullName) || !phoneRegex.IsMatch(phoneNumber) || !emailRegex.IsMatch(emailAddress) ||
                !uniIdRegex.IsMatch(universityId) || !passwordRegex.IsMatch(password) || password != confirmPassword)
            {
                lblMessage.Text = "Please enter valid details.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "showError();", true);
                return;
            }
            else
            {
                lblMessage.Text = ""; // Clear error message when inputs are valid
            }


            // Define the file path (relative to project folder)
            string filePath = Server.MapPath("users.txt");

            // Create the file if it doesn't exist and add a header row
            if (!File.Exists(filePath))
            {
                using (StreamWriter sw = File.CreateText(filePath))
                {
                    sw.WriteLine("Full Name,Phone Number,University ID,Email,Password,Gender,College,Major");
                }
            }

            // Append user data to the file
            using (StreamWriter writer = File.AppendText(filePath))
            {
                writer.WriteLine($"{fullName},{phoneNumber},{universityId},{emailAddress},{password},{gender},{college},{major}");
            }

            // Show success message and redirect after 2 seconds
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "showSuccess();", true);
        }
    }


    


}

