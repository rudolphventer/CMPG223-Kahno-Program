using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class EditRestaurantForm : System.Web.UI.Page
    {
        KahnoRestaurant currentRestaurant = new KahnoRestaurant();
        KahnoUser currentuser = new KahnoUser();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                //populating user object
                currentuser = (KahnoUser)Session["localuser"];
                if (currentuser.userid == 0)
                    Response.Redirect("Login.aspx");
                //populating restaurant object
                KahnLib.getRestaurant(currentuser.restaurantno, ref currentRestaurant);
                Session["currentRestaurant"] = currentRestaurant;
                //passing user to the new restaurant screen if they do not have one
                if (currentRestaurant.restaurantID == 0)
                    Response.Redirect("CreateRestaurantForm.aspx");
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }

            if (!this.IsPostBack)
            {
                TextBox1.Text = currentRestaurant.restaurantname;
                TextBox2.Text = currentRestaurant.phone;
            }
        }


    protected void Button1_Click(object sender, EventArgs e)
            {
            //     Session["temprname"] = TextBox1.Text;
            FileUpload img = (FileUpload)imgUpload;
            Byte[] imgByte = null;
            if (img.HasFile && img.PostedFile != null)
            {
            //To create a PostedFile
            HttpPostedFile File = imgUpload.PostedFile;
            /*//Create byte Array with file len
            imgByte = new Byte[File.ContentLength];
            //force the control to load data in array
            File.InputStream.Read(imgByte, 0, File.ContentLength);*/
            

                if (KahnLib.UpdateRestaurantDetails(currentRestaurant.restaurantID, TextBox1.Text, TextBox2.Text) > 0 && KahnLib.updateCoordinateDetails(currentuser.coodinateid, Convert.ToDouble(TextBox4.Text), Convert.ToDouble(TextBox3.Text)) > 0)
                    Label5.Text = "Successfully Updated!";
                else
                    Label5.Text = "Update not successful!";
                Label5.Visible = true;
                KahnLib.UpdateRestaurantDetailsimg(currentRestaurant.restaurantID, TextBox1.Text, TextBox2.Text, File);
            }
            //else
            //  Label5.Text = "Update not successful!";
            //Label5.Visible = true;
            }
        }
}