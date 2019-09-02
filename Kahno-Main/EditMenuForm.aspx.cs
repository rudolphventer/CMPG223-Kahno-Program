using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class EditMenuForm : System.Web.UI.Page
    {
        private KahnoUser currentuser = new KahnoUser();
        protected void Page_Load(object sender, EventArgs e)
        {

            ////////checking if user is logged in, copy paste on every page, will redirect to login if not logged in and create the user object
            ///Don't use this one yet, we need a better version
            
            try
            {
                currentuser = (KahnoUser)Session["localuser"];
                if (currentuser.userid == 0)
                    Response.Redirect("Login.aspx");
                Session["UserID"] = currentuser.userid;
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
            ////////////////////////////////////////////////////////////////
            ///
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            double price;
            double.TryParse(txtPrice.Text, out price);
            KahnLib.addMenuItem(txtDescription.Text, price, null, txtItemName.Text, currentuser.restaurantno);
        }
    }
}