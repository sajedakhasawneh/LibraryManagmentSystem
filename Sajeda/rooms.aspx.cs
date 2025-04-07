using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5
{
    public partial class rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            string roomsFile = Server.MapPath("/Hani/Reservations.txt");
            string[] room = File.ReadAllLines(roomsFile);
            foreach (string line in room)
            {
                string[] roomData = line.Split('|');
                roomsHistory.InnerHtml += $"<tr><td>{roomData[0]}</td><td>{roomData[1]}</td><td>{roomData[2]}</td><td>{roomData[3]}</td></tr>";


            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("editProfile.aspx");
        }

    
    }

}

