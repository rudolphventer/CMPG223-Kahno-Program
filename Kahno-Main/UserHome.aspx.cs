using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class UserHome : System.Web.UI.Page
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
                Session["UserID"] = currentuser.userid;
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
            ////////////////////////////////////////////////////////////////
            ///
            Label1.Text = "Welcome " + currentuser.fname + " " + currentuser.lname;

            Label2.Text = KahnLib.getLastOrderDate(currentuser.userid);
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantsForm.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditUserInfoForm.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantsForm.aspx");
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
             
        }
    }
}