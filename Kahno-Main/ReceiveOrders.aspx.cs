using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kahno_Main
{
    public partial class RecieveOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            recent.Visible = false;
            GridView1.SelectedIndex = 0;
            GridViewRow row = GridView1.SelectedRow;
            try
            {
                if (row.Cells[8].Text != Session["toporderno"].ToString())
                {
                    Session["toporderno"] = row.Cells[8].Text;
                    recent.Visible = true;
                }
            }
            catch
            {
                Session["toporderno"] = row.Cells[8].Text;
            }
        }
    }
}