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
        private KahnoUser currentuser = new KahnoUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            ////////checking if user is logged in, copy paste on every page, will redirect to login if not logged in and create the user object
            ///Don't use this one yet, we need a better version
            
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
            int lastID = KahnLib.getLastOrderID(currentuser.userid);
            if(lastID==0)
            {
                Label3.Text = "You haven't placed any orders yet!";
                ratingdiv.Visible = false;
            }
            else
            if (KahnLib.ratingUpToDate(currentuser.userid))
            {
                ratingdiv.Visible = false;
                Label3.Text = "Your ratings are up to date!";
            }
            Label2.Text = KahnLib.getLastOrderDate(lastID);



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
            KahnLib.createNewRating(currentuser.userid, int.Parse(TextBox1.Text), KahnLib.getLastOrderID(currentuser.userid));
            Response.Redirect("UserHome.aspx");
        }
    }
}