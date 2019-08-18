using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class RestaurantMenuPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            KahnoRestaurant currentRestaurant = (KahnoRestaurant)Session["currentRestaurant"];
            Heading.InnerText = currentRestaurant.restaurantname;
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfirmationForm.aspx");
        }
    }
}