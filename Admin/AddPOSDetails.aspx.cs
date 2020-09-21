using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

namespace POS_Code
{
    public partial class AddPOSDetails : System.Web.UI.Page
    {
        public static string DATAACCESS_DATABASENAME = System.Configuration.ConfigurationManager.AppSettings["POSDatabase"];

        string strNuId = " ";
        string sCourseWork = " ";
        string sTransition = " ";
        string sConcentration = " ";
        string sActive = " ";

        protected void Page_Load(object sender, EventArgs e)
        {
            sActive = Session["Active"].ToString();
            strNuId = Session["sNuId"].ToString();
            sCourseWork = Session["CourseWork"].ToString();
            sTransition = Session["Transition"].ToString();
            sConcentration = Session["Concentration"].ToString();

            if (!IsPostBack)
            {
                if (sActive == "Yes")
                    rdActiveStatus.SelectedValue = "Yes";
                else
                    rdActiveStatus.SelectedValue = "No";
           

                if (sConcentration == "Artificial Intelligence")
                {
                    Session["iType1"] = "3";
                    Session["iType2"] = "0";
                    Session["iType3"] = "0";
                }
                else if (sConcentration == "Database and Knowledge")
                {
                    Session["iType1"] = "4";
                    Session["iType2"] = "0";
                    Session["iType3"] = "0";
                }
                else if (sConcentration == "Information Assurance")
                {
                    Session["iType1"] = "5";
                    Session["iType2"] = "9";
                    Session["iType3"] = "11";
                }
                else if (sConcentration == "Network Technologies")
                {
                    Session["iType1"] = "6";
                    Session["iType2"] = "9";
                    Session["iType3"] = "11";
                }
                else if (sConcentration == "Software Engineering")
                {
                    Session["iType1"] = "7";
                    Session["iType2"] = "10";
                    Session["iType3"] = "0";
                }
                else if (sConcentration == "System Engineering")
                {
                    Session["iType1"] = "8";
                    Session["iType2"] = "11";
                    Session["iType3"] = "0";
                }
                else
                {
                    Session["iType1"] = "13";
                    Session["iType2"] = "0";
                    Session["iType3"] = "0";
                }

                //if (!IsPostBack)
                //{
                gdTransition.DataBind();
                gdCourseWork.DataBind();
                gdConcentration.DataBind();
                gdPOS.DataBind();
                gdElectives.DataBind();
            }

            if (sTransition == "Yes")
            {
                gdTransition.Visible = true;
            }
        }

        protected void gdPOS_SelectedIndexChanged(object sender, EventArgs e)
        {
            gdTransition.DataBind();
            gdCourseWork.DataBind();
            gdConcentration.DataBind();
            gdPOS.DataBind();
            gdElectives.DataBind();
        }

        protected void gdTransition_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sCourseId = "";
            string sCourseName = "";
            string sSemester = "";
            //string sYear = "";

            GridViewRow gvRow = gdTransition.SelectedRow;

            sCourseId = gvRow.Cells[1].Text;
            sCourseName = gvRow.Cells[2].Text;
            sSemester = gvRow.Cells[3].Text;
            //DropDownList txtYear = (DropDownList)gvRow.Cells[5].FindControl("ddlYear");

            //TextBox txtYear = (TextBox)gvRow.FindControl("txtYear");
            //sYear = txtYear.Text;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            //Query for inserting the data
            string query = "INSERT INTO [PLAN_OF_STUDY] (FLD_NU_ID, FLD_COURSE_ID, FLD_COURSE_NAME, FLD_CREDITS, FLD_SEMESTER, FLD_YEAR, FLD_TYPE, FLD_TYPE_ID)";
            query += " VALUES ('" + strNuId + "' ,'" + sCourseId + "' ,'" + sCourseName + "' , '" + "3" + "',";
            query += "'" + sSemester + "', '" + "Add Year" + "Transition" + "', '" + "4" + "')";

            OleDbCommand cmd = new OleDbCommand(query, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            //Close the connection
            conn.Close();
            gdTransition.DataBind();
            gdCourseWork.DataBind();
            gdConcentration.DataBind();
            gdPOS.DataBind();
            gdElectives.DataBind();
        }

        protected void gdCourseWork_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sCourseId = "";
            string sCourseName = "";
            string sSemester = "";
            //string sYear = "";

            GridViewRow gvRow = gdCourseWork.SelectedRow;

