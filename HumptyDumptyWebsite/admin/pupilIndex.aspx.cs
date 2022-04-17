using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace M4
{
    public partial class pupilIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                Response.End();
                return;
            }

            Session["closeParent"] = "false";
            string output = "<div class=\"row\">";
            DataTable childTable;
            if (Session["learnerTable"] == null)
            {
                childTable = getAllLearners();
                Session["learnerTable"] = childTable;
            }
            else
                childTable = (DataTable)Session["learnerTable"];

            int i = 0;
            foreach (DataRow currentLearner in childTable.Rows)
            {
                
                var dbImage = Convert.ToBase64String(((byte[])currentLearner["image"]));
                dbImage = string.Format("data:image/jpeg;base64,{0}", dbImage);
                string name = currentLearner["firstName"] + " " + currentLearner["surname"];
                output += "<div class=\"childInfoBlock col-4 col-md-3 col-sm-4\">" +
                    "<div class=\"infoImage\"><a href=\"pupilInfo.aspx?index=" + i.ToString() + "\">" +
                    "<img class=\"imgBlock\" src = \""+dbImage+"\" /></a>" +
                    "</div><div class=\"infoNameBlock\"><a href=\"pupilInfo.aspx?index=" + i.ToString() + "\" class=\"nameTitle\">" + name+ "</a></div></div>";
                i++;
            }
            output += "<div class=\"childInfoBlock col-4 col-md-3 col-sm-4\">" +
                   "<div class=\"infoImage\"><a href=\"pupilInfo.aspx?index=new\"><img class=\"imgBlock\" src = \"addBtn.png\" />" +
                   "</a></div><div class=\"infoNameBlock\"><a href=\"pupilInfo.aspx?index=new\" class=\"nameTitle\">Add Pupil</a></div></div>";
            output += "</div>";
            main.InnerHtml = output;
        }

        DataTable getAllLearners()
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM child";
            DataSet group2DS = sqlCon.GetDataSet(query, "child");
            DataTable dt = group2DS.Tables["child"];
            return dt;
        }
    }
}