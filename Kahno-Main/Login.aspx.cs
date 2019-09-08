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
            Session["localuser"] = null;
            byte[] test = null;
            System.Diagnostics.Debug.WriteLine("test "+Convert.ToString(test));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            KahnoUser authuser = new KahnoUser();
            if (KahnLib.Login(TextBox1.Text, KahnLib.HashPass(TextBox2.Text), ref authuser))
            {
                Session["localuser"] = authuser;
                Session["UID"] = authuser.userid;
                if (authuser.isowner == "y")
                {
                    Session["RID"] = authuser.restaurantno;
                    
                    Response.Redirect("Admin.aspx");
                }
                    
                else
                    Response.Redirect("UserHome.aspx");
                //Label5.Text = authuser.ToString();

            }
            else
            {
                Label4.Visible = true;
                
            }
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}