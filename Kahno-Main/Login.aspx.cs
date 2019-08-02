using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            KahnoUser currentUser = new KahnoUser();
            if (KahnLib.Login(TextBox1.Text, KahnLib.HashPass(TextBox2.Text), ref currentUser))
            {
                //Response.Redirect("Register.aspx");
                Label2.Text = currentUser.fname;
            }
            else
            {
                Label4.Visible = true;
            }
        }
    }
}