<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="POS_Code.LoginPage"
    MasterPageFile="~/LoginPage.Master" Title="Plan of Study Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="title">
        <asp:Label ID="lblLogin" runat="server" CssClass="LabelHeading" Text="Login" Font-Bold="True"
            ForeColor="#FF9933"></asp:Label>
    </div>
    <div>
        <table id="logintable" runat="server" border="0" cellpadding="0" cellspacing="0"
            align="center">
            <tr>
                <td class="tableCellWidth">
                </td>
                <td class="tableCellWidth">
                </td>
                <td class="tableCellWidth">
                </td>
            </tr>
            <tr>
                <td class="tableCellWidth">
                </td>
                <td class="tableCellWidth" style="width: 408px">
                    <asp:Panel ID="pnlLogin" runat="server" BorderStyle="Double" Width="420px">
                        <asp:Login ID="lgnLogin" runat="server" Width="421px" OnAuthenticate="lgnLogin_Authenticate"
                            UserNameLabelText="Net ID:" UserNameRequiredErrorMessage="Net ID is required.">
                            <LayoutTemplate>
                                <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                    <tr>
                                        <td>
                                            <table border="0" cellpadding="0" style="width: 421px;">
                                                <tr>
                                                    <td align="center" colspan="2" class="Button">
                                                        Please enter your credentials and click the Login button below
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="Label">Net 
                                                        ID:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server" CssClass="TextBox"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                            ErrorMessage="Net ID is required." ToolTip="Net ID is required." ValidationGroup="lgnLogin">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="Label">Password:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="TextBox"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                            ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="lgnLogin">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="color: Red;">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="lgnLogin"
                                                            CssClass="Button" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:Login>
                    </asp:Panel>
                </td>
                <td class="tableCellWidth">
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
