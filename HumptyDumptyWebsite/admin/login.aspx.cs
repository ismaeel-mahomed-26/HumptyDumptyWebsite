using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M4
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"]!=null)
            {
                Session.Clear();
                Response.Redirect("pupilIndex.aspx");
            }
            if (IsPostBack)
            {
                var user = Request.Form["username"];
                var pass = Request.Form["password"];
                if (isValidLogin(user,pass))
                {
                    Response.Redirect("pupilIndex.aspx");
                }
               else
                {
                    message.InnerHtml = "<a style=\"color:white; background-color:red; border-radius:4px; padding:4px; font-weight:bold; text-align:center;\">Incorrect login. Please try again.</a>";
                }


            }
        }

        bool isValidLogin(string user,string pass)
        {
            try
            {
                SqlDBConnection sqlCon = new SqlDBConnection();
                sqlCon.sql = "SELECT accessLevel FROM staffMember WHERE loginUsername = @user AND loginPassword = @pass";
                sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
                sqlCon.command.Parameters.AddWithValue("@user", user);
                sqlCon.command.Parameters.AddWithValue("@pass", pass);
                sqlCon.conn.Open();
                string level = sqlCon.command.ExecuteScalar().ToString();
                if (level == "1")
                {
                    sqlCon.conn.Close();
                    Session["admin"] = "true";
                    return true;
                }
                else if (level == "2")
                {
                    sqlCon.conn.Close();
                    Session["admin"] = "false";
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception)
            {
                return false;
            }
        }


    }

    
}