using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;

namespace M4.admin
{
    public partial class messaging : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            if (Request.QueryString["filter"] != null)
                SqlDataSource1.FilterExpression = Request.QueryString["filter"];

            
            DataTable parents = getParents();
            foreach (DataRow dr in parents.Rows)
            {
                parentList.Items.Add(new ListItem(dr[0].ToString(), dr[1].ToString()));
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try 
            {
                string filter = "subject LIKE '%" + TextBox4.Text + "%' OR contents LIKE '%" + TextBox4.Text + "'";
                Response.Redirect("messaging.aspx?filter=" + filter);
            }
            catch (Exception)
            {
                Response.Redirect("messaging.aspx");
            }
        }

        DataTable getParents()
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT surname + ', ' + firstNames AS Name,parentIDNum FROM parent ORDER BY surname";
            DataSet group2DS = sqlCon.GetDataSet(query, "parent");
            DataTable dt = group2DS.Tables["parent"];
            return dt;
        }

        string getEmail(string id)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT email FROM parent WHERE parentIDNum = '"+id+"'";
            DataSet group2DS = sqlCon.GetDataSet(query, "parent");
            DataTable dt = group2DS.Tables["parent"];
            return dt.Rows[0][0].ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                string idTo = parentList.Value;
                string subject = newSubject.Value;
                string content = newContent.Value;
                string email = getEmail(idTo);
                insertMessage(idTo, subject, content);
                emailParent(email,subject,content);
                confirm.InnerText = "Message sent!";
                newSubject.Value = "";
                newContent.Value = "";
            }
            catch (Exception)
            {

            }
        }

        void insertMessage(string pID, string subject,string contents)
        {

            SqlDBConnection sqlCon = new SqlDBConnection();
            sqlCon.sql = "INSERT INTO parentStaffMessage (parentIDNum,date,subject,contents,staffIDNum) VALUES (@pID,@date,@s,@c,@sID)";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@pID", pID);
            sqlCon.command.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
            sqlCon.command.Parameters.AddWithValue("@s",subject);
            sqlCon.command.Parameters.AddWithValue("@c", contents);
            sqlCon.command.Parameters.AddWithValue("@sID", "2");
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();
        }

        void emailParent(string email,string subject,string contents)
        {
            contents = HttpUtility.HtmlEncode(contents);
            subject = HttpUtility.HtmlEncode(subject);
            string query = "?email=" + Uri.EscapeUriString(email) + "&subject=" + Uri.EscapeUriString(subject) + "&content=" + Uri.EscapeUriString(contents);
            var web = new WebClient();
            var url = "https://humptydumptypmb.co.za/3si/email.php" + query;
            var r = web.DownloadString(url);
        }
    }
}