            sCourseId = gvRow.Cells[1].Text;
            sCourseName = gvRow.Cells[2].Text;
            sSemester = gvRow.Cells[3].Text;
            //DropDownList txtYear = (DropDownList)gvRow.Cells[5].FindControl("ddlYear");

            //TextBox txtYear = (TextBox)gvRow.FindControl("txtYear");
            //sYear = txtYear.Text;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            //Query for inserting the data
            string query = "INSERT INTO [PLAN_OF_STUDY] (FLD_NU_ID, FLD_COURSE_ID, FLD_COURSE_NAME, FLD_CREDITS, FLD_SEMESTER, FLD_YEAR, FLD_TYPE, FLD_TYPE_ID)";
            query += " VALUES ('" + strNuId + "', '" + sCourseId + "', '" + sCourseName + "', '" + "3" + "',";
            query += " '" + sSemester + "', '" + "Add Year" + "', '" + "Core" + "', '" + "1" + "')";

            OleDbCommand cmd = new OleDbCommand(query, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            //Close the connection
            conn.Close();
            gdTransition.DataBind();
            gdCourseWork.DataBind();
            gdConcentration.DataBind();
            gdPOS.DataBind();
            gdElectives.DataBind();
        }


        protected void gdConcentration_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sCourseId = "";
            string sCourseName = "";
            string sSemester = "";
            //string sYear = "";

            GridViewRow gvRow = gdConcentration.SelectedRow;

            sCourseId = gvRow.Cells[1].Text;
            sCourseName = gvRow.Cells[2].Text;
            sSemester = gvRow.Cells[3].Text;
            //DropDownList txtYear = (DropDownList)gvRow.Cells[5].FindControl("ddlYear");

            //TextBox txtYear = (TextBox)gvRow.FindControl("txtYear");
            //sYear = txtYear.Text;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            //Query for inserting the data
            string query = "INSERT INTO [PLAN_OF_STUDY] (FLD_NU_ID, FLD_COURSE_ID, FLD_COURSE_NAME, FLD_CREDITS, FLD_SEMESTER, FLD_YEAR, FLD_TYPE, FLD_TYPE_ID)";
            query += " values ('" + strNuId + "' ,'" + sCourseId + "' ,'" + sCourseName + "' , '" + "3" + "',";
            query += "'" + sSemester + "', '" + "Add Year" + "Concentration" + "', '" + "2" + "')";

            OleDbCommand cmd = new OleDbCommand(query, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            //Close the connection
            conn.Close();
            gdTransition.DataBind();
            gdCourseWork.DataBind();
            gdConcentration.DataBind();
            gdPOS.DataBind();
            gdElectives.DataBind();
        }

        protected void gdElectives_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sCourseId = "";
            string sCourseName = "";
            string sSemester = "";
            //string sYear = "";

            GridViewRow gvRow = gdElectives.SelectedRow;

            sCourseId = gvRow.Cells[1].Text;
            sCourseName = gvRow.Cells[2].Text;
            sSemester = gvRow.Cells[3].Text;
            //DropDownList txtYear = (DropDownList)gvRow.Cells[5].FindControl("ddlYear");

            //TextBox txtYear = (TextBox)gvRow.FindControl("txtYear");
            //sYear = txtYear.Text;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            //Query for inserting the data
            string query = "INSERT INTO [PLAN_OF_STUDY] (FLD_NU_ID, FLD_COURSE_ID, FLD_COURSE_NAME, FLD_CREDITS, FLD_SEMESTER, FLD_YEAR, FLD_TYPE)";
            query += " VALUES ('" + strNuId + "' ,'" + sCourseId + "' ,'" + sCourseName + "' , '" + "3" + "',";
            query += "'" + sSemester + "', '" + "Add Year" + "Elective" + "', '" + "3" + "')";

            OleDbCommand cmd = new OleDbCommand(query, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            //Close the connection
            conn.Close();
            gdTransition.DataBind();
            gdCourseWork.DataBind();
            gdConcentration.DataBind();
            gdPOS.DataBind();
            gdElectives.DataBind();
        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("DashBoard.aspx");
        }

        protected void btnActive_Click(object sender, EventArgs e)
        {
            string Active = rdActiveStatus.SelectedValue;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            //Query for inserting the data
            string query = "UPDATE [STUDENT_DATA] SET FLD_ACTIVE_STATUS = " + "'" + rdActiveStatus.SelectedValue + "'";
            query += " WHERE FLD_NU_ID = " + "'" + strNuId + "'";

            OleDbCommand cmd = new OleDbCommand(query, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            //Close the connection
            conn.Close();
        }
    }
}
