using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace M4.COVID
{
    public partial class screeningForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["covidChildID"] == null)
                Response.Redirect("selectChild.aspx");
            Session["screenName"] = getChildName(Session["covidChildID"].ToString()).Rows[0][0];
        }

        DataTable getChildName(string childID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT firstName,surname FROM child WHERE childID = '" + childID + "'";
            DataSet group2DS = sqlCon.GetDataSet(query, "child");
            DataTable dt = group2DS.Tables["child"];
            return dt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["covidChildID"] == null)
                Response.Redirect("default.aspx");

            string temp = tempTens.Value + "." +tempDeci.Value;
            WriteCovidScreening(Session["covidChildID"].ToString(), temp, cough.SelectedValue,throat.SelectedValue,aches.SelectedValue,taste.SelectedValue,
                redEyes.SelectedValue,naus.SelectedValue,fatigue.SelectedValue);
            Response.Redirect("complete.aspx");
        }

        void WriteCovidScreening(string id,string temp,string cough,string throat,string aches,string smell,string eyes,string naus,string tired)
        {
            try
            {
                SqlDBConnection sqlCon = new SqlDBConnection();
                sqlCon.sql = "INSERT INTO covidScreening (childID,date,temp,cough,soreThroat,bodyAches,tasteSmell," +
                    "redEyes,nauseaOrVomiting,tiredness) VALUES (@id,@date,@temp,@cough,@soreThroat,@aches,@taste,@eyes,@naus,@tired)";
                sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
                sqlCon.command.Parameters.AddWithValue("@id", id);
                sqlCon.command.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
                sqlCon.command.Parameters.AddWithValue("@temp", temp);
                sqlCon.command.Parameters.AddWithValue("@cough", cough);
                sqlCon.command.Parameters.AddWithValue("@soreThroat", throat);
                sqlCon.command.Parameters.AddWithValue("@aches", aches);
                sqlCon.command.Parameters.AddWithValue("@taste", smell);
                sqlCon.command.Parameters.AddWithValue("@eyes", eyes);
                sqlCon.command.Parameters.AddWithValue("@naus", naus);
                sqlCon.command.Parameters.AddWithValue("@tired", tired);

                sqlCon.conn.Open();
                sqlCon.command.ExecuteNonQuery();
                sqlCon.conn.Close();
            }
            catch (Exception)
            {

            }
        }
    }
}