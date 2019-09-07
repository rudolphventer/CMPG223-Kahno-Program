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
            List<string> CurrentCart = new List<string>();
            List<int> CurrentCartQuantity = new List<int>();

            string final = "";
            decimal money = 0;
            int itmId = 0;
            int qty = 0;
            int tempIndex = 0;

            itmId = itemId;

            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sql = "SELECT itemId, price, itemName FROM [MENUITEM] WHERE ItemId ="+itmId;
            SqlCommand command = new SqlCommand(sql, conn);
            SqlDataReader dr = command.ExecuteReader();

            while (dr.Read())
            {
                money = dr.GetDecimal(2);
                final = money.ToString();
                //final = dr.GetFloat(2).ToString();
                //final = dr[2] as string; //.GetDecimal(2);
                //final = Convert.ToString(money);
                //final = dr.GetValue(0).ToString() + ", " + dr.GetDecimal(2).ToString() + ", " +  dr.GetSqlChars(4);

            }
            if (CurrentCart.Contains(final))
            {
                tempIndex = CurrentCart.IndexOf(final);
                qty = CurrentCartQuantity[tempIndex];
                CurrentCartQuantity[tempIndex] = qty + 1;
            }
            else
            {
                CurrentCart.Add(final);
                CurrentCartQuantity.Add(1);
            }

            return final;
        }










    }
}