using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace M4
{
    public partial class Contacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            if (Session["contactFilter"] != null)
            {
                SqlDataSource1.FilterExpression = Session["contactFilter"].ToString();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.Insert();
                Response.Write("<script>alert('New item inserted');window.location=notesAndContacts.aspx';</script>");
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Enter all values');window.location=notesAndContacts.aspx';</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["contactFilter"]= "name LIKE '%" + TextBox4.Text.ToUpper() + "%' OR notes LIKE '%" + TextBox4.Text.ToUpper() + "%'";
            Response.Redirect("notesAndContacts.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                    SqlDBConnection sqlCon = new SqlDBConnection();
                    sqlCon.sql = "INSERT INTO note (staffIDNum,item,note,date) VALUES (@staffID,@item,@note,@date)";
                    sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
                    sqlCon.command.Parameters.AddWithValue("@staffID", 2);
                    sqlCon.command.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
                    sqlCon.command.Parameters.AddWithValue("@item", subject.Value);
                    sqlCon.command.Parameters.AddWithValue("@note", contents.Value);
                    sqlCon.conn.Open();
                    sqlCon.command.ExecuteNonQuery();
                    sqlCon.conn.Close();
                    Response.Write("<script>alert('New item inserted');window.location='notesAndContacts.aspx';</script>");

            }
            catch (Exception)
            {
                Response.Write("<script>alert('Enter all values');window.location='noteAndContacts.aspx';</script>");

            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > 1)
            {
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
            }
        }
    }
}
