using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5.Habib
{
    public partial class Habib1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
		protected void ChangeView(object sender, EventArgs e)
		{
			// Get the CommandArgument from the clicked LinkButton
			var linkButton = (System.Web.UI.WebControls.LinkButton)sender;
			string viewName = linkButton.CommandArgument;

			// Debugging: Print the viewName to the output
			System.Diagnostics.Debug.WriteLine("Switching to view: " + viewName);

			// Switch to the corresponding view
			switch (viewName)
			{
				case "Dashboard":
					multiView.ActiveViewIndex = 0;
					break;
				case "Books":
					 Response.Redirect("\\Mona\\AdminBooks.aspx");

					break;
				case "Rooms":
					Response.Redirect("\\Hani\\AdminRooms.aspx");
					break;
				// Ignore "Feedback," "Team," and "Logout" cases
				case "Feedback":
				case "Team":
				case "Logout":
					// Do nothing
					break;
				default:
					multiView.ActiveViewIndex = 0; // Default to Dashboard
					break;
			}
		}

		protected void btnAddNewBook_Click(object sender, EventArgs e)
		{

		}

		protected void btnEdit1_Click(object sender, EventArgs e)
		{

		}

		protected void btnDelete1_Click(object sender, EventArgs e)
		{

		}

		protected void btnEdit2_Click(object sender, EventArgs e)
		{

		}

		protected void btnDelete2_Click(object sender, EventArgs e)
		{

		}

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

		protected void lnkDashboard_Click(object sender, EventArgs e)
		{

		}

		protected void lnkLogout_Click(object sender, EventArgs e)
		{
			Response.Redirect("\\Suhaib\\Loginpage.aspx");
		}
	}
}