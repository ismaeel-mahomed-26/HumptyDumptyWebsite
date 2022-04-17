using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M4.parentsReporting
{
    public partial class viewReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["reportChildID"] != null)
            {
                DataTable pupilsReports = fetchProgReports(Session["reportChildID"].ToString());
                string output = "<table id=\"listTable\"><tr><th>Year</th><th>Semester</th><th>Action</th></tr>";
                foreach (DataRow dr in pupilsReports.Rows)
                {
                    output += "<tr><td>" + dr["year"] + "</td><td>" + dr["semester"] + "</td><td><div class=\"detailedLink\" onclick=\"openReport(" + dr["reportID"] + ")\">View</div></td></tr>";
                }
                output += "</table>";
                listReports.InnerHtml = output;
            }
        }

        DataTable fetchProgReports(string id)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM newProgressReport WHERE childID = '" + id + "'";
            DataSet group2DS = sqlCon.GetDataSet(query, "newProgressReport");
            DataTable dt = group2DS.Tables["newProgressReport"];
            return dt;
        }
    }
}