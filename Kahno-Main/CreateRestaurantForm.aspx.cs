using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class CreateRestaurantForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (KahnLib.NewRestaurant(TextBox1.Text, TextBox4.Text, double.Parse(TextBox7.Text), double.Parse(TextBox8.Text)))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label8.Visible = true;
            }
        }
    }
}