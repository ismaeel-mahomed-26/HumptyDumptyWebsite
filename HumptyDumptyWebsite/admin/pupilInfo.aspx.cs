using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace M4
{
    public partial class pupilInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            
            if ((Request.QueryString["index"] == "new") && (Request.Form["childID"] != "new"))
            {
                firstNameDisp.InnerHtml = "Add new learner...";
                childID.Value = "new";
                deleteBtn.Visible = false;
                FileUploadControl.Attributes.Add("required", "");
                forwardBtn.Visible = false;
                backBtn.Visible = false;
                updateBtn.Value = "Add profile";
            }
            else if(Request.QueryString["action"]=="delete")
            {
                //Delete child profile
                if (DeleteChildProfile(Request.QueryString["childID"]))
                {
                    Session["learnerTable"] = getAllLearners();
                    Random rnd = new Random();
                    //Random parameter is to prevent caching
                    Response.Redirect("pupilIndex.aspx?rnd="+rnd.Next(1,1000).ToString());
                }
                
            }
            else
            {
                if (Session["lastIndex"] == null)
                    Session["lastIndex"] = 0;
                int lastIndex = Int32.Parse(Session["lastIndex"].ToString());
                if (IsPostBack)
                {
                    //Response.Write("Here");
                    //Response.End();
                    //Add or Update?
                    if (Request.Form["childID"] == "new")
                    {
                       // Response.Write("Here");
                        //Response.End();
                        //Add
                        byte[] newImg = FileUploadControl.FileBytes;
                        insertNewLearner(Request.Form["surname"], Request.Form["firstnames"],
                            Request.Form["birth"], Request.Form["gender"], Request.Form["allergies"], Request.Form["chronicMed"]
                            , Request.Form["daysPerWeek"], Request.Form["hoursPerWeek"], newImg);
                        int maxSize = getAllLearners().Rows.Count-1;
                        int newChildID = (int)getAllLearners().Rows[maxSize]["childID"];
                        insertEmerContact(newChildID, Request.Form["emerName"],
                            Request.Form["emerRelation"], Request.Form["emerCell"]);
                        Session["learnerTable"] = getAllLearners();
                        Random rnd = new Random();
                        //Random parameter is to prevent caching
                        Response.Redirect("pupilIndex.aspx?rnd=" + rnd.Next(1, 1000).ToString());
                    }
                    else
                    {
                        byte[] newImg;
                        if (FileUploadControl.HasFile)
                            newImg = FileUploadControl.FileBytes;
                        else
                            newImg = null;

                        updatePupil(Request.Form["childID"], Request.Form["surname"], Request.Form["firstnames"],
                            Request.Form["birth"], Request.Form["gender"], Request.Form["allergies"], Request.Form["chronicMed"]
                            , Request.Form["daysPerWeek"], Request.Form["hoursPerWeek"], newImg);
                        updateEmerContact(Request.Form["childID"], Request.Form["emerName"],
                            Request.Form["emerRelation"], Request.Form["emerCell"]);
                        Session["learnerTable"] = getAllLearners();
                    }
                }
                else
                {
                    string action = Request.QueryString["action"];
                    string childID = Request.QueryString["index"];
                    if (action != null)
                    {
                        if (action.Equals("back"))
                            lastIndex = Int32.Parse(Session["lastIndex"].ToString()) - 1;
                        else
                            lastIndex = Int32.Parse(Session["lastIndex"].ToString()) + 1;
                    }
                    else if (childID != null)
                        lastIndex = Int32.Parse(childID);
                }

                DataTable learnerTable;
                if (Session["learnerTable"] == null)
                {
                    learnerTable = getAllLearners();
                    Session["learnerTable"] = learnerTable;
                }
                else
                    learnerTable = (DataTable)Session["learnerTable"];

                if (lastIndex < 0)
                {
                    lastIndex = 0;
                }
                else if (lastIndex > learnerTable.Rows.Count - 1)
                    lastIndex = learnerTable.Rows.Count - 1;

                if (lastIndex == 0)
                    backBtn.Visible = false;
                else
                    backBtn.Visible = true;


                if (lastIndex == learnerTable.Rows.Count - 1)
                    forwardBtn.Visible = false;
                else
                    forwardBtn.Visible = true;


                Session["lastIndex"] = lastIndex;

                DataRow currentLearner = learnerTable.Rows[lastIndex];
                if (getEmerDetails(currentLearner["childID"].ToString()).Rows.Count >0)
                {
                    DataRow currentEmerContact = getEmerDetails(currentLearner["childID"].ToString()).Rows[0];
                    emerName.Value = currentEmerContact["name"].ToString();
                    emerCell.Value = currentEmerContact["emergencyCell"].ToString();
                    emerRelation.Value = currentEmerContact["relationshipToChild"].ToString();
                }

                surname.Value = (string)currentLearner["surname"];
                surnameDisp.InnerHtml = (string)currentLearner["surname"];
                firstnames.Value = (string)currentLearner["firstName"];
                firstNameDisp.InnerHtml = (string)currentLearner["firstName"];
                birth.Value = currentLearner["dateOfBirth"].ToString().Substring(0, 11);
                gender.Value = (string)currentLearner["gender"];
                allergies.Value = (string)currentLearner["knownAllergies"];
                chronicMed.Value = (string)currentLearner["chronicMedication"];
                childID.Value = currentLearner["childID"].ToString();
                hoursPerWeek.Value = (string)currentLearner["hoursPerWeek"];
                daysPerWeek.Value = (string)currentLearner["daysPerWeek"];
                deleteBtn.Attributes.Add("data-value", childID.Value);
                deleteBtn.Visible = true;
                updateBtn.Value = "Update changes";

                var dbImage = Convert.ToBase64String(((byte[])currentLearner["image"]));
                dbImage = string.Format("data:image/jpeg;base64,{0}", dbImage);
                pupilImage.Src = dbImage;

                DataTable parents = getParentsIDFromChildID(childID.Value);
                string parentsBtn = "";
                int i = 0;
                foreach (DataRow parent in parents.Rows)
                {
                    i++;
                    parentsBtn += "<input style=\"width: unset; height:40px;  font-size:1.1em;\" type=\"button\" value=\"View parent " + i.ToString() + "\" onclick=\"loadParents('" + parent["parentIDNum"] + "','false','"+ childID.Value + "'); \"/>&nbsp;&nbsp;&nbsp;&nbsp;";
                }
                if (i<2)
                    parentsBtn += "<input style=\"width: unset; height:40px; color:black; font-size:1.1em; background-color:#FFFFFF; border:2px solid black;\" type=\"button\" value=\"Add parent +\" onclick=\"loadParents('"+ childID.Value + "','true'); \"/>";

                parentsDiv.InnerHtml = parentsBtn;
            }
        }

        void insertNewLearner(string surname, string firstnames, string dob, string gender, string allergies, string meds,
            string days, string hours, byte[] img)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            sqlCon.sql = "INSERT INTO child (surname,firstName,dateOfBirth,gender,knownAllergies,chronicMedication,hoursPerWeek," +
                "daysPerWeek,image) VALUES (@surname,@firstName,@dob,@gender,@allergies,@chronic,@hpw,@dpw,@image)";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@surname", surname);
            sqlCon.command.Parameters.AddWithValue("@firstName", firstnames);
            sqlCon.command.Parameters.AddWithValue("@dob", dob);
            sqlCon.command.Parameters.AddWithValue("@gender", gender);
            sqlCon.command.Parameters.AddWithValue("@allergies", allergies);
            sqlCon.command.Parameters.AddWithValue("@chronic", meds);
            sqlCon.command.Parameters.AddWithValue("@hpw", hours);
            sqlCon.command.Parameters.AddWithValue("@dpw", days);
            sqlCon.command.Parameters.AddWithValue("@image", img);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();
        }

        void insertEmerContact(int childID, string emerName, string emerRelation, string emerCell)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            sqlCon.sql = "INSERT INTO emergencyContact (childID, emergencyCell,name,relationshipToChild) VALUES (@childID" +
                ",@cell,@name,@relation)";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@childID", childID);
            sqlCon.command.Parameters.AddWithValue("@cell", emerCell);
            sqlCon.command.Parameters.AddWithValue("@name", emerName);
            sqlCon.command.Parameters.AddWithValue("@relation", emerRelation);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();
        }

        DataTable getAllLearners()
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM child";
            DataSet group2DS = sqlCon.GetDataSet(query, "child");
            DataTable dt = group2DS.Tables["child"];
            return dt;
        }

        DataTable getParentsIDFromChildID(string childID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM parentChildInstance WHERE childID = '" + childID + "'";
            DataSet group2DS = sqlCon.GetDataSet(query, "parentChildInstance");
            DataTable dt = group2DS.Tables["parentChildInstance"];
            return dt;
        }

        DataTable getEmerDetails(string id)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM emergencyContact WHERE childID = '"+id+"'";
            DataSet group2DS = sqlCon.GetDataSet(query, "emergencyContact");
            DataTable dt = group2DS.Tables["emergencyContact"];
            return dt;
        }

        void updatePupil(string childID, string surname, string firstnames, string dob, string gender, string allergies, string meds, 
            string days, string hours,byte[] img)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM child WHERE childID = '" + childID + "';";
            DataSet group2DS = sqlCon.GetDataSet(query, "child");
            DataTable dt = group2DS.Tables["child"];
            foreach (DataRow dr in dt.Rows)
            {
                dr["surname"] = surname;
                dr["firstName"] = firstnames;
                dr["gender"] = gender;
                dr["knownAllergies"] = allergies;
                dr["chronicMedication"] = meds;
                dr["dateOfBirth"] = DateTime.Parse(dob + " 00:00:00");
                dr["daysPerWeek"] = days;
                dr["hoursPerWeek"] = hours;
                if (img != null)
                    dr["image"] = img;
            }
            sqlCon.Update(dt);
        }

        void updateEmerContact(string childID, string emerName, string emerRelation, string emerCell)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            var query = "SELECT * FROM emergencyContact WHERE childID = '" + childID + "'";
            DataSet group2DS = sqlCon.GetDataSet(query, "emergencyContact");
            DataTable dt = group2DS.Tables["emergencyContact"];
            foreach (DataRow dr in dt.Rows)
            {
                dr["name"] = emerName;
                dr["relationshipToChild"] = emerRelation;
                dr["emergencyCell"] = emerCell;
            }
            sqlCon.Update(dt);
        }

        bool DeleteChildProfile(string childID)
        {
            SqlDBConnection sqlCon = new SqlDBConnection();
            sqlCon.sql = "DELETE FROM emergencyContact WHERE childID = @childID";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@childID", childID);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();

            sqlCon = new SqlDBConnection();
            sqlCon.sql = "DELETE FROM paymentRecord WHERE childID = @childID";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@childID", childID);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();

            sqlCon = new SqlDBConnection();
            sqlCon.sql = "DELETE FROM progressReport WHERE childID = @childID";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@childID", childID);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();

            sqlCon = new SqlDBConnection();
            sqlCon.sql = "DELETE FROM parentChildInstance WHERE childID = @childID";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@childID", childID);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();

            DataTable parents = getParentsIDFromChildID(childID);
            foreach (DataRow parent in parents.Rows)
            {
                sqlCon = new SqlDBConnection();
                sqlCon.sql = "DELETE FROM parent WHERE parentIDNumber = "+parent["parentIDNumber"].ToString();
                sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
                sqlCon.command.Parameters.AddWithValue("@childID", childID);
                sqlCon.conn.Open();
                sqlCon.command.ExecuteNonQuery();
                sqlCon.conn.Close();
            }

            sqlCon = new SqlDBConnection();
            sqlCon.sql = "DELETE FROM child WHERE childID = @childID";
            sqlCon.command = new System.Data.SqlClient.SqlCommand(sqlCon.sql, sqlCon.conn);
            sqlCon.command.Parameters.AddWithValue("@childID", childID);
            sqlCon.conn.Open();
            sqlCon.command.ExecuteNonQuery();
            sqlCon.conn.Close();

            return true;
        }
    }
    
}