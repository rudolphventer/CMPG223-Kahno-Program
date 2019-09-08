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
        KahnoUser currentuser = new KahnoUser();
        public void Page_Load(object sender, EventArgs e)
        {
            myaccountbutton.Visible = false;
            registerbutton.Visible = true;
            loginbutton.Visible = true;
            homebutton.Visible = false;
            adminhome.Visible = false;
            logoutbutton.Visible = false;
            editrestaurant.Visible = false;
            editmenuform.Visible = false;
            recieveorders.Visible = false;


            if (Session["localuser"] != null)
            {
                currentuser = (KahnoUser)Session["localuser"];
                if (currentuser.isowner == "y")
                {
                    registerbutton.Visible = false;
                    loginbutton.Visible = false;
                    myaccountbutton.Visible = true;
                    homebutton.Visible = false;
                    adminhome.Visible = true;
                    logoutbutton.Visible = true;
                    editrestaurant.Visible = true;
                    editmenuform.Visible = true;
                    recieveorders.Visible = true;

                }
                else
                {
                    registerbutton.Visible = false;
                    loginbutton.Visible = false;
                    myaccountbutton.Visible = true;
                    homebutton.Visible = true;
                    adminhome.Visible = false;
                    logoutbutton.Visible = true;
                }
                

            }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }


        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        public void homeclick(object sender, EventArgs e)
        {
            if (currentuser.isowner == "y")
                Response.Redirect("Admin.aspx");
            else
                Response.Redirect("UserHome.aspx");
        }
    }
}