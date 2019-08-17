using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            myaccountbutton.Visible = false;

            if (Session["localuser"] != null)
            {
                registerbutton.Visible = false;
                loginbutton.Visible = false;
                myaccountbutton.Visible = true;
                KahnoUser currentuser = new KahnoUser();
            }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }


        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
    }
}