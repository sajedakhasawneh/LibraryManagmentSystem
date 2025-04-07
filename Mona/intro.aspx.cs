using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5.Mona
{
    public partial class intro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Suhaib/registration.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Suhaib/loginpage.aspx");
        }
    }
}
