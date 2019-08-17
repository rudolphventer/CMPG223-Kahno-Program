using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantsForm.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditUserInfoForm.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }
    }
}