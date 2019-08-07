using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
    public class File1 : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            int id = int.Parse(context.Request.QueryString["id"]);
            byte[] bytes;
            string contentType;
            string strConnString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename= |DataDirectory|music.mdf;Integrated Security=True";
        string name;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select Name, Data, ContentType from tblFiles where id=@id";
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    sdr.Read();
                    bytes = (byte[])sdr["Data"];
                    contentType = sdr["ContentType"].ToString();
                    name = sdr["Name"].ToString();
                    con.Close();
                }
            }
            context.Response.Clear();
            context.Response.Buffer = true;
            context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + name);
            context.Response.ContentType = contentType;
            context.Response.BinaryWrite(bytes);
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    internal static object ReadAllText(string v)
    {
        throw new NotImplementedException();
    }
}