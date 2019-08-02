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
            //checking if user exists
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

        public static bool Login(string email, string passwordhash)
        {
            //returns true if user is created successfully
            //checking if user exists
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
                    string get_user = "SELECT * FROM [USER] WHERE email = ''";

                    SqlDataAdapter adapter = new SqlDataAdapter();
                    SqlConnection con = new SqlConnection(connectString);
                    SqlCommand comm = new SqlCommand(get_user, con);
                    con.Open();
                    comm.Parameters.AddWithValue("@email", email);
                    SqlDataReader dataReader = comm.ExecuteReader();
                    dataReader.Read();
                    int coordsID = dataReader.GetInt32(0);
                    dataReader.Close();

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

    }
    }