using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M4
{
    public partial class detailedCovid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["error"] == "date")
                {
                    err.InnerText = "Please select a date from both calendars";
                }
                if (Session["detailedFilter"]!=null)
                {
                    SqlDataSource2.FilterExpression = Session["detailedFilter"].ToString();
                    SqlDataSource3.FilterExpression = Session["detailedFilter"].ToString();
                }
                else
                {
                    SqlDataSource3.FilterExpression = "date >= '" + DateTime.Today.AddDays(-30).ToString("yyyy-MM-dd")+"'";
                }
            }
            catch (Exception)
            {
                Response.Redirect("detailedCovid.aspx?error=date");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("covidReports.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string from = Calendar1.SelectedDate.ToString();
                string to = Calendar2.SelectedDate.ToString();
                DateTime fromTime = DateTime.Parse(from);
                DateTime toTime = DateTime.Parse(to);
                Session["detailedFilter"] = "date >= '" + from + "' AND date <='" + to + "'";
                SqlDataSource2.FilterExpression = Session["detailedFilter"].ToString();
                SqlDataSource3.FilterExpression = Session["detailedFilter"].ToString();
            }
            catch (Exception)
            {
                Response.Redirect("detailedCovid.aspx?error=date");
            }
        }

    }
}