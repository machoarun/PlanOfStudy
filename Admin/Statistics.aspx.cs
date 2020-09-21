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
    public partial class Statistics : System.Web.UI.Page
    {
        public static string DATAACCESS_DATABASENAME = System.Configuration.ConfigurationManager.AppSettings["POSDatabase"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void ddlSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sSelectValue = ddlSelect.SelectedValue;
            gdDetails.Visible = false;
            pnlLine.Visible = false;
            pnlColumn.Visible = false;
            ChartLine.Legends["Options"].Enabled = false;
            txtYearFrom.Text = string.Empty;
            txtYearTo.Text = string.Empty;
            txtYear.Text = string.Empty;

            switch (sSelectValue)
            {
                case "Active":
                    pnlActive.Visible = true;
                    //pnlConcentration.Visible = false;
                    pnlCourse.Visible = false;
                    //pnlOptions.Visible = false;
                    pnlSemester.Visible = false;
                    break;

                case "Concentration":
                    pnlActive.Visible = true;
                    //pnlConcentration.Visible = true;
                    pnlCourse.Visible = false;
                    //pnlOptions.Visible = false;
                    pnlSemester.Visible = false;
                    break;

                case "Course":
                    pnlActive.Visible = true;
                    //pnlConcentration.Visible = false;
                    pnlCourse.Visible = true;
                    //pnlOptions.Visible = false;
                    pnlSemester.Visible = false;
                    break;

                case "Options":
                    pnlActive.Visible = true;
                    //pnlConcentration.Visible = false;
                    pnlCourse.Visible = false;
                    //pnlOptions.Visible = true;
                    pnlSemester.Visible = false;
                    break;

                case "Semester":
                    pnlActive.Visible = false;
                    //pnlConcentration.Visible = false;
                    pnlCourse.Visible = false;
                    //pnlOptions.Visible = false;
                    pnlSemester.Visible = true;
                    break;

                default:
                    Response.Write("<script>alert('Please Select From the List')</script>");
                    break;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {            
            string sSelectValue = ddlSelect.SelectedValue;

            switch (sSelectValue)
            {
                case "Active":
                    ActiveChart();
                    break;

                case "Concentration":
                    ConcentrationChart();
                    break;

                case "Course":
                    CourseChart();
                    break;

                case "Options":
                    OptionsChart();
                    break;

                case "Semester":
                    SemesterChart();
                    break;

                default:
                    Response.Write("<script>alert('Please Select From the List')</script>");
                    break;
            }
        }

        public void ActiveChart()
        {
            string sFromSemester = ddlSemesterFrom.SelectedValue;
            string sFromYear = txtYearFrom.Text;
            string sToSemester = ddlSemesterTo.SelectedValue;
            string sToYear = txtYearTo.Text;


            if (Convert.ToInt32(sFromYear) > Convert.ToInt32(sToYear))
            {
                Response.Write("<script>alert('Please Enter To Semester-Year greater than From Semester-Year')</script>");
                return;
            }

            pnlLine.Visible = true;
            //pnlPie.Visible = true;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            string query = "SELECT (FLD_DOJ+'-'+FLD_SEMESTER) AS 'Semester', COUNT(FLD_DOJ) as 'Number Of Students'";
            query += " FROM STUDENT_DATA";
            //query += "  FLD_ACTIVE_STATUS = 'Yes' AND ";
            //query += " WHERE FLD_SEMESTER BETWEEN '" + sFromSemester + "' AND '" + sToSemester + "' AND ";
            query += " WHERE FLD_SEMESTER BETWEEN 'Fall' AND 'Spring' AND ";
            query += " FLD_DOJ BETWEEN '" + sFromYear + "' AND '" + sToYear + "'";
            query += " GROUP BY FLD_DOJ, FLD_SEMESTER, (FLD_DOJ+FLD_SEMESTER)";
            query += " ORDER BY FLD_DOJ, FLD_SEMESTER DESC, (FLD_DOJ+FLD_SEMESTER)";

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);

            //Close the connection
            conn.Close();

            dt.Columns["'Semester'"].ColumnName = "Semester-Year";
            dt.Columns["'Number Of Students'"].ColumnName = "Number Of Students";

            gdDetails.Visible = true;
            gdDetails.DataSource = dt;
            gdDetails.DataBind();

            DataView dv = dt.DefaultView;

            ChartLine.Legends["Options"].Enabled = true;
            ChartLine.Series["Series1"].Enabled = true;
            ChartLine.Series["Series1"].LegendText = "Active Students";
            ChartLine.Series["Series1"].Points.DataBindXY(dv, "Semester-Year", dv, "Number Of Students");  
        }

        public void ConcentrationChart()
        {
            //string sConcentration = ddlConcentration.SelectedItem.ToString();
            string sFromSemester = ddlSemesterFrom.SelectedValue;
            string sFromYear = txtYearFrom.Text;
            string sToSemester = ddlSemesterTo.SelectedValue;
            string sToYear = txtYearTo.Text;


            if (Convert.ToInt32(sFromYear) > Convert.ToInt32(sToYear))
            {
                Response.Write("<script>alert('Please Enter To Semester-Year greater than From Semester-Year')</script>");
                return;
            }

            pnlLine.Visible = true;
            //pnlPie.Visible = true;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            string query = "SELECT FLD_CONCENTRATION_NAME, (FLD_DOJ+'-'+FLD_SEMESTER) as 'Semester', COUNT(FLD_DOJ) as 'Number Of Students'";
            query += " FROM STUDENT_DATA";
            //query += " WHERE FLD_CONCENTRATION_NAME = '" + sConcentration + "' AND ";
            //query += " WHERE FLD_SEMESTER BETWEEN '" + sFromSemester + "' AND '" + sToSemester + "' AND ";
            query += " WHERE FLD_SEMESTER BETWEEN 'Fall' AND 'Spring' AND ";
            query += " FLD_DOJ BETWEEN '" + sFromYear + "' AND '" + sToYear + "'";
            query += " GROUP BY FLD_CONCENTRATION_NAME, FLD_DOJ, FLD_SEMESTER, (FLD_DOJ+FLD_SEMESTER)";
            query += " ORDER BY FLD_DOJ, FLD_SEMESTER DESC, (FLD_DOJ+FLD_SEMESTER)";

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);

            //Close the connection
            conn.Close();

            dt.Columns["FLD_CONCENTRATION_NAME"].ColumnName = "Concentration";
            dt.Columns["'Semester'"].ColumnName = "Semester-Year";
            dt.Columns["'Number Of Students'"].ColumnName = "Number Of Students";

            gdDetails.Visible = true;
            gdDetails.DataSource = dt;
            gdDetails.DataBind();

            DataView dv = dt.DefaultView;

            //ChartLine.Series["Series1"].Points.DataBindXY(dv, "'Year'", dv, "'Number Of Students'");
            ChartLine.Legends["Options"].Enabled = true;
            ChartLine.Series["Series1"].LegendText = "Artificial Intelligence";
            ChartLine.Series["Series2"].LegendText = "Database and Knowledge";
            ChartLine.Series["Series3"].LegendText = "General MS";            
            ChartLine.Series["Series4"].LegendText = "Information Assurance";
            ChartLine.Series["Series5"].LegendText = "Network Technologies";
            ChartLine.Series["Series6"].LegendText = "Software Engineering";
            ChartLine.Series["Series7"].LegendText = "System Engineering";

            ChartLine.Series["Series1"].Enabled = true;
            ChartLine.Series["Series2"].Enabled = true;
            ChartLine.Series["Series3"].Enabled = true;
            ChartLine.Series["Series4"].Enabled = true;
            ChartLine.Series["Series5"].Enabled = true;
            ChartLine.Series["Series6"].Enabled = true;
            ChartLine.Series["Series7"].Enabled = true;

            ChartLine.Series["Series1"].Points.DataBind(dv.Table.Select("Concentration = 'Artificial Intelligence'"), "Semester-Year", "Number Of Students", "");
            ChartLine.Series["Series2"].Points.DataBind(dv.Table.Select("Concentration = 'Database and Knowledge'"), "Semester-Year", "Number Of Students", "");
            ChartLine.Series["Series3"].Points.DataBind(dv.Table.Select("Concentration = 'General MS'"), "Semester-Year", "Number Of Students", "");
            ChartLine.Series["Series4"].Points.DataBind(dv.Table.Select("Concentration = 'Information Assurance'"), "Semester-Year", "Number Of Students", "");
            ChartLine.Series["Series5"].Points.DataBind(dv.Table.Select("Concentration = 'Network Technologies'"), "Semester-Year", "Number Of Students", "");
            ChartLine.Series["Series6"].Points.DataBind(dv.Table.Select("Concentration = 'Software Engineering'"), "Semester-Year", "Number Of Students", "");
            ChartLine.Series["Series7"].Points.DataBind(dv.Table.Select("Concentration = 'System Engineering'"), "Semester-Year", "Number Of Students", "");
        }

        public void CourseChart()
        {
            string sCourse = ddlCourse.SelectedItem.ToString();

            string sFromSemester = ddlSemesterFrom.SelectedValue;
            string sFromYear = txtYearFrom.Text;
            string sToSemester = ddlSemesterTo.SelectedValue;
            string sToYear = txtYearTo.Text;


            if (Convert.ToInt32(sFromYear) > Convert.ToInt32(sToYear))
            {
                Response.Write("<script>alert('Please Enter 'To Semester-Year greater than From Semester-Year')</script>");
                return;
            }

            pnlLine.Visible = true;
            //pnlPie.Visible = true;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            string query = "SELECT (FLD_YEAR+'-'+FLD_SEMESTER) AS 'Semester', COUNT(FLD_YEAR) as 'Number Of Students'";
            query += " FROM PLAN_OF_STUDY";
            query += " WHERE FLD_COURSE_NAME = '" + sCourse + "' AND ";
            //query += " FLD_SEMESTER BETWEEN '" + sFromSemester + "' AND '" + sToSemester + "' AND ";
            query += " FLD_SEMESTER BETWEEN 'Fall' AND 'Spring' AND ";
            query += " FLD_YEAR BETWEEN '" + sFromYear + "' AND '" + sToYear + "'";
            query += " GROUP BY FLD_YEAR, FLD_SEMESTER, (FLD_YEAR+FLD_SEMESTER)";
            query += " ORDER BY FLD_YEAR, FLD_SEMESTER DESC, (FLD_YEAR+FLD_SEMESTER)";

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);

            //Close the connection
            conn.Close();

            dt.Columns["'Semester'"].ColumnName = "Semester-Year";
            dt.Columns["'Number Of Students'"].ColumnName = "Number Of Students";
            gdDetails.Visible = true;
            gdDetails.DataSource = dt;
            gdDetails.DataBind();

            DataView dv = dt.DefaultView;

            ChartLine.Legends["Options"].Enabled = true;
            ChartLine.Series["Series1"].Enabled = true;
            ChartLine.Series["Series1"].LegendText = sCourse;
            ChartLine.Series["Series1"].Points.DataBindXY(dv, "Semester-Year", dv, "Number Of Students");
        }

        public void OptionsChart()
        {
            //string sOptions = ddlOptions.SelectedItem.ToString();

            string sFromSemester = ddlSemesterFrom.SelectedValue;
            string sFromYear = txtYearFrom.Text;
            string sToSemester = ddlSemesterTo.SelectedValue;
            string sToYear = txtYearTo.Text;


            if (Convert.ToInt32(sFromYear) > Convert.ToInt32(sToYear))
            {
                Response.Write("<script>alert('Please Enter To Semester-Year greater than From Semester-Year')</script>");
                return;
            }

            pnlLine.Visible = true;
            //pnlPie.Visible = true;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            string query = "SELECT FLD_PROGRAM, (FLD_DOJ+'-'+FLD_SEMESTER) AS 'Semester', COUNT(FLD_DOJ) as 'Number Of Students'";
            query += " FROM STUDENT_DATA";
            //query += " WHERE FLD_PROGRAM = '" + sOptions + "' AND ";
            //query += " WHERE FLD_SEMESTER BETWEEN '" + sFromSemester + "' AND '" + sToSemester + "' AND ";
            query += " WHERE FLD_SEMESTER BETWEEN 'Fall' AND 'Spring' AND ";
            query += " FLD_DOJ BETWEEN '" + sFromYear + "' AND '" + sToYear + "'";
            query += " GROUP BY FLD_PROGRAM, FLD_DOJ, FLD_SEMESTER, (FLD_DOJ+FLD_SEMESTER)";
            query += " ORDER BY FLD_DOJ, FLD_SEMESTER DESC, (FLD_DOJ+FLD_SEMESTER)";

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);

            //Close the connection
            conn.Close();

            dt.Columns["FLD_PROGRAM"].ColumnName = "Option";
            dt.Columns["'Semester'"].ColumnName = "Semester-Year";
            dt.Columns["'Number Of Students'"].ColumnName = "Number Of Students";

            gdDetails.Visible = true;
            gdDetails.DataSource = dt;
            gdDetails.DataBind();

            DataView dv = dt.DefaultView;
           
            //ChartLine.Series["Series1"].Points.DataBindXY(dv, "'Year'", dv, "'Number Of Students'");

            ChartLine.Legends["Options"].Enabled = true;
            ChartLine.Series["Series1"].LegendText = "CourseWork";
            ChartLine.Series["Series2"].LegendText = "Project";
            ChartLine.Series["Series3"].LegendText = "Thesis";
            ChartLine.Series["Series1"].Enabled = true;
            ChartLine.Series["Series2"].Enabled = true;
            ChartLine.Series["Series3"].Enabled = true;
            ChartLine.Series["Series1"].Points.DataBind(dv.Table.Select("Option = 'Coursework'"), "Semester-Year", "Number Of Students", "");
            ChartLine.Series["Series2"].Points.DataBind(dv.Table.Select("Option = 'Project'"), "Semester-Year", "Number Of Students", "");
            ChartLine.Series["Series3"].Points.DataBind(dv.Table.Select("Option = 'Thesis'"), "Semester-Year", "Number Of Students", "");
        }

        public void SemesterChart()
        {
            string semester;
            string year;

            pnlColumn.Visible = true;
            //pnlPie.Visible = true;

            semester = ddlSemester.SelectedValue;
            year = txtYear.Text;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            string query = "SELECT FLD_COURSE_ID, FLD_COURSE_NAME, COUNT(FLD_COURSE_NAME) as 'Number of Students'";
            query += " FROM PLAN_OF_STUDY";
            query += " WHERE  [FLD_SEMESTER] = '" + semester + "' AND [FLD_YEAR] = '" + year + "'";
            query += " GROUP BY [FLD_COURSE_ID], [FLD_COURSE_NAME]";

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);

            //Close the connection
            conn.Close();

            dt.Columns["FLD_COURSE_ID"].ColumnName = "Course ID";
            dt.Columns["FLD_COURSE_NAME"].ColumnName = "Course Name";
            dt.Columns["'Number Of Students'"].ColumnName = "Number Of Students";

            gdDetails.Visible = true;
            gdDetails.DataSource = dt;
            gdDetails.DataBind();

            DataView dv = dt.DefaultView;

            ChartColumn.Series["Series1"].Points.DataBindXY(dv, "Course Name", dv, "Number Of Students");
        }       
    }
}
