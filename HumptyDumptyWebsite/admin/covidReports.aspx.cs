using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M4
{
    public partial class covidReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("detailedCovid.aspx");
        }
    }
}