using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Security;

namespace M4
{
    public partial class parent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (Session["closeParent"] != null)
            {
                if (Session["closeParent"].ToString() == "true")
                {
                    Session["closeParent"] = "false";
                    Response.Write("<script>window.opener.location.reload(true);window.close();</script>");
                    Response.End();
                }
            }
            cID.Value = Request.QueryString["cID"];

            deleteBtn.Visible = false;
            if (Request.QueryString["new"] != null)
            {
                
                if (Request.QueryString["new"].Equals("false"))
                {
                    addByID.Visible = false;
                    deleteBtn.Visible = true;
                }
            }

            if ((Request.QueryString["cID"] == null) || (Request.QueryString["cID"].Equals("undefined")))
            {
                    deleteBtn.Visible = false;
            }

            string isNew = Request.QueryString["new"];
            if (isNew != "true")
            {
                string parentID = Request.QueryString["parentID"];
                DataTable parent = getParentsFromID(parentID);
                if (parent .Rows.Count > 0)
                {
                    DataRow parentRow = parent.Rows[0];
                    pSurname.Value = (string)parentRow["surname"];
                    pFirstname.Value = (string)parentRow["firstNames"];
                    pID.Value = (string)parentRow["parentIDNum"];
                    pOrigID.Value = (string)parentRow["parentIDNum"];
                    pEmail.Value = (string)parentRow["email"];
                    pOccupation.Value = (string)parentRow["occupation"];
                    pEmployer.Value = (string)parentRow["employer"];
                    pWorkTel.Value = (string)parentRow["workTel"];
                    pCell.Value = (string)parentRow["cellNo"];
                    pAdd.Value = (string)parentRow["employerAddress"];
                }
                

            }
            else
            {
                //New parent
                string childID = Request.QueryString["parentID"];
                submitP.Text = "Add new parent";
                pOrigID.Value = "new";
                pID.Attributes.Remove("readonly");
            }


        }

        DataTable getParentsFromID(string parentID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM parent WHERE parentIDNum = '"+parentID+"'";
            DataSet group2DS = sqlCon.GetDataSet(query, "parent");
            DataTable dt = group2DS.Tables["parent"];
            return dt;
        }

        void insertParent(string childID, string surname, string firstname, string id, string email, string cell, string workTel, string
            occupation, string employer, string workAddr)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            sqlCon.sql = "INSERT INTO parent (parentIDNum,surname,firstNames,email,occupation,employer,workTel,cellNo," +
                "employerAddress) VALUES (@pid,@surname,@firstName,@email,@occ,@employer,@workTel,@cell,@add)";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@pid", id);
            sqlCon.command.Parameters.AddWithValue("@surname", surname);
            sqlCon.command.Parameters.AddWithValue("@firstName", firstname);
            sqlCon.command.Parameters.AddWithValue("@email", email);
            sqlCon.command.Parameters.AddWithValue("@occ", occupation);
            sqlCon.command.Parameters.AddWithValue("@employer", employer);
            sqlCon.command.Parameters.AddWithValue("@workTel", workTel);
            sqlCon.command.Parameters.AddWithValue("@cell", cell);
            sqlCon.command.Parameters.AddWithValue("@add", workAddr);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();
        }

        void insertChildParentLink(string childID,string pID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            sqlCon.sql = "INSERT INTO parentChildInstance (childID,parentIDNum) VALUES (@cid,@pid)";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@pid", pID);
            sqlCon.command.Parameters.AddWithValue("@cid", childID);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();
        }

        void updateParentRecord(string origID,string surname,string firstname,string id,string email,string cell,string workTel,string
            occupation, string employer,string workAddr)
        {
            if (origID != id)
            {
                SqlDBConnection sqlCon = new SqlDBConnection();
                var query = "SELECT * FROM parentChildInstance WHERE parentIDNum = '" + origID + "';";
                DataSet group2DS = sqlCon.GetDataSet(query, "parentChildInstance");
                DataTable dt = group2DS.Tables["parentChildInstance"];
                foreach (DataRow dr in dt.Rows)
                {
                    dr["parentIDNum"] = id;
                }
                sqlCon.Update(dt);
            }

            SqlDBConnection sqlCon1 = new SqlDBConnection();
            var query1 = "SELECT * FROM parent WHERE parentIDNum = '" + origID + "';";
            DataSet group2DS1 = sqlCon1.GetDataSet(query1, "parent");
            DataTable dt1 = group2DS1.Tables["parent"];
            foreach (DataRow dr in dt1.Rows)
            {
                dr["parentIDNum"] = id;
                dr["surname"] = surname;
                dr["firstNames"] = firstname;
                dr["email"] = email;
                dr["occupation"] = occupation;
                dr["employer"] = employer;
                dr["workTel"] = workTel;
                dr["cellNo"] = cell;
                dr["employerAddress"] = workAddr;
            }
            sqlCon1.Update(dt1);
            
        }

        bool DeleteParent(string pID,string cID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            sqlCon.sql = "DELETE FROM parentChildInstance WHERE parentIDNum = @pID AND childID = @cID";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@pID", pID);
            sqlCon.command.Parameters.AddWithValue("@cID", cID);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();

            //sqlCon = new SqlDBConnection();
            //sqlCon.sql = "DELETE FROM parent WHERE parentIDNum = @pID";
            //sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            //sqlCon.command.Parameters.AddWithValue("@pid", pID);
            //sqlCon.conn.Open();
            //sqlCon.command.ExecuteNonQuery();
            //sqlCon.conn.Close();

            return true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string IDNum = pID.Value;
                string childID = Request.QueryString["parentID"];
                DataTable parentSearch = getParentsFromID(IDNum);
                if (parentSearch.Rows.Count == 1)
                {
                    insertChildParentLink(childID, IDNum);
                    Response.Redirect("parent.aspx?parentID=" + IDNum + "&new=false");
                    Response.End();
                }
                else
                    Response.Redirect(Request.Url.OriginalString);
            }
            catch (Exception ex)
            {
                Response.Redirect(Request.Url.OriginalString);
            }
            
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            string pID = Request.Form["pID"];
            string cID = Request.Form["cID"];
            if (DeleteParent(pID,cID))
            {
                Session["closeParent"] = "true";
                Response.Redirect(Request.Url.LocalPath);
            }

        }

        protected void submitParents_Click(object sender, EventArgs e)
        {
            if (Request.Form["pOrigID"] == "new")
            {
                //New parent
                insertParent(Request.QueryString["parentID"], Request.Form["pSurname"], Request.Form["pFirstname"],
                Request.Form["pID"], Request.Form["pEmail"], Request.Form["pCell"], Request.Form["pWorkTel"],
                Request.Form["pOccupation"], Request.Form["pEmployer"], Request.Form["pAdd"]);
                //New child parent link
                insertChildParentLink(Request.QueryString["parentID"], Request.Form["pID"]);
                Response.Redirect("parent.aspx?parentID=" + Request.Form["pID"] + "&new=false&refresh=true");
            }
            else
            {
                updateParentRecord(Request.Form["pOrigID"], Request.Form["pSurname"], Request.Form["pFirstname"],
                Request.Form["pID"], Request.Form["pEmail"], Request.Form["pCell"], Request.Form["pWorkTel"],
                Request.Form["pOccupation"], Request.Form["pEmployer"], Request.Form["pAdd"]);
            }
        }
    }
}