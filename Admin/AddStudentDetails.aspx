<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudentDetails.aspx.cs"
    Inherits="POS_Code.AddStudentDetails" MasterPageFile="~/Admin/POS.Master" Title="Add Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div id="title">
            <asp:Label ID="lbl_message" runat="server" CssClass="LabelHeading" Text="Add Student Personal Details"
                Font-Bold="True" ForeColor="#FF9933"></asp:Label>
        </div>
        <div>
            <table id="addcontact" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td class="bfont">
                        <asp:Label ID="Label2" runat="server" CssClass="Label" Text="NU ID:"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="txtNuid" runat="server" CssClass="text" Width="75px" MaxLength="8"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="bfont">
                        <asp:Label ID="Label3" runat="server" CssClass="Label" Text="First Name:" 
                            Width="75px" Height="16px"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="txtFName" runat="server" CssClass="text" Width="250px" MaxLength="25"></asp:TextBox>
                    </td>
                    <td class="bfont">
                        <asp:Label ID="Label1" runat="server" CssClass="Label" Text="Last Name:" 
                            Width="75px" Height="16px"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="txtLName" runat="server" CssClass="text" Width="250px" MaxLength="25"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="bfont">
                        <asp:Label ID="Label4" runat="server" CssClass="Label" Text="Email:"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="text" Width="250px" MaxLength="25"></asp:TextBox>
                    </td>
                    <td class="bfont">
                        <asp:Label ID="Label5" runat="server" CssClass="Label" Text="Phone:"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="text" Width="250px" MaxLength="12"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="bfont">
                        <asp:Label ID="lblSemester" runat="server" CssClass="Label" Text="Semester:"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:DropDownList ID="ddlSemester" runat="server" Width="100px" CssClass="DDL">
                            <asp:ListItem Value="Fall">Fall</asp:ListItem>
                            <asp:ListItem Value="Spring">Spring</asp:ListItem>
                            <asp:ListItem Value="Summer">Summer</asp:ListItem>
                        </asp:DropDownList>
                      
                        <asp:TextBox ID="txtYear" runat="server" CssClass="text" Width="75px" MaxLength="4">
                        </asp:TextBox>
                    </td>
                    <td class="bfont">
                        <asp:Label ID="Label7" runat="server" CssClass="Label" Text="Major:"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:DropDownList ID="ddlDept" runat="server" Width="150px" DataSourceID="Department"
                            DataTextField="FLD_DEPARTMENT_NAME" DataValueField="FLD_DEPARTMENT_ID" CssClass="DDL">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="bfont">
                        <asp:Label ID="lblType" runat="server" CssClass="Label" Text="Options:" 
                            Width="110px" Height="16px"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:DropDownList ID="ddlType" runat="server" Width="150px" DataSourceID="Program"
                            DataTextField="FLD_PROGRAM_NAME" DataValueField="FLD_PROGRAM_ID" CssClass="DDL">
                        </asp:DropDownList>
                    </td>
                    <td class="bfont">
                        <asp:Label ID="lblConcentration" runat="server" CssClass="Label" Text="Concentration:"
                            Width="110px" Height="16px"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:DropDownList ID="ddlConcentration" runat="server" Width="150px" DataSourceID="Concentration"
                            DataTextField="FLD_CONCENTRATION_NAME" DataValueField="FLD_CONCENTRATION_ID"
                            CssClass="DDL">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="bfont">
                        <asp:Label ID="lblTransition" runat="server" CssClass="Label" Text="Transition Required:"
                            Width="135px" Height="16px"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:RadioButtonList ID="rbTransition" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="No" Enabled="true" Selected="True" Value="No"></asp:ListItem>
                            <asp:ListItem Text="Yes" Enabled="true" Selected="False" Value="Yes"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="bfont">
                        &nbsp;</td>
                    <td colspan="1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="1">
                    &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="1">
                    </td>
                    <td colspan="2" align="center">
                        <asp:Button ID="btn_reset" runat="server" CssClass="Button" Text="Reset" OnClick="btn_reset_Click" />&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_next" runat="server" CssClass="Button" Text="Next" OnClick="btn_next_Click" />&nbsp;&nbsp;&nbsp;
                    </td>
                    <td colspan="1">
                    </td>
                </tr>
                <tr>
                    <td colspan="1">
                    &nbsp;
                    </td>
                </tr>                
            </table>
            <br />
            <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </cc1:ToolkitScriptManager>
            <asp:AccessDataSource ID="Department" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                SelectCommand="SELECT [FLD_DEPARTMENT_ID], [FLD_DEPARTMENT_NAME] FROM [DEPARTMENT] order by FLD_DEPARTMENT_ID">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="Program" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                SelectCommand="SELECT [FLD_PROGRAM_ID], [FLD_PROGRAM_NAME] FROM [TYPE_OF_PROGRAM] order by FLD_PROGRAM_ID">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="Concentration" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                SelectCommand="SELECT [FLD_CONCENTRATION_ID], [FLD_CONCENTRATION_NAME] FROM [CONCENTRATION] order by FLD_CONCENTRATION_ID">
            </asp:AccessDataSource>
        </div>
    </div>
</asp:Content>
