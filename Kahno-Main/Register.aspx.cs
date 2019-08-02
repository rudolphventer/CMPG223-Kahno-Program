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
            string securepass = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox5.Text, "MD5");
            Label5.Text = securepass;
            //Response.Redirect("Register.aspx");
            KahnLib.NewUser(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox7.Text, TextBox8.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}