using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;

namespace M4.messages
{
    public partial class viewMessages : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["childNames"] == null)
            {
                Response.Redirect("../login.aspx?redir=messages/viewMessages");
                Response.End();
            }

            if (Request.QueryString["del"] !=null)
            {
                DeleteMessage(int.Parse(Request.QueryString["del"]));
            }

            DataTable messages = (DataTable)Session["messageLog"];
            string printMessages = "";
            foreach (DataRow dr in messages.Rows)
            {
                string date = dr["date"].ToString().Substring(0, 11);
                printMessages += "<div class=\"col-12 col-sm-4 col-lg-3 message\"><table><tr><td style=\"width:80%;\"><b>"+date+"</b><br><i>" +
                    "Subject: " + dr["subject"].ToString() + "</i><br /></td><td><div class=\"deleteBtn\"><a href=\"?del=" + dr["messageID"].ToString() + "\">Delete</a></div></td>" +
                    "</tr><tr><td colspan = \"2\" >" + dr["contents"].ToString() + "</td></tr></table></div><div class=\"col-12 col-sm-1\">&nbsp;</div>";
            }
            msgBlock.InnerHtml = printMessages;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["parentID"] == null)
            {
                Response.Redirect("../login.aspx?redir=messages/viewMessages");
                Response.End();
            }
            string subject = msgSubject.Value;
            string content = msgContents.Value;
            DataTable p = (DataTable)Session["parentID"];
            WriteMessage(p.Rows[0][0].ToString() ,subject,content);
        }

        DataTable fetchMessages(string parentID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM parentStaffMessage WHERE parentIDNum = '" + parentID + "' ORDER BY date DESC";
            DataSet group2DS = sqlCon.GetDataSet(query, "parentStaffMessage");
            DataTable dt = group2DS.Tables["parentStaffMessage"];
            return dt;
        }

        void DeleteMessage(int messageID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            sqlCon.sql = "DELETE FROM parentStaffMessage WHERE messageID = @id";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@id", messageID);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();
            DataTable p = (DataTable)Session["parentID"];
            Session["messageLog"] = fetchMessages(p.Rows[0][0].ToString());
        }

        void WriteMessage(string parentID,string subject,string contents)
        {
            try
            {
                
                SqlDBConnection sqlCon = new SqlDBConnection();
                sqlCon.sql = "INSERT INTO parentStaffMessage (parentIDNum,date,subject,contents) VALUES (@id,@date,@subject,@contents)";
                sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
                sqlCon.command.Parameters.AddWithValue("@id", parentID);
                sqlCon.command.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
                sqlCon.command.Parameters.AddWithValue("@subject", subject);
                sqlCon.command.Parameters.AddWithValue("@contents", contents);

                sqlCon.conn.Open();
                sqlCon.command.ExecuteNonQuery();
                sqlCon.conn.Close();
                Session["messageLog"] = fetchMessages(parentID);
                Response.Redirect("./viewMessages.aspx");
            }
            catch (Exception)
            {
                Response.Redirect("./viewMessages.aspx");
            }
        }

    }
}