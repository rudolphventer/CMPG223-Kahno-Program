using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace Kahno_Main
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////////checking if user is logged in, copy paste on every page, will redirect to login if not logged in and create the user object
            ///Don't use this one yet, we need a better version
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
            ////////////////////////////////////////////////////////////////

            Label2.Text = currentuser.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            KahnLib.NewRestaurant("Testaurant2", "0832224444", 25.4444, -24.3423);
               
        }
        //harry... in progress have to store it correctly 
        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection connection = null;
            try
            {
                FileUpload img = (FileUpload)imgUpload;
                Byte[] imgByte = null;
                if (img.HasFile && img.PostedFile != null)
                {
                    //To create a PostedFile
                    HttpPostedFile File = imgUpload.PostedFile;
                    //Create byte Array with file len
                    imgByte = new Byte[File.ContentLength];
                    //force the control to load data in array
                    File.InputStream.Read(imgByte, 0, File.ContentLength);
                }
                // Insert the employee name and image into db
                /*string conn = KahnLib.getConn();
                connection = new SqlConnection(conn);

                connection.Open();
                string sql = "INSERT INTO [RESTAURANT] (phoneNumber, RestaurantName, CoordinatesID) VALUES(@phoneNumber, @name, @CoordinateID)";
                SqlCommand cmd = new SqlCommand(sql, connection);
                
                int id = Convert.ToInt32(cmd.ExecuteScalar());*/
                
            }
            catch
            {
               // lblResult.Text = "There was an error";
            }
            finally
            {
                connection.Close();
            }
        }
    }
}