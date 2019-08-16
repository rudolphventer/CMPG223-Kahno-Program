using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Restaurants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Spur.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("KFC.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("BurgerKing.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("McDonalds.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nandos.aspx");
        }
    }
}