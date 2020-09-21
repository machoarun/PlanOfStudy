<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/POS.Master"
    Title="View Details" CodeBehind="DashBoard.aspx.cs" Inherits="POS_Code.DashBoard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>--%>
    <ajax:ToolkitScriptManager ID="ScriptManager1" runat="server" />

   <%-- <script type="text/javascript">
    function HideModalPopup() {
        $find("mpe").hide();
        return false;
    }
    </script>--%>

    <div>
        <div id="title">
            <asp:Label ID="Label1" runat="server" CssClass="LabelHeading" Text="Search Student Details"
                Font-Bold="True" ForeColor="#FF9933"></asp:Label>
        </div>
        <div>
            <table id="addcontact" border="0" cellpadding="0" cellspacing="0" width="800px">
                <tr>
                   <%-- <td class="tableCellWidth">
                    </td>
                    <td class="tableCellWidth">
                    </td>
                    <td class="tableCellWidth">
                    </td>
                    <td class="tableCellWidth">
                    </td>--%>
                </tr>
                <tr>
                <td colspan="1" class="tableCellWidth"></td>
                    <td colspan="1" align="right" class="tableCellWidth">
                        <asp:Label ID="lblNUID" runat="server" Text="NU ID:" CssClass="bfont"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtNUID" runat="server" CssClass="TextBox" MaxLength="8"></asp:TextBox>
                    </td>
                <%--</tr>
                <tr>--%>
                    <td colspan="1" align="right" class="tableCellWidth">
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name:" CssClass="bfont"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox"></asp:TextBox>
                    </td>
                    <td colspan="2" class="tableCellWidth"></td>
                </tr>
                <tr>
                <td colspan="1" class="tableCellWidth"></td>
                    <td colspan="1" align="right" class="tableCellWidth">
                        <asp:Label ID="lblOptions" runat="server" Text="Option:" CssClass="bfont"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlOption" runat="server" CssClass="DDL">
                            <asp:ListItem Selected="True"></asp:ListItem>
                            <asp:ListItem>CourseWork</asp:ListItem>
                            <asp:ListItem>Project</asp:ListItem>
                            <asp:ListItem>Thesis</asp:ListItem>
                        </asp:DropDownList>
                    </td>
               <%-- </tr>
                <tr>--%>
                    <td colspan="1" align="right" class="tableCellWidth">
                        <asp:Label ID="lblAcitve" runat="server" Text="Active:" CssClass="bfont"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlActive" runat="server" CssClass="DDL">
                            <asp:ListItem Selected="True"></asp:ListItem>
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td colspan="2" class="tableCellWidth"></td>
                </tr>
                <tr>
                    <td colspan="8" align="center" class="tableCellWidth">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="Label" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Panel ID="panel" runat="server" BorderColor="#336600" BorderStyle="Double" Visible="true">
                            <asp:GridView ID="gdStudentData" runat="server" Width="800px" AutoGenerateColumns="False"
                                Caption="Student Details" CellPadding="4" DataKeyNames="FLD_NU_ID" Font-Names="Arial Narrow"
                                HorizontalAlign="Center" CaptionAlign="Top" Font-Bold="True" Font-Size="Medium"
                                EmptyDataText="No data exists" OnRowCreated="gdStudentData_RowCreated">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                Text="Edit" OnClick="lbEdit_click"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PRINT">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgPrint" runat="server" ImageUrl="../images/print2.png" Width="25px"
                                                Height="25px" CausesValidation="false" CommandName="Print" OnClick="imgPrint_Click" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="VIEW">
                                        <ItemTemplate>
                                            <asp:Image ID="imgPOS" runat="server" ImageUrl="../images/magnifying1.png" Width="25px"
                                                Height="25px" />
                                            <ajax:PopupControlExtender ID="PopupControlExtender1" runat="server" PopupControlID="Panel1"
                                                TargetControlID="imgPOS" DynamicContextKey='<%# Eval("FLD_NU_ID") %>' DynamicControlID="Panel1"
                                                DynamicServiceMethod="GetDynamicContent">
                                            </ajax:PopupControlExtender>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FLD_NU_ID" HeaderText="NU ID" SortExpression="FLD_NU_ID" />
                                    <asp:BoundField DataField="FLD_FIRST_NAME" HeaderText="FIRST NAME" SortExpression="FLD_FIRST_NAME" />
                                    <asp:BoundField DataField="FLD_LAST_NAME" HeaderText="LAST NAME" SortExpression="FLD_LAST_NAME" />
                                    <asp:BoundField DataField="FLD_PHONE" HeaderText="PHONE" SortExpression="FLD_PHONE" Visible="false" />
                                    <asp:BoundField DataField="FLD_DEPT" HeaderText="DEPT" SortExpression="FLD_DEPT" Visible="false" />
                                    <asp:BoundField DataField="FLD_PROGRAM" HeaderText="OPTION" SortExpression="FLD_PROGRAM" />
                                    <asp:BoundField DataField="FLD_CONCENTRATION_NAME" HeaderText="CONCENTRATION" SortExpression="FLD_CONCENTRATION_NAME" />
                                    <asp:BoundField DataField="FLD_TRANSITION" HeaderText="TRANSITION" SortExpression="FLD_TRANSITION" />
                                    <asp:BoundField DataField="FLD_SEMESTER" HeaderText="SEMESTER" SortExpression="FLD_SEMESTER" />
                                    <asp:BoundField DataField="FLD_DOJ" HeaderText="YEAR" SortExpression="FLD_DOJ" />
                                    <asp:BoundField DataField="FLD_ACTIVE_STATUS" HeaderText="ACTIVE" SortExpression="FLD_ACTIVE_STATUS" />
                                </Columns>
                                <FooterStyle Font-Bold="True" ForeColor="White" BackColor="#507CD1" />
                                <PagerSettings PageButtonCount="3" />
                                <RowStyle CssClass="GridViewRow" />
                                <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                                <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle ForeColor="#336600" HorizontalAlign="Center" BackColor="White" VerticalAlign="Bottom" />
                                <HeaderStyle CssClass="GridViewHeader" />
                                <AlternatingRowStyle CssClass="GridViewRowAlternateRow" />
                                <EmptyDataRowStyle CssClass="SubLabel" />
                            </asp:GridView>
                        </asp:Panel>
                        <asp:Panel ID="Panel1" runat="server">
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        </br>
                    </td>
                </tr>
                <tr>
                    <td>
                        </br>
                    </td>
                </tr>
                <tr>
                    <td>
                        </br>
                    </td>
                </tr>
                <tr>
                    <td>
                        </br>
                    </td>
                </tr>
                <tr>
                    <td>
                        </br>
                    </td>
                </tr>
                <tr>
                    <td>
                        </br>
                    </td>
                </tr>
                <tr>
                    <td>
                        </br>
                    </td>
                </tr>
                <tr>
                    <td>
                        </br>
                    </td>
                </tr>
                <tr>
                    <td>
                        </br>
                    </td>
                </tr>
            </table>
        </div>
        <%--<ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </ajax:ToolkitScriptManager>--%>
        <%--<div>
            <asp:AccessDataSource ID="Student_Data" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                SelectCommand="SELECT FLD_NU_ID, FLD_FIRST_NAME, FLD_LAST_NAME, FLD_PHONE, FLD_DEPT, FLD_PROGRAM, FLD_CONCENTRATION_NAME, FLD_TRANSITION, FLD_DOJ, FLD_ACTIVE_STATUS FROM STUDENT_DATA">
            DataSourceID="Student_Data" </asp:AccessDataSource>
        </div>--%>
    </div>
</asp:Content>
