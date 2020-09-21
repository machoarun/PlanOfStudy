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

namespace POS_Code.Student
{
    public partial class POSDetails : System.Web.UI.Page
    {
        string sNetId;
        public static string DATAACCESS_DATABASENAME = System.Configuration.ConfigurationManager.AppSettings["POSDatabase"];

        protected void Page_Load(object sender, EventArgs e)
        {
            sNetId = Session["NetID"].ToString();

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            //Query for inserting the data
            string query = "SELECT FLD_NU_ID, FLD_FIRST_NAME, FLD_LAST_NAME, FLD_EMAIL, FLD_PHONE, ";
            query += " FLD_DEPT, FLD_DOJ, FLD_PROGRAM, FLD_CREDITS, FLD_ACTIVE_STATUS, FLD_CONCENTRATION_NAME";
            query += " FROM STUDENT_DATA";
            query += " WHERE  [FLD_FIRST_NAME] = '" + sNetId + "'";

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);

            //Close the connection
            conn.Close();          
          
            gdStudentData.DataSource = dt;
            gdStudentData.DataBind();

            string sNuid = dt.Rows[0].ItemArray[0].ToString();

            //Open the Connection
            conn.Open();

            //Query for inserting the data
            string query1 = "SELECT FLD_NU_ID, FLD_COURSE_ID, FLD_COURSE_NAME, FLD_CREDITS, FLD_SEMESTER, FLD_YEAR";
            query1 += " FROM PLAN_OF_STUDY";
            query1 += " WHERE  [FLD_NU_ID] = '" + sNuid + "'" ;
            query1 += " ORDER BY FLD_YEAR ASC, FLD_SEMESTER ASC";

            OleDbDataAdapter cmd1 = new OleDbDataAdapter(query1, conn);
            DataTable dtPos = new DataTable();
            cmd1.Fill(dtPos);

            //Close the connection
            conn.Close();

            gdPOS.DataSource = dtPos;
            gdPOS.DataBind();
        }
    }
}