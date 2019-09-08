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

        public static string getOrder(int id, int qty)
        {
            string final = "";

            string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sql = "SELECT itemId, price, itemName FROM [MENUITEM] WHERE ItemId =" + id;
            SqlCommand command = new SqlCommand(sql, conn);
            SqlDataReader dr = command.ExecuteReader();

            while (dr.Read())
            {
                final = dr.GetValue(0).ToString() + " " + dr.GetValue(2).ToString() + " : R" + dr.GetDecimal(1).ToString() + " " + qty;
            }

            return final;
        }
        protected void addToOrder(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32((sender as Button).CommandArgument);
            string final = "";
            int tempIndex = 0;
            int qty = 1;

            //code to receive data
            string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sql = "SELECT itemId, price, itemName FROM [MENUITEM] WHERE ItemId =" + ItemID;
            SqlCommand command = new SqlCommand(sql, conn);
            SqlDataReader dr = command.ExecuteReader();

            while (dr.Read())
            {
                final = dr.GetValue(0).ToString() + " " + dr.GetValue(2).ToString() + " : R" + dr.GetDecimal(1).ToString() + " ";
            }

            Console.WriteLine("Final " + final);

            Session["itemId"] = ItemID;
            Session["orderCount" + Session["itemId"]] = (Convert.ToInt32(Session["orderCount" + Session["itemId"]]) + 1).ToString();

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
                    CurrentCartQuantity.Insert(tempIndex, qty);
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

            //use itemId to request information from DB to get back the whole item 
            //Label1.Text = (ItemID).ToString();
            ListBox1.Items.Clear();
            Console.WriteLine(CurrentCart + " " + CurrentCartQuantity);
            int i = 0;
            foreach (int element in CurrentCart)
            {
                //Console.WriteLine($"Element #{count}: {element}");
                
                ListBox1.Items.Add(getOrder(CurrentCart[i], CurrentCartQuantity[i]));
                i++;
            }
            //tring outListBox = final + CurrentCartQuantity[tempIndex]; //KahnoOrderDetails.getMenuItem(ItemID);
            //ListBox1.Items.Add(outListBox);

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