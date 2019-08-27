using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Kahno_Main
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (KahnLib.NewUser(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, KahnLib.HashPass(TextBox5.Text), double.Parse(TextBox7.Text), double.Parse(TextBox8.Text)))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label8.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {

        }
    }
}