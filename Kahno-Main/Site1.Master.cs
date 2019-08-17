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
            KahnoUser currentuser = new KahnoUser();
            try
            {
                currentuser = (KahnoUser)Session["localuser"];
                if (currentuser.userid > 0)
                {
                    registerbutton.Visible = true;
                    loginbutton.Visible = true;
                }
                else
                {
                    registerbutton.Visible = false;
                    loginbutton.Visible = false;
                }
                    
            }
            finally
            {

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