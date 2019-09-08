using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class ConfirmationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            KahnoUser userPull = new KahnoUser();
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

            int i = 0;
            foreach (int element in CurrentCart)
            {
                ListBox1.Items.Add(KahnLib.getOrder(CurrentCart[i], CurrentCartQuantity[i]));
                i++;
            }
            //Still testing this code!!.
            /*
            for (int x = 1; x <= Convert.ToInt32(Session["counter"]); x++)
            {
                ListBox1.Items.Add(Convert.ToString(Session[x.ToString()]));
            }
            */
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Success.aspx");
        }
    }
}