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
    public partial class ProfessorStatistics : System.Web.UI.Page
    {
        public static string DATAACCESS_DATABASENAME = System.Configuration.ConfigurationManager.AppSettings["POSDatabase"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string semester;
            string year;

            //semester = ddlSemester.SelectedValue;
            //year = txtYear.Text;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            //Query for inserting the data       
            string query = "SELECT FLD_YEAR, FLD_COURSE_NAME, COUNT(FLD_YEAR) as 'Number'";
            query += " FROM PLAN_OF_STUDY";
            query += " WHERE  [FLD_COURSE_NAME] = '" + ddlCourse.SelectedValue + "'";
            query += " GROUP BY [FLD_YEAR], [FLD_COURSE_NAME]";

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);

            //Close the connection
            conn.Close();

            DataView dv = dt.DefaultView;

            pnlColumn.Visible = true;

            ChartColumn.Series["Series1"].Points.DataBindXY(dv, "FLD_YEAR", dv, "'Number'");

            //gdDetails.Visible = true;
            //gdDetails.DataSource = dt;
            //gdDetails.DataBind();
        }    
    }
}
