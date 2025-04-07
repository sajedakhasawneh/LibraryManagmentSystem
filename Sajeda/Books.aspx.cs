using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string booksFile = Server.MapPath("~/borrowDetails.txt");
            string[] book = File.ReadAllLines(booksFile);
            foreach (string line in book)
            {
                string[] bookData = line.Split(',');
                bookhistory.InnerHtml +=  $"<tr><td>{bookData[0]}</td><td>{bookData[1]}</td><td>{bookData[2]}</td><td>{bookData[3]}</td><td>{bookData[4]}</td><td>{bookData[5]}</td></tr>";
            }
        }


        //protected void backbtn_Click1(object sender, EventArgs e)
        //{
        //    Response.Redirect("editProfile.aspx");
        //}

        protected void toBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("editProfile.aspx");
        }
    }
}