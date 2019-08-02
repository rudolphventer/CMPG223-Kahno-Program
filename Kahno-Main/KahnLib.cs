using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.OleDb;

namespace Kahno_Main
{
    public class KahnLib
    {
        private static string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30";


        public static bool NewUser(string fname, string lname, string email, string phone, string passwordhash, string latitude, string longitude)
        {




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
                //creating new user in db
                string insert_user = "INSERT INTO [USER] (firstname, lastname, email, phone, passwordHash, CoordinateID) VALUES(@fname, @lname, @email, @phone, @passwordhash, @CoordinateID)";
                string insert_coordinates = "INSERT INTO [COORDINATE] (longitude, latitude) VALUES(@longitude, @latitude)";
                string getlastcoordinateID = "SELECT * from [COORDINATE] where CoordinateID = LAST_INSERT_ID();";
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlConnection con = new SqlConnection(connectString);
                SqlCommand comm = new SqlCommand(insert_user, con);
                con.Open();
                comm.CommandText = insert_coordinates;
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("@longitude", longitude);
                comm.Parameters.AddWithValue("@latitude", latitude);
                //comm.ExecuteNonQuery();

                comm.CommandText = getlastcoordinateID;
                SqlDataReader dr = comm.ExecuteReader();
                dr.Read();
                int coords = int.Parse(dr.GetValue(0).ToString());


                comm.CommandText = insert_user;
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("@fname", fname);
                comm.Parameters.AddWithValue("@lname", lname);
                comm.Parameters.AddWithValue("@email", email);
                comm.Parameters.AddWithValue("@phone", phone);
                comm.Parameters.AddWithValue("@passwordhash", passwordhash);
                comm.Parameters.AddWithValue("@CoordinateID", coords);

                //comm.ExecuteNonQuery();
                con.Close();
                return true;
            }
        }

        public static bool NewUser()
        {
            string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30";

            string sqlGetUser = ("SELECT * FROM [USER]");

            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();


            SqlCommand comm = new SqlCommand(sqlGetUser, conn);
            SqlDataReader dr = comm.ExecuteReader();
            dr.Read();


            if (dr.GetValue(2).ToString() == "hello")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
    }