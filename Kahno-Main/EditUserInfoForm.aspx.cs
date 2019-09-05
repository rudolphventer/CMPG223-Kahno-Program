using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;


namespace Kahno_Main
{
    public partial class EditUserInfoForm : System.Web.UI.Page
    {
        KahnoUser currentuser = new KahnoUser();

        protected void Page_Load(object sender, EventArgs e)
        {
            
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

            if (!this.IsPostBack)
            {
                TextBox1.Text = currentuser.fname;
                TextBox2.Text = currentuser.lname;
                TextBox3.Text = currentuser.phone;
                TextBox4.Text = currentuser.email;
            }
            

        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["tempfname"] = TextBox1.Text;

            if (KahnLib.UpdateUserDetails(currentuser.userid, Session["tempfname"].ToString(), TextBox2.Text, TextBox3.Text, TextBox4.Text) > 0)
            {
                Label5.Text = "Successfully Updated!";

                Response.Redirect("Login.aspx");
            }
            else
                Label5.Text = "Update not successful!";
            Label5.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            KahnLib.removeUser(currentuser.userid);
            currentuser = null;
            Session["localuser"] = null;
            Response.Redirect("Login.aspx");

        }

        protected void btnCoordinate_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}