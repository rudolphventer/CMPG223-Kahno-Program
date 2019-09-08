using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OleDb;

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
            Button1.Enabled = true;
            int ItemID = Convert.ToInt32((sender as Button).CommandArgument);
            int tempIndex = 0;
            int qty = 0;

            List<int> CurrentCart = new List<int>();
            List<int> CurrentCartQuantity = new List<int>();

            if(Session["list"] != null && Session["CartQuantity"] != null)
            {
                CurrentCart = (List<int>)Session["list"];
                CurrentCartQuantity = (List<int>)Session["CartQuantity"];

                if (!CurrentCart.Contains(ItemID))
                {
                    CurrentCart.Add(ItemID);
                    CurrentCartQuantity.Add(1);
                }
                else
                {
                    tempIndex = CurrentCart.IndexOf(ItemID);

                    qty = CurrentCartQuantity[tempIndex];
                    qty = qty + 1;
                    
                    CurrentCartQuantity[tempIndex] = qty;
                }
                Session["list"] = CurrentCart;
                Session["CartQuantity"] = CurrentCartQuantity;
            }
            else
            {
                CurrentCart.Add(ItemID);
                CurrentCartQuantity.Add(1);
                Session["list"] = CurrentCart;
                Session["CartQuantity"] = CurrentCartQuantity;
            }
            
            ListBox1.Items.Clear();
            Console.WriteLine(CurrentCart + " " + CurrentCartQuantity);
            int i = 0;
            foreach (int element in CurrentCart)
            { 
                ListBox1.Items.Add(KahnLib.getOrder(CurrentCart[i], CurrentCartQuantity[i]));
                i++;
            }

        }

        protected void RemoveFromOrder(object sender, EventArgs e)
        {
            //this is the function triggered by the "add to cart" button, ItemID is the id of the selected item, do with it what you will
            int ItemID = Convert.ToInt32((sender as Button).CommandArgument);
            Session["itemId"] = ItemID;
            Session["orderCount" + Session["itemId"]] = (Convert.ToInt32(Session["orderCount" + Session["itemId"]]) - 1).ToString();

            int tempIndex = 0;
            int qty = 0;

            List<int> CurrentCart = new List<int>();
            List<int> CurrentCartQuantity = new List<int>();

            if (Session["list"] != null && Session["CartQuantity"] != null)
            {
                CurrentCart = (List<int>)Session["list"];
                CurrentCartQuantity = (List<int>)Session["CartQuantity"];

                if (!CurrentCart.Contains(ItemID))
                {
                    CurrentCart.Add(ItemID);
                    CurrentCartQuantity.Add(1);
                }
                else
                {
                    tempIndex = CurrentCart.IndexOf(ItemID);

                    qty = CurrentCartQuantity[tempIndex];
                    qty = qty + 1;

                    CurrentCartQuantity[tempIndex] = qty;
                }
                Session["list"] = CurrentCart;
                Session["CartQuantity"] = CurrentCartQuantity;
            }
            else
            {
                CurrentCart.Add(ItemID);
                CurrentCartQuantity.Add(1);
                Session["list"] = CurrentCart;
                Session["CartQuantity"] = CurrentCartQuantity;
            }

            ListBox1.Items.Clear();
            Console.WriteLine(CurrentCart + " " + CurrentCartQuantity);
            int i = 0;
            foreach (int element in CurrentCart)
            {
                ListBox1.Items.Add(KahnLib.getOrder(CurrentCart[i], CurrentCartQuantity[i]));
                i++;
            }
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