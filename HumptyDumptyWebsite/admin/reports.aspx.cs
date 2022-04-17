using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M4
{
    public partial class reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            if (Request.QueryString["search"] != null)
            {
                string filter = "childName LIKE '%" + Request.QueryString["search"] + "%'";
                SqlDataSource1.FilterExpression = filter;
            }
            else if(Request.QueryString["addID"] != null)
            {
                FormView1.ChangeMode(FormViewMode.Insert);
                repName.InnerText = "Add report for " + Request.QueryString["name"];
            }

            
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt16(GridView1.SelectedDataKey.Value);
            SqlDataSource2.FilterExpression = "reportID = " + index.ToString();
            repName.InnerText = GridView1.SelectedRow.Cells[1].Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                string param = searchBox.Text.ToUpper();
                Response.Redirect("reports.aspx?search=" + param);
        }


        DataTable getAllLearners()
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT childID, surname, firstName FROM child ORDER BY surname, firstName";
            DataSet group2DS = sqlCon.GetDataSet(query, "child");
            DataTable dt = group2DS.Tables["child"];
            return dt;
        }

        protected void addReport_Click(object sender, EventArgs e)
        {
            string childID = nameLists.SelectedValue;
            string name = childID.Substring(childID.IndexOf("@")+1);
            childID = childID.Substring(0, childID.IndexOf("@"));
            Response.Redirect("./reports.aspx?addID=" + childID+"&name="+name);
        }

        protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Response.Redirect("./reports.aspx?saved=true");
        }
    }
}