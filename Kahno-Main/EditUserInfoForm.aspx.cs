using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;


namespace Kahno_Main
{
    public partial class EditUserInfoForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            KahnoUser currentuser = new KahnoUser();
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

            txtBoxFname.Text = currentuser.fname;
            txtBoxLname.Text = currentuser.lname;
            txtBoxPhoneNum.Text = currentuser.phone;
            txtBoxEmail.Text = currentuser.email;
        }

        protected void btnUpdateInfo_Click(object sender, EventArgs e)
        {
            txtBoxFname.ReadOnly = false;
            txtBoxLname.ReadOnly = false;
            txtBoxPhoneNum.ReadOnly = false;
            txtBoxEmail.ReadOnly = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //HERE. Can not get the function. Also this is all just rough work for now. Will clean up later.
            //KahnLib.
            //KahnLib.UpdateUserDetails();
        }
    }
}