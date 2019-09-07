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
            if (IsPostBack == false)
            {
                Session["orderCount"] = 0;
                Session["counter"] = 0;
            }


        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfirmationForm.aspx");
        }
        protected void addToOrder(object sender, EventArgs e)
        {
            
            //this is the function triggered by the "add to cart" button, ItemID is the id of the selected item, do with it what you will

            int ItemID = Convert.ToInt32((sender as Button).CommandArgument);
            
            Session["itemId"] = ItemID;
            Session["orderCount" + Session["itemId"]] = (Convert.ToInt32(Session["orderCount" + Session["itemId"]]) + 1).ToString();

            //testing gridview insert
            //GridView1

            //use itemId to request information from DB to get back the whole item 
            Label1.Text = (ItemID).ToString();

            //trying the solution - send request to method in kahnoLib to get back the product line needed

            string outListBox = KahnoOrderDetails.getMenuItem(ItemID);
            ListBox1.Items.Add(outListBox);

        }

        protected void RemoveFromOrder(object sender, EventArgs e)
        {
            //this is the function triggered by the "add to cart" button, ItemID is the id of the selected item, do with it what you will
            int ItemID = Convert.ToInt32((sender as Button).CommandArgument);
            Session["itemId"] = ItemID;
            Session["orderCount" + Session["itemId"]] = (Convert.ToInt32(Session["orderCount" + Session["itemId"]]) - 1).ToString();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfirmationForm.aspx");
        }
    }
}