using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace M4.admin
{
    public partial class financeReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            fillTable();
        }

        string summarizePaymentDetails(string month,string year)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT COUNT(*) AS 'Total Transactions' FROM paymentRecord WHERE MONTH(date) = "+ month+" AND YEAR(date) = "+year;
            DataSet group2DS = sqlCon.GetDataSet(query, "paymentRecord");
            DataTable dt = group2DS.Tables["paymentRecord"];
            string totalTrans = "0";
            if (dt.Rows.Count > 0)
                totalTrans = dt.Rows[0][0].ToString();

            query = "SELECT COUNT(*) FROM paymentRecord WHERE MONTH(date) = " + month + "  AND DAY(date) >13 AND DAY(date) <21 AND YEAR(date) = "+year;
            group2DS = sqlCon.GetDataSet(query, "paymentRecord");
            dt = group2DS.Tables["paymentRecord"];
            string midMonth = "0";
            if (dt.Rows.Count > 0)
                midMonth = dt.Rows[0][0].ToString();

            string endMonth = (int.Parse(totalTrans) - int.Parse(midMonth)).ToString();

            query = "SELECT SUM(amount) FROM paymentRecord WHERE MONTH(date) = "+month+" AND YEAR(date) ="+year;
            group2DS = sqlCon.GetDataSet(query, "paymentRecord");
            dt = group2DS.Tables["paymentRecord"];
            string totalAmt = "0";
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0][0].ToString().Length == 0)
                    totalAmt = "0,00";
                else
                    totalAmt = dt.Rows[0][0].ToString();
            }

            string result = "<td>"+totalTrans+ "</td><td>" + midMonth + "</td><td>" + endMonth + "</td><td>R" + totalAmt + "</td>";
            return result;
        }

        string summarize(string year)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT COUNT(*) AS 'Total Transactions' FROM paymentRecord WHERE YEAR(date) = " + year;
            DataSet group2DS = sqlCon.GetDataSet(query, "paymentRecord");
            DataTable dt = group2DS.Tables["paymentRecord"];
            string totalTrans = "0";
            if (dt.Rows.Count > 0)
                totalTrans = dt.Rows[0][0].ToString();

            query = "SELECT COUNT(*) FROM paymentRecord WHERE DAY(date) >13 AND DAY(date) <21 AND YEAR(date) = " + year;
            group2DS = sqlCon.GetDataSet(query, "paymentRecord");
            dt = group2DS.Tables["paymentRecord"];
            string midMonth = "0";
            if (dt.Rows.Count > 0)
                midMonth = dt.Rows[0][0].ToString();

            string endMonth = (int.Parse(totalTrans) - int.Parse(midMonth)).ToString();

            query = "SELECT SUM(amount) FROM paymentRecord WHERE YEAR(date) =" + year;
            group2DS = sqlCon.GetDataSet(query, "paymentRecord");
            dt = group2DS.Tables["paymentRecord"];
            string totalAmt = "0";
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0][0].ToString().Length == 0)
                    totalAmt = "0,00";
                else
                    totalAmt = dt.Rows[0][0].ToString();
            }
            string result = "<td><b>" + totalTrans + "</b></td><td><b>" + midMonth + "</b></td><td><b>" + endMonth + "</b></td><td><b>R" + totalAmt + "</b></td>";
            return result;
        }

        void fillTable()
        {
            try
            {
                string year = "2020";
                if (Session["crossTabFilter"] != null)
                    year = Session["crossTabFilter"].ToString();

                System.Globalization.DateTimeFormatInfo mf = new System.Globalization.DateTimeFormatInfo();
                string table = "<table><tr><td><b>Month</b></td><td><b>Total<br>Transactions</b></td><td><b>Mid-month<br>payments</b></td><td><b>Month-end<br>payments</b></td><td><b>Total transaction<br>amounts</b></td></tr>";
                for (int i = 1; i < 13; i++)
                {
                    table += "<tr><td><b>" + mf.GetMonthName(i) + "</b></td>" + summarizePaymentDetails(i.ToString(),year) + "</tr>";
                }
                report.InnerHtml = table + "<tr><td style=\"border-bottom:0; border-left:0;\"></td>" +summarize(year)+"</tr></table>";
            }
            catch(Exception)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["crossTabFilter"] = DropDownList1.SelectedValue;
            Session["barGraphFilter"] = DropDownList1.SelectedValue;
            Response.Redirect("./financeReport.aspx");
        }
    }
}