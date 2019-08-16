using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Web.Security;

namespace Kahno_Main
{
    public class KahnLib
    {
        private static string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30";

        public static string HashPass(string password)
        {

            return FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
        }
        public static bool NewUser(string fname, string lname, string email, string phone, string passwordhash, double latitude, double longitude)
        {
            //returns true if user is created successfully
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();
            string sqlGetUser = ("SELECT * FROM [USER] WHERE email ='" + email + "'");
            SqlCommand commquery = new SqlCommand(sqlGetUser, conn);
            SqlDataReader drquery = commquery.ExecuteReader();
            drquery.Read();

            if (drquery.HasRows)
            {
                return false;
            }
            else
            {
                try
                {
                    //creating new user in db
                    string insert_user = "INSERT INTO [USER] (firstname, lastname, email, phone, passwordHash, CoordinateID) VALUES(@fname, @lname, @email, @phone, @passwordhash, @CoordinateID)";
                    string insert_coordinates = "INSERT INTO [COORDINATE] (longitude, latitude) VALUES(@longitude, @latitude)";
                    string getlastcoordinateID = "SELECT TOP 1 * FROM COORDINATE ORDER BY CoordinateID DESC";

                    SqlDataAdapter adapter = new SqlDataAdapter();
                    SqlConnection con = new SqlConnection(connectString);
                    SqlCommand comm = new SqlCommand(insert_user, con);
                    con.Open();
                    //create new coodrinate
                    comm.CommandText = insert_coordinates;
                    comm.Parameters.Clear();
                    comm.Parameters.AddWithValue("@longitude", longitude);
                    comm.Parameters.AddWithValue("@latitude", latitude);
                    comm.ExecuteNonQuery();
                    //reading ID of new coordinate
                    comm.CommandText = getlastcoordinateID;
                    SqlDataReader dataReader = comm.ExecuteReader();
                    dataReader.Read();
                    int coordsID = dataReader.GetInt32(0);
                    dataReader.Close();
                    //creating new user
                    comm.CommandText = insert_user;
                    comm.Parameters.Clear();
                    comm.Parameters.AddWithValue("@fname", fname);
                    comm.Parameters.AddWithValue("@lname", lname);
                    comm.Parameters.AddWithValue("@email", email);
                    comm.Parameters.AddWithValue("@phone", phone);
                    comm.Parameters.AddWithValue("@passwordhash", passwordhash);
                    comm.Parameters.AddWithValue("@CoordinateID", coordsID);
                    comm.ExecuteNonQuery();
                    con.Close();
                    //closing as true
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public static bool Login(string email, string passwordhash, ref KahnoUser authuser)
        {
            //checking if user exists
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sqlGetUser = ("SELECT * FROM [USER] WHERE email = @email AND passwordHash = @passwordhash");
            SqlCommand commquery = new SqlCommand(sqlGetUser, conn);
            commquery.Parameters.AddWithValue("@email", email);
            commquery.Parameters.AddWithValue("@passwordhash", passwordhash);
            SqlDataReader drquery = commquery.ExecuteReader();
            drquery.Read();
            

            if (drquery.HasRows)
            {
                authuser = new KahnoUser(drquery.GetInt32(0), drquery.GetValue(1).ToString(), drquery.GetValue(2).ToString(), drquery.GetValue(3).ToString(), drquery.GetValue(4).ToString(), drquery.GetInt32(6), drquery.GetValue(7).ToString(), drquery.GetInt32(8));
                return true;
            }
            else
            {
                return false;
            }
        }
        //Addmenuitem -- Kyle
        //removemenuitem -- Kyle
        //modifymenuitem -- Kyle
        //placeorder -- Kelvin
        //cancelorder -- Kelvin
        //addrestaurant -- Rudolph
        //imagetobytes -- Harry
        //updateUserDetails -- Marno
        
        

    }
    }