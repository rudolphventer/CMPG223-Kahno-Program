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

        public static bool getRestaurant(int id, ref KahnoRestaurant restaurantOBJ)
        {
            //checking if restaurant exists
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sqlGetUser = ("SELECT * FROM [RESTAURANT] WHERE RestaurantID = @id");
            SqlCommand commquery = new SqlCommand(sqlGetUser, conn);
            commquery.Parameters.AddWithValue("@id", id);
            SqlDataReader drquery = commquery.ExecuteReader();
            drquery.Read();


            if (drquery.HasRows)
            {
                restaurantOBJ = new KahnoRestaurant(drquery.GetInt32(0), drquery.GetValue(1).ToString(), drquery.GetValue(2).ToString(), drquery.GetInt32(3));
                return true;
            }
            else
            {
                return false;
            }
        }

        public static int UpdateUserDetails(int id, string firstname, string lastname, string phone, string email)
        {
            int rowsAffected = -1;
            SqlConnection conn = new SqlConnection(connectString);
            
            string sql = "UPDATE [USER] SET firstname = @fname, lastname = @lname, phone = @phone, email = @email where UserID = @id";

            SqlCommand command = new SqlCommand(sql, conn);
            command = new SqlCommand(sql, conn);
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@fname", firstname);
            command.Parameters.AddWithValue("@lname", lastname);
            command.Parameters.AddWithValue("@email", email);
            command.Parameters.AddWithValue("@phone", phone);

            conn.Open();
            rowsAffected = command.ExecuteNonQuery();
            command.Dispose();
            conn.Close();

            return rowsAffected;
        }

        public static int AssignRestaurant(int restID, int uID)
        {
            int rowsAffected = -1;
            SqlConnection conn = new SqlConnection(connectString);

            string sql = "UPDATE [USER] SET RestaurantNumber = @restid where UserID = @uid";

            SqlCommand command = new SqlCommand(sql, conn);
            command = new SqlCommand(sql, conn);
            command.Parameters.AddWithValue("@restid", restID);
            command.Parameters.AddWithValue("@uid", uID);

            conn.Open();
            rowsAffected = command.ExecuteNonQuery();
            command.Dispose();
            conn.Close();

            return rowsAffected;
        }

        //Addmenuitem -- Kyle
        public static void addMenuItem(string description, double price, string imageURL, string itemName, int restaurantID)
        {
            SqlConnection conn = new SqlConnection(connectString);
            try
            {

                
                conn.Open();
                SqlCommand command;
                SqlDataAdapter dataAdapter = new SqlDataAdapter();

                //I think the itemID for each menu item should generate itself as it would be a primary key. 
                string sqlAddItem = "INSERT INTO [MENUITEM] (description, price, imageURL, itemName, restaurantID) VALUES(@Description, @price, @itemImageURL, @itemName, @restaurantID)";

                command = new SqlCommand(sqlAddItem, conn);
                
                command.Parameters.AddWithValue("@Description", description);
                command.Parameters.AddWithValue("@price", price);
                command.Parameters.AddWithValue("@itemImageURL", imageURL);
                command.Parameters.AddWithValue("@itemName", itemName);
                command.Parameters.AddWithValue("@restaurantID", restaurantID);

                dataAdapter.InsertCommand = new SqlCommand(sqlAddItem, conn);
                //Does there need to be extra error handling over here?
                dataAdapter.InsertCommand.ExecuteNonQuery();

                command.Dispose();
                conn.Close();
            }
            catch(SqlException err)
            {
                string message = err.ToString();
                conn.Close();
            }
        }
        //removemenuitem -- Kyle
        public static void removeMenuItem(int id)
        {
            SqlConnection conn = new SqlConnection(connectString);
            try
            {


                conn.Open();
                SqlCommand command;
                SqlDataAdapter dataAdapter = new SqlDataAdapter();

                string sqlAddItem = "DELETE FROM [MENUITEM] WHERE ItemID = " + id;

                command = new SqlCommand(sqlAddItem, conn);

                dataAdapter.DeleteCommand = new SqlCommand(sqlAddItem, conn);
                dataAdapter.DeleteCommand.ExecuteNonQuery();

                command.Dispose();
                conn.Close();
            }
            catch (SqlException err)
            {
                string message = err.ToString();
                conn.Close();
            }
        }

        public static void removeUser(int id)
        {
            SqlConnection conn = new SqlConnection(connectString);
            try
            {


                conn.Open();
                SqlCommand command;
                SqlDataAdapter dataAdapter = new SqlDataAdapter();

                string sqlAddItem = "DELETE FROM [USER] WHERE UserID = " + id;

                command = new SqlCommand(sqlAddItem, conn);

                dataAdapter.DeleteCommand = new SqlCommand(sqlAddItem, conn);
                dataAdapter.DeleteCommand.ExecuteNonQuery();

                command.Dispose();
                conn.Close();
            }
            catch (SqlException err)
            {
                string message = err.ToString();
                conn.Close();
            }
        }
        //modifymenuitem -- Kyle
        public static void modifyMenuItem(int itemID, string description, double price, string imageURL, string itemName)
        {
            SqlConnection conn = new SqlConnection(connectString);
            try
            {


                conn.Open();
                SqlCommand command;
                SqlDataAdapter dataAdapter = new SqlDataAdapter();
                //not sure if this is correct
                string sqlAddItem = "UPDATE [MENUITEM] SET Description = @description, price = @price, itemImageURL = @itemURL, itemName = @itemName WHERER itemID = " + itemID;

                command = new SqlCommand(sqlAddItem, conn);
                //should we be able to change the restaurantID? A restaurant may sell their IP to another restaurant?
                command.Parameters.AddWithValue("@Description", description);
                command.Parameters.AddWithValue("@price", price);
                command.Parameters.AddWithValue("@itemImageURL", imageURL);
                command.Parameters.AddWithValue("@itemName", itemName);
                

                dataAdapter.UpdateCommand = new SqlCommand(sqlAddItem, conn);
                //Does there need to be extra error handling over here? 
                dataAdapter.UpdateCommand.ExecuteNonQuery();

                command.Dispose();
                conn.Close();
            }
            catch (SqlException err)
            {
                string message = err.ToString();
                conn.Close();
            }
        }

        //placeorder -- Kelvin(actually Kyle)
        public static void placeOrder(int userID, int restaurantID, int quantity, double price, int itemID)
        {
            string createOrder = "INSERT INTO [ORDER] (userID, OrderDate, restaurantID, OrderDetailID) VALUES(@userid, @restaurantid, @detailid, )";
            string fetchOrderID = "SELECT OrderNumber FROM [ORDER] WHERE OrderDetailID =@detailid";


        }
        //cancelorder -- Kelvin(actually Kyle)
        public static void cancelOrder(int orderID)
        {

        }

        //addrestaurant -- Rudolph

        //imagetobytes -- Harry

        public static int NewRestaurant(string name, string phone, double latitude, double longitude)
        {
            //returns true if restaurant is created successfully
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();
            int restID = 0;
            string sqlRestaurant = ("SELECT * FROM [RESTAURANT] WHERE phoneNumber =@phone AND RestaurantName =@name");
            SqlCommand commquery = new SqlCommand(sqlRestaurant, conn);
            commquery.Parameters.AddWithValue("@name", name);
            commquery.Parameters.AddWithValue("@phone", phone);
            SqlDataReader drquery = commquery.ExecuteReader();
            drquery.Read();

            if (drquery.HasRows)
            {
                return 0;
            }
            else
            {
                try
                {
                    //creating new restaurant in db
                    string insert_restaurant = "INSERT INTO [RESTAURANT] (phoneNumber, RestaurantName, CoordinatesID) VALUES(@phoneNumber, @name, @CoordinateID)";
                    string insert_coordinates = "INSERT INTO [COORDINATE] (longitude, latitude) VALUES(@longitude, @latitude)";
                    string getlastcoordinateID = "SELECT TOP 1 * FROM COORDINATE ORDER BY CoordinateID DESC";
                    string getlastrestaurantID = "SELECT TOP 1 * FROM [RESTAURANT] ORDER BY RestaurantID DESC";

                    SqlDataAdapter adapter = new SqlDataAdapter();
                    SqlConnection con = new SqlConnection(connectString);
                    SqlCommand comm = new SqlCommand(insert_restaurant, con);
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
                    comm.CommandText = getlastrestaurantID;
                    dataReader.Close();
                    dataReader = comm.ExecuteReader();
                    dataReader.Read();
                    restID = dataReader.GetInt32(0);
                    dataReader.Close();
                    //creating new restaurant
                    comm.CommandText = insert_restaurant;
                    comm.Parameters.Clear();
                    comm.Parameters.AddWithValue("@name", name);
                    comm.Parameters.AddWithValue("@phoneNumber", phone);
                    comm.Parameters.AddWithValue("@CoordinateID", coordsID);
                    comm.ExecuteNonQuery();
                    con.Close();
                    //closing as true
                    return restID;
                }
                catch(SqlException m)
                {
                    return restID;
                }
            }
        }

        public static int UpdateRestaurantDetails(int id, string restaurantname, string phone)
        {
            int rowsAffected = -1;
            SqlConnection conn = new SqlConnection(connectString);

            string sql = "UPDATE [RESTAURANT] SET RestaurantName = @rname, phoneNumber = @phone where RestaurantID=@id";

            SqlCommand command = new SqlCommand(sql, conn);
            command = new SqlCommand(sql, conn);
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@rname", restaurantname);
            command.Parameters.AddWithValue("@phone", phone);

            conn.Open();
            rowsAffected = command.ExecuteNonQuery();
            command.Dispose();
            conn.Close();

            return rowsAffected;
        }

    }
    }