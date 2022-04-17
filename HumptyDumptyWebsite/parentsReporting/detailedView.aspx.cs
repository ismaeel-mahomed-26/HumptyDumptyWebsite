using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace M4.parentsReporting
{
    public partial class detailedView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if  (Request.QueryString["id"] == null)
            {
                Response.Write("<h2>No report selected</h2>");
               reportView.Visible = false;
                printBtn.Visible = false;
            }
            else
            {
                string reportID = Request.QueryString["id"];
                SqlDataSource1.FilterExpression = "reportID = '" + reportID+"'";
                Session["tempName"] = getChildName(Session["reportChildID"].ToString());
            }
        }

        String getChildName(string childID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT firstName + ' ' + surname as 'Name' FROM child WHERE childID = '" + childID + "'";
            DataSet group2DS = sqlCon.GetDataSet(query, "child");
            DataTable dt = group2DS.Tables["child"];
            return dt.Rows[0][0].ToString();
        }
    }
}