using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace M4
{
    public partial class staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
        }
        
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindGridView();

        }


        private void bindGridView()
        {
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }

        
        protected void searchBtn_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Length > 0)
            {
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.DataSource = SqlDataSource3;
                GridView1.DataBind();
                viewAllBtn.Enabled = true;
            }
        }

        protected void viewAllBtn_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            TextBox1.Text = "";
        }

        protected void Insertbtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource4.Insert();
            }
            catch (Exception)
            {
                Response.Write("<script>alert(\"Please enter all values\");</script>");
            }
            txtAccess.Text = "";
            txtAccNo.Text = "";
            txtAccType.Text = "";
            txtAddress.Text = "";
            txtAddress.Text = "";
            txtBrCode.Text = "";
            txtName.Text = "";
            txtPass.Text = "";
            txtStaffID.Text = "";
            txtSwCode.Text = "";
            txtUserN.Text = "";
            Response.Write("<script>alert(\"User added\");</script>");

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSourceSelectArguments sr = new DataSourceSelectArguments();
            DataView dv = (DataView)SqlDataSource6.Select(sr);
            if (dv.Count != 0)
                Label1.Text = dv[0][0].ToString() + "'s Account details";
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            
            
            try
            {
                string id = Convert.ToString(GridView1.SelectedValue);
                SqlDBConnection sqlCon = new SqlDBConnection();
                sqlCon.sql = "DELETE FROM staffMember WHERE staffIDNum = @id";
                sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
                sqlCon.command.Parameters.AddWithValue("@id", id);
               
                sqlCon.conn.Open();
                sqlCon.command.ExecuteNonQuery();
                sqlCon.conn.Close();
                Response.Redirect("staff.aspx");

            }
            catch (Exception)
            {
               
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}