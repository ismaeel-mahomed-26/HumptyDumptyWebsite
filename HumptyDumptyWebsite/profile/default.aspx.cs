using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace M4.profile
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["parentID"] == null)
                Response.Redirect("../login.aspx");
            else
            {
                DataTable parentInfo = (DataTable)Session["parentID"];
                SqlDataSource1.FilterExpression = "parentIDNum = '" + parentInfo.Rows[0][0].ToString() + "'";
            }


        }
    }
}