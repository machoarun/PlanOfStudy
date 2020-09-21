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
    public partial class AddStudentDetails : System.Web.UI.Page
    {
        public static string DATAACCESS_DATABASENAME = System.Configuration.ConfigurationManager.AppSettings["POSDatabase"];

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            //string sNuId = "";
            string sCredits = "";

            if (ddlType.SelectedItem.Text == "Coursework")
            {
                sCredits = "33";
            }
            else
            {
                sCredits = "30";
            }
            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            //Query for inserting the data
            string query = "INSERT INTO [STUDENT_DATA] (FLD_NU_ID, FLD_FIRST_NAME, FLD_LAST_NAME, ";
            query += "FLD_EMAIL, FLD_PHONE, FLD_DEPT, FLD_SEMESTER, FLD_DOJ, FLD_PROGRAM, FLD_TRANSITION, ";
            query += "FLD_CREDITS, FLD_CONCENTRATION_NAME, FLD_ACTIVE_STATUS)";
            query += "VALUES ( '" + txtNuid.Text + "', '" + txtFName.Text + "', '" + txtLName.Text + "', ";
            query += "'" + txtEmail.Text + "', '" + txtPhone.Text + "', ";
            query += "'" + ddlDept.SelectedItem.Text + "', '" + ddlSemester.SelectedValue + "', ";
            query += "'" + txtYear.Text + "', '" + ddlType.SelectedItem.Text + "', ";
            query += "'" + rbTransition.SelectedValue.ToString() + "', '" + sCredits + "', '" + ddlConcentration.SelectedItem.Text + "', 'Yes')";

            OleDbCommand cmd = new OleDbCommand(query, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            //Close the connection
            conn.Close();

            //sNuId = txtNuid.Text;
            Session["sNuId"] = txtNuid.Text;
            Session["CourseWork"] = ddlType.SelectedItem.Text;
            Session["Transition"] = rbTransition.SelectedValue.ToString();
            Session["Concentration"] = ddlConcentration.SelectedValue.ToString();
            Session["Active"] = "Yes";

            HttpContext.Current.Response.Redirect("AddPOSDetails.aspx");
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            txtNuid.Text = null;
            txtFName.Text = null;
            txtLName.Text = null;
            txtYear.Text = null;
            txtEmail.Text = null;
            txtPhone.Text = null;
            ddlSemester.SelectedIndex = 1;
            ddlConcentration.SelectedIndex = 1;
        }
    }
}
