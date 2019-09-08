using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public class KahnoOrderDetails
    {
        private static string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30";
        

        public static string getMenuItem(int itemId)
        {
            //List[index]; //gets the value at this place 

            //need to generate code to fetch the data needed, and also add quantity.
            List<int> CurrentCart = new List<int>();
            List<int> CurrentCartQuantity = new List<int>();

            string final = "";
            int currentcartadd = 0;
            decimal money = 0;
            int itmId = 0;
            int qty = 1;
            int tempIndex = 0;
            
            int num = 1;

            itmId = itemId;

            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sql = "SELECT itemId, price, itemName FROM [MENUITEM] WHERE ItemId ="+itmId;
            SqlCommand command = new SqlCommand(sql, conn);
            SqlDataReader dr = command.ExecuteReader();

            while (dr.Read())
            {
                final = dr.GetValue(0).ToString() + " " + dr.GetValue(2).ToString() + " : R"  + dr.GetDecimal(1).ToString() + " " + qty.ToString();
                currentcartadd = itmId;
            }
  
            if (CurrentCart.Contains(itemId))
            {
                tempIndex = CurrentCart.IndexOf(itmId);
                qty = CurrentCartQuantity[tempIndex];
                CurrentCartQuantity.Insert(tempIndex ,qty + 1);
            }
            else
            {
                CurrentCart.Add(itemId);
                CurrentCartQuantity.Add(num);
            }

            return final;
        }










    }
}