using System;
using System.Collections;
using System.Collections.Generic;
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
using AjaxControlToolkit;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace POS_Code
{
    public partial class DashBoard : System.Web.UI.Page
    {
        public static string DATAACCESS_DATABASENAME = System.Configuration.ConfigurationManager.AppSettings["POSDatabase"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string connString = @DATAACCESS_DATABASENAME;
                OleDbConnection conn = new OleDbConnection(connString);

                //Open the Connection
                conn.Open();

                string query = "SELECT FLD_NU_ID, FLD_FIRST_NAME, FLD_LAST_NAME, FLD_PHONE, FLD_DEPT, ";
                query += "FLD_PROGRAM, FLD_CONCENTRATION_NAME, FLD_TRANSITION, FLD_SEMESTER, FLD_DOJ, FLD_ACTIVE_STATUS ";
                query += "FROM STUDENT_DATA ORDER BY FLD_FIRST_NAME";

                OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
                DataTable dt = new DataTable();
                cmd.Fill(dt);

                gdStudentData.DataSource = dt;
                gdStudentData.DataBind();

                cmd.Dispose();

                //Close the connection
                conn.Close();
            }
        }

        protected void gdStudentData_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //ModalPopupExtender pce = e.Row.FindControl("PopupControlExtender1") as ModalPopupExtender;
                PopupControlExtender pce = e.Row.FindControl("PopupControlExtender1") as PopupControlExtender;
                string behaviorID = "pce_" + e.Row.RowIndex;
                pce.BehaviorID = behaviorID;
                System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)e.Row.FindControl("imgPOS");
                string OnMouseOverScript = string.Format("$find('{0}').showPopup();", behaviorID);
                string OnMouseOutScript = string.Format("$find('{0}').hidePopup();", behaviorID);
                img.Attributes.Add("onmouseover", OnMouseOverScript);
                img.Attributes.Add("onmouseout", OnMouseOutScript);
            }
        }

        [System.Web.Services.WebMethodAttribute(),
         System.Web.Script.Services.ScriptMethodAttribute()]
        public static string GetDynamicContent(string contextKey)
        {
            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            string query = "SELECT FLD_NU_ID, FLD_COURSE_ID, FLD_COURSE_NAME, FLD_CREDITS, FLD_SEMESTER, FLD_YEAR, FLD_TYPE, FLD_TYPE_ID ";
            query += " FROM PLAN_OF_STUDY";
            query += " WHERE FLD_NU_ID = '" + contextKey + "' ORDER BY FLD_TYPE_ID ASC, FLD_YEAR ASC, FLD_SEMESTER DESC";

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            cmd.Dispose();

            //Close the connection
            conn.Close();

            StringBuilder b = new StringBuilder();
            b.Append("<table style='background-color:#F4FFEA; border: #336600 1px solid;");
            //b.Append("width:750px; font-size:10pt; font-family:Verdana;' cellspacing='0' cellpadding='3'>");
            b.Append("font-size:10pt; font-family:Arial Narrow;' cellspacing='0' cellpadding='3'>");
            b.Append("<tr><td colspan='7' style='background-color:#336600 ; color:black;'>");
            b.Append("<b valign=center>POS Details</b>");
            b.Append("</td></tr>");
            b.Append("<tr align=center><td><b>Nu ID</b></td>");
            b.Append("<td><b>Course Id</b></td>");
            b.Append("<td><b>Course Name</b></td>");
            b.Append("<td><b>Credits</b></td>");
            b.Append("<td><b>Semester</b></td>");
            b.Append("<td><b>Year</b></td>");
            b.Append("<td><b>Type</b></td></tr>");
            foreach (DataRow Row in dt.Rows)
            {
                b.Append("<tr>");
                b.Append("<td>" + Row["FLD_NU_ID"].ToString() + "</td>");
                b.Append("<td>" + Row["FLD_COURSE_ID"].ToString() + "</td>");
                b.Append("<td>" + Row["FLD_COURSE_NAME"].ToString() + "</td>");
                b.Append("<td>" + Row["FLD_CREDITS"].ToString() + "</td>");
                b.Append("<td>" + Row["FLD_SEMESTER"].ToString() + "</td>");
                b.Append("<td>" + Row["FLD_YEAR"].ToString() + "</td>");
                b.Append("<td>" + Row["FLD_TYPE"].ToString() + "</td>");
                b.Append("</tr>");
            }
            //b.Append("<tr>");
            //b.Append("<td>");
            //b.Append("<input type='button' id='btnClose' value='Close' onclick='$find('mpe').hide();'>");
            //b.Append("</td>");
            //b.Append("</tr>");            
            b.Append("</table>");
            return b.ToString();

            
        }

        public void lbEdit_click(object sender, EventArgs e)
        {
            GridViewRow selectedRow = ((Control)sender).Parent.NamingContainer as GridViewRow;

            Session["sNuId"] = selectedRow.Cells[3].Text;
            Session["CourseWork"] = selectedRow.Cells[8].Text;
            Session["Concentration"] = selectedRow.Cells[9].Text;
            Session["Transition"] = selectedRow.Cells[10].Text;
            Session["Active"] = selectedRow.Cells[13].Text;

            HttpContext.Current.Response.Redirect("AddPOSDetails.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gdStudentData.DataSource = "";
            gdStudentData.DataBind();

            string sNuid = txtNUID.Text;
            string sLastName = txtLastName.Text;
            string sOption = ddlOption.SelectedValue;
            string sActive = ddlActive.SelectedValue;
            string strWhere = string.Empty;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            string query = "SELECT FLD_NU_ID, FLD_FIRST_NAME, FLD_LAST_NAME, FLD_PHONE, FLD_DEPT,";
            query += " FLD_PROGRAM, FLD_CONCENTRATION_NAME, FLD_TRANSITION, FLD_SEMESTER, FLD_DOJ, FLD_ACTIVE_STATUS";
            query += " FROM STUDENT_DATA";
            if (!string.IsNullOrEmpty(sNuid) || !string.IsNullOrEmpty(sLastName) || !string.IsNullOrEmpty(sOption) || !string.IsNullOrEmpty(sActive))
            {
                query += " WHERE ";
                if (!string.IsNullOrEmpty(sNuid))
                {
                    strWhere = "[FLD_NU_ID] = '" + sNuid + "'";
                }

                if (!string.IsNullOrEmpty(sLastName))
                {
                    if (!string.IsNullOrEmpty(strWhere))
                        strWhere += " AND ";

                    strWhere += "[FLD_LAST_NAME] = '" + sLastName + "'";
                }

                if (!string.IsNullOrEmpty(sOption))
                {
                    if (!string.IsNullOrEmpty(strWhere))
                        strWhere += " AND ";

                    strWhere += "[FLD_PROGRAM] = '" + sOption + "'";
                }

                if (!string.IsNullOrEmpty(sActive))
                {
                    if (!string.IsNullOrEmpty(strWhere))
                        strWhere += " AND ";

                    strWhere += "[FLD_ACTIVE_STATUS] = '" + sActive + "'";
                }
                query += strWhere;
            }

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);

            gdStudentData.DataSource = dt;
            gdStudentData.DataBind();

            cmd.Dispose();

            //Close the connection
            conn.Close();
        }

        protected void imgPrint_Click(object sender, EventArgs e)
        {
            GridViewRow selectedRow = ((Control)sender).Parent.NamingContainer as GridViewRow;
            string sNuId = selectedRow.Cells[3].Text;

            string connString = @DATAACCESS_DATABASENAME;
            OleDbConnection conn = new OleDbConnection(connString);

            //Open the Connection
            conn.Open();

            string query = "SELECT FLD_NU_ID, FLD_FIRST_NAME, FLD_LAST_NAME, FLD_EMAIL, FLD_PHONE, FLD_DEPT,";
            query += " FLD_PROGRAM, FLD_CONCENTRATION_NAME, FLD_TRANSITION, FLD_CREDITS, FLD_SEMESTER, FLD_DOJ";
            query += " FROM STUDENT_DATA";
            query += " WHERE [FLD_NU_ID] = '" + sNuId + "'";

            OleDbDataAdapter cmd = new OleDbDataAdapter(query, conn);
            DataTable dt = new DataTable();
            cmd.Fill(dt);

            string query1 = "SELECT FLD_COURSE_ID AS 'Course Id', FLD_COURSE_NAME as 'Course Name',";
            query1 += " FLD_CREDITS as 'Credits', FLD_SEMESTER as 'Semester' , FLD_YEAR as 'Year', FLD_TYPE as 'Type', FLD_TYPE_ID ";
            query1 += " FROM PLAN_OF_STUDY";
            query1 += " WHERE FLD_NU_ID = '" + sNuId + "' ORDER BY FLD_TYPE_ID ASC, FLD_YEAR ASC, FLD_SEMESTER DESC";

            OleDbDataAdapter cmd1 = new OleDbDataAdapter(query1, conn);
            DataTable dt1 = new DataTable();
            cmd1.Fill(dt1);
            dt1.Columns.Remove("FLD_TYPE_ID");

            cmd1.Dispose();

            //Close the connection
            conn.Close();

            // Create a Document object
            var document = new Document(PageSize.A4, 20, 20, 40, 10);

            // Create a new PdfWrite object, writing the output to a MemoryStream
            var output = new MemoryStream();
            var writer = PdfWriter.GetInstance(document, output);

            // Open the Document for writing
            document.Open();

            // First, create our fonts...
            var titleFont = FontFactory.GetFont("Arial", 18, Font.BOLD);
            var subTitleFont = FontFactory.GetFont("Arial", 14, Font.BOLD);
            var boldTableFont = FontFactory.GetFont("Arial", 12, Font.BOLD);
            var endingMessageFont = FontFactory.GetFont("Arial", 10, Font.ITALIC);
            var bodyFont = FontFactory.GetFont("Arial", 12, Font.NORMAL);

            // Add the title
            document.Add(new Paragraph("UNO Student Plan of Study Details", titleFont));

            var logo = iTextSharp.text.Image.GetInstance(Server.MapPath("~/images/uno.jpg"));
            logo.ScalePercent(24f);
            logo.SetAbsolutePosition(460, 780);
            document.Add(logo);

            // Now add the "" message
            document.Add(new Paragraph(" ", bodyFont));
            document.Add(Chunk.NEWLINE);

            // Add the "Student Information" subtitle
            document.Add(new Paragraph("Student Information", subTitleFont));

            // Create the Student Information table
            var studentInfoTable = new PdfPTable(2);
            studentInfoTable.HorizontalAlignment = 0;
            studentInfoTable.SpacingBefore = 10;
            studentInfoTable.SpacingAfter = 10;
            studentInfoTable.DefaultCell.Border = 0;

            studentInfoTable.SetWidths(new int[] { 1, 3 });
            studentInfoTable.AddCell(new Phrase("Nu Id:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[0].ToString());
            studentInfoTable.AddCell(new Phrase("First Name:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[1].ToString());
            studentInfoTable.AddCell(new Phrase("Last Name:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[2].ToString());
            studentInfoTable.AddCell(new Phrase("Email Id:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[3].ToString());
            studentInfoTable.AddCell(new Phrase("Phone:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[4].ToString());
            studentInfoTable.AddCell(new Phrase("Department:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[5].ToString());
            studentInfoTable.AddCell(new Phrase("Option:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[6].ToString());
            studentInfoTable.AddCell(new Phrase("Concentration:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[7].ToString());
            studentInfoTable.AddCell(new Phrase("Transition:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[8].ToString());
            studentInfoTable.AddCell(new Phrase("Credits:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[9].ToString());
            studentInfoTable.AddCell(new Phrase("Semester:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[10].ToString());
            studentInfoTable.AddCell(new Phrase("Joining Year:", boldTableFont));
            studentInfoTable.AddCell(dt.Rows[0].ItemArray[11].ToString());

            document.Add(studentInfoTable);
            document.Add(Chunk.NEWLINE);
            document.Add(Chunk.NEWLINE);

            // Add the "Student Information" subtitle
            document.Add(new Paragraph("Student Plan of Study Details", subTitleFont));
            document.Add(new Paragraph(" ", bodyFont));

            //---- Add Result of DataTable to PDF file With Header -----
            PdfPTable pdfTable = new PdfPTable(dt1.Columns.Count);
            pdfTable.DefaultCell.Padding = 2;
            pdfTable.WidthPercentage = 100; // percentage
            pdfTable.DefaultCell.BorderWidth = 2;
            pdfTable.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;

            foreach (DataColumn column in dt1.Columns)
            {
                pdfTable.AddCell(FormatHeaderPhrase(column.ColumnName));
            }
            pdfTable.HeaderRows = 1; // this is the end of the table header
            pdfTable.DefaultCell.BorderWidth = 1;

            foreach (DataRow row in dt1.Rows)
            {
                foreach (object cell in row.ItemArray)
                {
                    //assume toString produces valid output
                    pdfTable.AddCell(FormatPhrase(cell.ToString()));
                }
            }
            document.Add(pdfTable);
            document.Add(Chunk.NEWLINE);

            // Create the Student Information table
            var signatureTable = new PdfPTable(2);
            signatureTable.HorizontalAlignment = 0;
            signatureTable.SpacingBefore = 10;
            signatureTable.SpacingAfter = 10;
            signatureTable.DefaultCell.Border = 0;

            //signatureTable.SetWidths(new int[] { 1, 1 });
            signatureTable.WidthPercentage = 100;
            signatureTable.AddCell("__________________________");
            //signatureTable.AddCell("                            __________________________");
            signatureTable.AddCell("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t __________________________");
            signatureTable.AddCell(new Phrase("\t\t\t\t\t\t\t\t Advisor Signature", boldTableFont));
            //signatureTable.AddCell(new Phrase ("                                        Student Signature", boldTableFont));
            signatureTable.AddCell(new Phrase("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Student Signature", boldTableFont));
            document.Add(signatureTable);

            //document.Footer;

            document.Close();
            
            Response.ContentType = "application/pdf";
            //Response.AddHeader("Content-Disposition", string.Format("inline;filename=" + sNuId + "-{0}.pdf", "POS Details"));
            Response.AddHeader("Content-Disposition", "attachment;filename=" + sNuId + " - POS Details.pdf");           
            Response.BinaryWrite(output.ToArray());
            Response.End();
        }

        private static Phrase FormatHeaderPhrase(string value)
        {
            return new Phrase(value, FontFactory.GetFont(FontFactory.TIMES_BOLD, 10, new iTextSharp.text.Color(0, 0, 0)));
        }

        private Phrase FormatPhrase(string value)
        {
            return new Phrase(value, FontFactory.GetFont(FontFactory.TIMES_BOLD, 8));
        }

    }
}
