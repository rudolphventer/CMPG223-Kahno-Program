using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////////checking if user is logged in, copy paste on every page, will redirect to login if not logged in and create the user object
            ///Don't use this one yet, we need a better version
            KahnoUser currentuser = new KahnoUser();
            try
            {
                currentuser = (KahnoUser)Session["localuser"];
                if (currentuser.userid == 0)
                    Response.Redirect("Login.aspx");
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
            ////////////////////////////////////////////////////////////////

            Label2.Text = currentuser.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            KahnLib.NewRestaurant("Testaurant2", "0832224444", 25.4444, -24.3423);
               
        }
    }
}