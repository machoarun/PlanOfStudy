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
using System.Data.SqlClient;

namespace POS_Code
{
    public partial class LoginPage : System.Web.UI.Page
    {
        public static string DATAACCESS_DATABASENAME = System.Configuration.ConfigurationManager.AppSettings["POSDatabase"];

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }       

        protected void lgnLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string sUserName = lgnLogin.UserName;
            string sPassword = lgnLogin.Password;
            string sType = string.Empty;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            string query = "SELECT FLD_TYPE ";
            query += "FROM LOGIN ";
            query += "WHERE StrComp([FLD_PASSWORD], '" + sPassword + "', 0) = 0 AND ";
            query += "FLD_USERNAME = '" + sUserName + "'";

            OleDbCommand cmd = new OleDbCommand(query, conn);

            sType = (string)cmd.ExecuteScalar();

            cmd.Dispose();

            //Close the connection
            conn.Close();

            if (sType == null)
            {
                lgnLogin.FailureText = @"Invalid Net ID/Password";
            }
            else if (sType == "Admin")
            {
                HttpContext.Current.Response.Redirect("~/Admin/AdminHome.aspx");
            }
            else if (sType == "Professor")
            {
                HttpContext.Current.Response.Redirect("~/Professor/ProfessorHome.aspx");
            }
            else
            {
                Session["NetID"] = sUserName;
                HttpContext.Current.Response.Redirect("~/Student/StudentHome.aspx");
            }
        }
    }
}
