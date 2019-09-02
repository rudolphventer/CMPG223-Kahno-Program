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

            //Still testing this code!!.
            /*
            for (int x = 1; x <= Convert.ToInt32(Session["counter"]); x++)
            {
                ListBox1.Items.Add(Convert.ToString(Session[x.ToString()]));
            }
            */
        }

    }
}