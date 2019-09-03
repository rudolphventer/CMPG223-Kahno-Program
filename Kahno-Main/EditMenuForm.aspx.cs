using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class EditMenuForm : System.Web.UI.Page
    {
        private KahnoUser currentuser = new KahnoUser();
        KahnoRestaurant currentRestaurant = new KahnoRestaurant();
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

                if (currentuser.isowner == "n")
                    Response.Redirect("Login.aspx");
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
            ////////////////////////////////////////////////////////////////
            try
            {
                currentRestaurant = (KahnoRestaurant)Session["currentRestaurant"];
            }
            catch
            {
                Response.Redirect("Admin.aspx");
            }
            Label1.Text = "Menu for " + currentRestaurant.restaurantname;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            double price;
            double.TryParse(txtPrice.Text, out price);
            KahnLib.addMenuItem(txtDescription.Text, price, null, txtItemName.Text, currentuser.restaurantno);
            Response.Redirect("EditMenuForm.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void deleteMenuItem_Click(object sender, EventArgs e)
        {
            int menuitemid = Convert.ToInt32((sender as Button).CommandArgument);
            
            KahnLib.removeMenuItem(menuitemid);

            Response.Redirect("EditMenuForm.aspx");


        }
        protected void editMenuItem_Click(object sender, EventArgs e)
        {
            Session["itemID"] = Convert.ToInt32((sender as Button).CommandArgument);

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
        }
    }
}