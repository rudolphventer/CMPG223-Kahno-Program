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
                currentuser = (KahnoUser)Session["localuser"];
                if (currentuser.userid == 0)
                    Response.Redirect("Login.aspx");

                if (currentuser.restaurantno == 0)
                    Response.Redirect("CreateRestaurantForm.aspx");
                if (currentuser.isowner == "n")
                Response.Redirect("Login.aspx");

            ////////////////////////////////////////////////////////////////

            /////////////creatign restaurant object
            ///
            KahnoRestaurant currentRestaurant = new KahnoRestaurant();
            KahnLib.getRestaurant(currentuser.restaurantno, ref currentRestaurant);
            Session["currentRestaurant"] = currentRestaurant;
            //////////////
            //Label3.Text = "Welcome " + currentuser.fname + " Your restaurant is " + currentRestaurant.restaurantname + currentuser.restaurantno + (Int32)Session["RID"];
            
            Label3.Text = "Welcome " + currentuser.fname + ", owner of " + currentRestaurant.restaurantname + " with restaurant ID: " + (Int32)Session["RID"];

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}