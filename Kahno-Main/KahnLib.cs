using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Web.Security;
using System.Web.UI.WebControls;


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

        public static string getOrder(int id, int qty)
        {
            string final = "";

            string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sql = "SELECT itemId, price, itemName FROM [MENUITEM] WHERE ItemId =" + id;
            SqlCommand command = new SqlCommand(sql, conn);
            SqlDataReader dr = command.ExecuteReader();

            while (dr.Read())
            {
                final = dr.GetValue(0).ToString() + " " + dr.GetValue(2).ToString() + " : R" + dr.GetDecimal(1).ToString() + " " + qty;
            }

            return final;
        }

        public static double getOrderPrice(int id)
        {
            double final = 0;

            string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sql = "SELECT itemId, price, itemName FROM [MENUITEM] WHERE ItemId =" + id;
            SqlCommand command = new SqlCommand(sql, conn);
            SqlDataReader dr = command.ExecuteReader();

            while (dr.Read())
            {
                final = Convert.ToDouble(dr.GetDecimal(1));
            }

            return final;
        }

        public static int getOrderNumber()
        {
            int orderNumber = 0;

            KahnoUser userCurrent = new KahnoUser();
            int currentUserID = userCurrent.userid;

            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();
            string sqlGetUser = ("SELECT TOP 1 OrderNumber FROM [ORDER] ORDER BY OrderNumber DESC");
            SqlCommand commquery = new SqlCommand(sqlGetUser, conn);
            commquery.Parameters.AddWithValue("@user", currentUserID);
            SqlDataReader drquery = commquery.ExecuteReader();
            drquery.Read();

            if (drquery.HasRows)
            {
                orderNumber = drquery.GetInt32(0);
                return orderNumber;
            }
            else
            {
                return 0;
            }
        }

        public static void InsertOrder(string time)
        {
            KahnoUser user = new KahnoUser();
            int user1 = user.userid;

            KahnoRestaurant restaurant = new KahnoRestaurant();
            int restaurantSend = restaurant.restaurantID;

            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlConnection con = new SqlConnection(connectString);
            string insert_query = "INSERT INTO [ORDER] (OrderDate, userID, restaurantID) VALUES(@date, @useriden ,@restaurant)";
            SqlCommand comm = new SqlCommand(insert_query, conn);

            //comm.Parameters.AddWithValue("@user", userId);
            comm.Parameters.AddWithValue("@date", time);
            comm.Parameters.AddWithValue("@useriden", user1);
            comm.Parameters.AddWithValue("@restaurant", restaurantSend);
            comm.ExecuteNonQuery();
            con.Close();
            comm.Dispose();
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
        public static void addMenuItem(string description, double price, string imageURL, string itemName, int restaurantID, HttpPostedFile File)
        {
            SqlConnection conn = new SqlConnection(connectString);
            //harry
            //Create byte Array with file len
            Byte[] imgByte = null;

            imgByte = new Byte[File.ContentLength];
            //force the control to load data in array
            File.InputStream.Read(imgByte, 0, File.ContentLength);
            try
            {
            
            
                conn.Open();
                SqlCommand command;
                SqlDataAdapter dataAdapter = new SqlDataAdapter();

                //I think the itemID for each menu item should generate itself as it would be a primary key. 
                string sqlAddItem = "INSERT INTO [MENUITEM] (Description, price, itemImageUrl, itemName, restaurantID, imgByte) VALUES(@1, @2, @3, @4, @5, @imgByte)";

                command = new SqlCommand(sqlAddItem, conn);
                
                command.Parameters.AddWithValue("@1", description);
                command.Parameters.AddWithValue("@2", price);
                command.Parameters.AddWithValue("@3", "");
                command.Parameters.AddWithValue("@4", itemName);
                command.Parameters.AddWithValue("@5", restaurantID);
                command.Parameters.AddWithValue("@imgByte", imgByte);

                dataAdapter.InsertCommand = command;
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

                dataAdapter.DeleteCommand = command;
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
               
                command.Parameters.AddWithValue("@Description", description);
                command.Parameters.AddWithValue("@price", price);
                command.Parameters.AddWithValue("@itemImageURL", imageURL);
                command.Parameters.AddWithValue("@itemName", itemName);
                

                dataAdapter.UpdateCommand = command;
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



        //imagetobytes -- Harry

        //addrestaurant -- Rudolph
        public static int NewRestaurant(string name, string phone, double latitude, double longitude, HttpPostedFile File)
        {
            //harry
            //Create byte Array with file len
            Byte[] imgByte = null;

            imgByte = new Byte[File.ContentLength];
            //force the control to load data in array
            File.InputStream.Read(imgByte, 0, File.ContentLength);

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
                    string insert_restaurant = "INSERT INTO [RESTAURANT] (phoneNumber, RestaurantName, CoordinatesID, byteImg) VALUES(@phoneNumber, @name, @CoordinateID, @img)";
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
                    comm.Parameters.AddWithValue("@img", imgByte);
                    comm.ExecuteNonQuery();
                    con.Close();
                    //closing as true
                    return restID;
                }
                catch(SqlException m)
                {
                    m.ToString();
                    return restID;
                }
            }
        }

        public static int UpdateRestaurantDetails(int id, string restaurantname, string phone, HttpPostedFile File)
        {
            //harry
            //Create byte Array with file len
            Byte[] imgByte = null;

            imgByte = new Byte[File.ContentLength];
            //force the control to load data in array
            File.InputStream.Read(imgByte, 0, File.ContentLength);

            //
            int rowsAffected = -1;
            SqlConnection conn = new SqlConnection(connectString);

            string sql = "UPDATE [RESTAURANT] SET RestaurantName = @rname, phoneNumber = @phone, byteImg = @img where RestaurantID=@id";

            SqlCommand command = new SqlCommand(sql, conn);
            command = new SqlCommand(sql, conn);
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@rname", restaurantname);
            command.Parameters.AddWithValue("@phone", phone);
            command.Parameters.AddWithValue("@img", imgByte);

            conn.Open();
            rowsAffected = command.ExecuteNonQuery();
            command.Dispose();
            conn.Close();

            return rowsAffected;
        }

        public static string getLastOrderDate(int id)
        {
            //checking if restaurant exists
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sqlGetUser = ("SELECT TOP 1 (OrderDate) FROM [ORDER] WHERE userID = @id ORDER BY OrderDate DESC");
            SqlCommand commquery = new SqlCommand(sqlGetUser, conn);
            commquery.Parameters.AddWithValue("@id", id);
            SqlDataReader drquery = commquery.ExecuteReader();
            drquery.Read();


            if (drquery.HasRows)
            {
                return drquery.GetValue(0).ToString();
            }
            else
            {
                return "Never! You have not made an order yet!";
            }
        }

        public static int getLastOrderID(int id)
        {
            //checking if restaurant exists
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sqlGetUser = ("SELECT TOP 1 (OrderNumber) FROM [ORDER] WHERE userID = @id ORDER BY OrderDate DESC");
            SqlCommand commquery = new SqlCommand(sqlGetUser, conn);
            commquery.Parameters.AddWithValue("@id", id);
            SqlDataReader drquery = commquery.ExecuteReader();
            drquery.Read();


            if (drquery.HasRows)
            {
                return drquery.GetInt32(0);
            }
            else
            {
                return 0;
            }
        }

        public static bool ratingUpToDate(int id)
        {
            //checking if restaurant exists
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();

            string sqlGetUser = ("SELECT TOP 1 (OrderID) FROM [CUSTOMERFEEDBACK] WHERE OrderID = @id");
            SqlCommand commquery = new SqlCommand(sqlGetUser, conn);
            commquery.Parameters.AddWithValue("@id", getLastOrderID(id));
            SqlDataReader drquery = commquery.ExecuteReader();
            drquery.Read();

            try
            {
                if (drquery.HasRows || drquery.GetValue(0) == null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return true;
            }
        }



        public static bool createNewRating(int userID, int score, int OrderNumber)
        {
            SqlConnection conn = new SqlConnection(connectString);
            try
            {
                conn.Open();
                SqlCommand command;
                SqlDataAdapter dataAdapter = new SqlDataAdapter();

                //I think the itemID for each menu item should generate itself as it would be a primary key. 
                string sqlAddItem = "INSERT INTO [CUSTOMERFEEDBACK] (OrderID, UserFeedbackScore, UserNumber) VALUES(@1,@2,@3)";

                command = new SqlCommand(sqlAddItem, conn);

                command.Parameters.AddWithValue("@1", OrderNumber);
                command.Parameters.AddWithValue("@2", score);
                command.Parameters.AddWithValue("@3", userID);

                dataAdapter.InsertCommand = command;
                dataAdapter.InsertCommand.ExecuteNonQuery();

                command.Dispose();
                conn.Close();
                return true;
            }
            catch (SqlException err)
            {
                conn.Close();
                err.ToString();
                return false;
            }
        }

        //public static 
    }
    }