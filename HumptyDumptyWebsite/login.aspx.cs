using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace M4
{
    public partial class login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["parentID"] != null)
                Response.Write("<script>parent.location.href=parent.location.href;</script>");
        }

        DataTable getParentInfo(string parentID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM parent WHERE parentIDNum = '" + parentID + "'";
            DataSet group2DS = sqlCon.GetDataSet(query, "parent");
            DataTable dt = group2DS.Tables["parent"];
            return dt;
        }

        DataTable getChildFromParent(string parentID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM parentChildInstance WHERE parentIDNum = '" + parentID + "'";
            DataSet group2DS = sqlCon.GetDataSet(query, "parentChildInstance");
            DataTable dt = group2DS.Tables["parentChildInstance"];
            return dt;
        }

        DataTable getChildName(string childID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT firstName,surname FROM child WHERE childID = '" + childID + "'";
            DataSet group2DS = sqlCon.GetDataSet(query, "child");
            DataTable dt = group2DS.Tables["child"];
            return dt;
        }

        bool parentExists(string parentID, string pass)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            sqlCon.sql = "SELECT COUNT(*) FROM parent WHERE parentIDNum = @ID AND password = @pass";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@ID", parentID);
            sqlCon.command.Parameters.AddWithValue("@pass", pass);
            sqlCon.conn.Open();
            if (sqlCon.command.ExecuteScalar().ToString() == "0")
            {
                sqlCon.conn.Close();
                return false;
            }
            else
            {
                sqlCon.conn.Close();
                return true;
            }
            
        }

        DataTable fetchMessages(string parentID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM parentStaffMessage WHERE parentIDNum = '" + parentID + "' ORDER BY date DESC";
            DataSet group2DS = sqlCon.GetDataSet(query, "parentStaffMessage");
            DataTable dt = group2DS.Tables["parentStaffMessage"];
            return dt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string ID = parentID.Value;
                string pass = password.Value;
                if (!parentExists(ID,pass))
                {
                    Session["loginErr"] = true;
                }
                else
                {
                    DataTable parentChild = getChildFromParent(ID);
                    string[] childIDs = new string[parentChild.Rows.Count];
                    string[] childNames = new string[parentChild.Rows.Count];
                    int i = 0;
                    foreach (DataRow dr in parentChild.Rows)
                    {
                        childIDs[i] = dr["childID"].ToString();
                        DataTable childInfo = getChildName(dr["childID"].ToString());
                        childNames[i] = childInfo.Rows[i]["firstName"].ToString() + " " + childInfo.Rows[i]["surname"].ToString();
                        i++;
                    }
                    Session["childIDs"] = childIDs;
                    Session["childNames"] = childNames;
                    Session["parentID"] = getParentInfo(ID);
                    Session["messageLog"] = fetchMessages(ID);
                    Response.Redirect("login.aspx");
                }
            }
            catch(Exception Ex)
            {
                Response.Write(Ex.Message);
            }
        }
    }
}