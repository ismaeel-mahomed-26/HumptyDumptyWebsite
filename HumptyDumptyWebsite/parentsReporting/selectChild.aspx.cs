using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M4.parentsReporting
{
    public partial class selectChild : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["childNames"] == null)
            {
                Response.Redirect("../login.aspx?redir=parentsReporting/selectChild");
                Response.End();
            }
            if (IsPostBack)
            {
                Session["reportChildID"] = Request.Form["selectedChild"];
                Response.Redirect("viewReport.aspx");
            }
        }
    }
}