using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class CreateRestaurantForm : System.Web.UI.Page
    {
        public KahnoUser currentuser = new KahnoUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            ////////checking if user is logged in, copy paste on every page, will redirect to login if not logged in and create the user object
            ///Don't use this one yet, we need a better version
            try
            {
                currentuser = (KahnoUser)Session["localuser"];
                if (currentuser.userid == 0)
                    Response.Redirect("Login.aspx");
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
            ////////////////////////////////////////////////////////////////
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            FileUpload img = (FileUpload)imgUpload;
            //Byte[] imgByte = null;
            int RID = 0;
            if (img.HasFile && img.PostedFile != null)
            {
                HttpPostedFile File = imgUpload.PostedFile;
                RID = KahnLib.NewRestaurant(TextBox1.Text, TextBox4.Text, double.Parse(TextBox7.Text), double.Parse(TextBox8.Text), File);

            }

            
            if (RID > 0)
            {
                KahnLib.AssignRestaurant(RID, currentuser.userid);
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label8.Visible = true;
            }
        }
    }
}