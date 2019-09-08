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
    public partial class ConfirmationForm : System.Web.UI.Page
    {
        KahnoUser userPull = new KahnoUser();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                userPull = (KahnoUser)Session["localuser"];
                if (userPull.userid == 0)
                    Response.Redirect("Login.aspx");
                lblName.Text = userPull.fname;
                lblPhone.Text = userPull.phone;
                lblEmail.Text = userPull.email;
                lblAddress.Text = (userPull.coodinateid).ToString();
                lblId.Text = (userPull.userid).ToString();
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }


            List<int> CurrentCart = new List<int>();
            List<int> CurrentCartQuantity = new List<int>();

            if (Session["list"] != null && Session["CartQuantity"] != null)
            {
                CurrentCart = (List<int>)Session["list"];
                CurrentCartQuantity = (List<int>)Session["CartQuantity"];

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            double total = 0;
            double grandtotal = 0;
            int i = 0;
            foreach (int element in CurrentCart)
            {
                total = CurrentCartQuantity[i] * KahnLib.getOrderPrice(CurrentCart[i]);
                grandtotal += total;
                ListBox1.Items.Add(KahnLib.getOrder(CurrentCart[i], CurrentCartQuantity[i]) + " = R" + total);
                i++;
            }
            ListBox1.Items.Add("Total: R" + grandtotal);
            ListBox1.Items.Add("\n Thank you for ordering with Kahno!!, Enjoy your meal and dont forget to rate your service!.");
            
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
           

            DateTime time = DateTime.Now;             
            string format = "yyyy-MM-dd HH:mm:ss";
            string finaltime = time.ToString(format);

            //insert into db first then get orderNumber 
            KahnLib.InsertOrder(finaltime);

            int orderNumber = KahnLib.getOrderNumber();



            List<int> CurrentCart = new List<int>();
            List<int> CurrentCartQuantity = new List<int>();

            if (Session["list"] != null && Session["CartQuantity"] != null)
            {
                CurrentCart = (List<int>)Session["list"];
                CurrentCartQuantity = (List<int>)Session["CartQuantity"];

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            double total = 0; 
            int i = 0;

            foreach (int element in CurrentCart)
            {
                total = CurrentCartQuantity[i] * KahnLib.getOrderPrice(CurrentCart[i]);
                KahnLib.getOrder(CurrentCart[i], CurrentCartQuantity[i]); 
                string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30";
                SqlConnection conn = new SqlConnection(connectString);
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlConnection con = new SqlConnection(connectString);
                string insert_query = "INSERT INTO [ORDERDETAIL] (Quantity,OrderNumber,PricePaidPerItem,ItemNumber) VALUES(@quantity,@OrderNo,@total,@itemNo)";
                SqlCommand comm = new SqlCommand(insert_query, conn);

                comm.Parameters.AddWithValue("@quantity", CurrentCartQuantity[i]);
                comm.Parameters.AddWithValue("@OrderNo", orderNumber);
                comm.Parameters.AddWithValue("@total", total);
                comm.Parameters.AddWithValue("@itemNo", CurrentCart[i]);
                comm.ExecuteNonQuery();
                con.Close();
                comm.Dispose();    
                i++;
            }
            Response.Redirect("Success.aspx");
        }
    }
}