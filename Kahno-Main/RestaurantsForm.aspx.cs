using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class RestaurantsForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkSelect_Click(object sender, EventArgs e)
        {
            int restaurantID = Convert.ToInt32((sender as Button).CommandArgument);
            KahnoRestaurant currentRestaurant = new KahnoRestaurant();
            KahnLib.getRestaurant(restaurantID, ref currentRestaurant);
            Session["currentRestaurant"] = currentRestaurant;

            Session["restaurantID"] = currentRestaurant.restaurantID;
            Response.Redirect("RestaurantMenuPage.aspx");
  
            
            
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantMenuPage.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantMenuPage.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantMenuPage.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantMenuPage.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantMenuPage.aspx");
        }
    }
}