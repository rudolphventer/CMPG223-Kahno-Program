using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class RestaurantMenuPage : System.Web.UI.Page
    {

        public int SelectedIndex { get; set; }

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

            //what harry tried
            //Session["counter"] = Convert.ToInt32(Session["counter"]) + 1;
            //Session[Convert.ToString(Session["counter"])] = Convert.ToString(GridView1.Rows[1].Cells[1]);
            
            //last part is just to add to the gridview
            //GridView1.Rows[ItemID].Cells[5] = Session["orderCount" + Session["itemId"]];

            //int rowIndex = GridView1
            //Session[(Session["orderCount"]).ToString() + "Name"] = row.Cells[1].Text;
            //Session[(Session["orderCount"]).ToString() + "Name"] = Convert.ToString(GridView1.Rows[0].Cells[1]).ToString();
            //int request = GridView1.ID[GridView1.SelectedIndex];
            //Session["OrderRequestNo"] = request;
            //testlbl.Text = (Session["orderCount" + Session["itemId"]]).ToString();
            //Session[(Session["orderCount"]).ToString() + "Name"] = GridView1.SelectRow(ItemID);
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
            //int requested = GridView1.SelectedIndex;
            //Session["OrderRequestNo"] = requested;
        }

        protected void BtnOrder_Click1(object sender, EventArgs e)
        {
            Response.Redirect("ConfirmationForm.aspx");
        }
    }
}