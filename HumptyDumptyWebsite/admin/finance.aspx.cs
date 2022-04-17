using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M4
{
    public partial class finance : System.Web.UI.Page
    {
        public string selectOptions = "";
        public string feeValue;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                Response.End();
                return;
            }
            if (Session["admin"].ToString() == "false")
            {
                Response.Write("You do not have permission to access this page");
                Response.End();
                return;
            }

            if (selectStudent.Items.Count == 0)
            {
                DataTable pupils = getAllStudents();
                foreach (DataRow dr in pupils.Rows)
                {
                    selectStudent.Items.Add(new ListItem(dr[1].ToString(), dr[0].ToString()));
                }
            }
            GridView1.Sort("Date", SortDirection.Descending);
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try
            {
                string name = nameSearch.Value;
                string fromDate = dateFrom.Value;
                string toDate = dateTo.Value;
                string amountFrom = amtFrom.Value;
                string amountTo = amtTo.Value;

                string[] filter = { name, fromDate, toDate, amountFrom, amountTo };

                string filterString = "";

                if (filter[0] != "")
                {
                    filter[0] = "Name LIKE '%" + filter[0] + "%'";
                }
                if (filter[1] != "")
                {
                    filter[1] = "date >='" + filter[1] + "'";
                }
                if (filter[2] != "")
                {
                    filter[2] = "date <='" + filter[2] + "'";
                }
                if (filter[3] != "")
                {
                    filter[3] = "amount >='" + filter[3] + "'";
                }
                if (filter[4] != "")
                {
                    filter[4] = "amount <='" + filter[4] + "'";
                }


                int flag = 0;
                foreach (string item in filter)
                {
                    if (item != "")
                    {
                        if (flag == 0)
                            filterString += item;
                        else
                            filterString += " AND " + item;

                        flag++;
                    }

                }

                SqlDataSource1.FilterExpression = filterString;
            }
            catch (Exception er)
            {

            }


        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = "";
            nameSearch.Value = "";
            dateFrom.Value = "";
            dateTo.Value = "";
            amtFrom.Value = "";
            amtTo.Value = "";
        }

        DataTable getAllStudents()
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT childID, firstName + ' ' + surname AS fullName FROM child";
            DataSet group2DS = sqlCon.GetDataSet(query, "child");
            DataTable dt = group2DS.Tables["child"];
            return dt;
        }

        string getStudentMonthlyFees(string childID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT hoursPerWeek, daysPerWeek FROM child WHERE childID = " + childID;
            DataSet group2DS = sqlCon.GetDataSet(query, "child");
            DataTable dt = group2DS.Tables["child"];
            DataRow dr = dt.Rows[0];
            string hours = dr[0].ToString();
            string days = dr[1].ToString();

            string col = "until" + hours;

            query = "SELECT * FROM feePrices WHERE daysPerWeek = " + days;
            group2DS = sqlCon.GetDataSet(query, "feePrices");
            dt = group2DS.Tables["feePrices"];
            var result = dt.Rows[0][col];
            return result.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string childID = selectStudent.Value;
            paymentAmount.Value = getStudentMonthlyFees(childID);

        }

        protected void Unnamed1_Click1(object sender, EventArgs e)
        {
           
            try
            {
                SqlDBConnection sqlCon = new SqlDBConnection();
                sqlCon.sql = "INSERT INTO paymentRecord (childID,date,amount,reason,staffIDNum) VALUES (@childID,@date,@amount,@reason,@staffIDNum)";
                sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
                sqlCon.command.Parameters.AddWithValue("@childID", selectStudent.Value);
                sqlCon.command.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
                sqlCon.command.Parameters.AddWithValue("@amount", Double.Parse(paymentAmount.Value));
                sqlCon.command.Parameters.AddWithValue("@reason", paymentReason.Value);
                sqlCon.command.Parameters.AddWithValue("@staffIDNum", "2");
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