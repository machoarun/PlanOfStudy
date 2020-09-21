<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="POSDetails.aspx.cs" Inherits="POS_Code.Student.POSDetails"
    MasterPageFile="~/Student/Student.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="title">
        <asp:Label ID="lblStudentTitle" runat="server" CssClass="LabelHeading" Text="Plan of Study Details"
            Font-Bold="True" ForeColor="#FF9933"></asp:Label>
    </div>
    <div>
        <table id="addcontact" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td>
                    <asp:Panel runat="server" ID="StudentPanel" BorderColor="#336600" BorderStyle="Double"
                        Visible="true">
                        <asp:GridView ID="gdStudentData" runat="server" Width="800px" AutoGenerateColumns="False"
                            Caption="Student Details" CellPadding="2" DataKeyNames="FLD_NU_ID" Font-Names="Arial Narrow"
                            GridLines="Both" HorizontalAlign="Center" BorderStyle="Solid" PageSize="1" EmptyDataText="No data exists"
                            CaptionAlign="Top" Font-Bold="True" Font-Size="Medium">
                            <Columns>
                                <%--<asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lbUpdateStudent" runat="server" CausesValidation="True" CommandName="Update"
                                            Text="Update" ItemStyle-BorderColor="#336600"></asp:LinkButton>
                                        <asp:LinkButton ID="lbCancelStudent" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="Cancel" ItemStyle-BorderColor="#336600"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbEditStudent" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="Edit" ItemStyle-BorderColor="#336600"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                <asp:BoundField DataField="FLD_NU_ID" HeaderText="NU ID" SortExpression="FLD_NU_ID"
                                    ItemStyle-BorderColor="#336600">
                                    <ItemStyle BorderColor="#336600"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FLD_FIRST_NAME" HeaderText="FIRST NAME" ItemStyle-BorderColor="#336600">
                                    <ItemStyle BorderColor="#336600"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FLD_LAST_NAME" HeaderText="LAST NAME" ItemStyle-BorderColor="#336600">
                                    <ItemStyle BorderColor="#336600"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FLD_PHONE" HeaderText="PHONE" ItemStyle-BorderColor="#336600">
                                    <ItemStyle BorderColor="#336600"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FLD_CONCENTRATION_NAME" HeaderText="CONCENTRATION"></asp:BoundField>
                                <asp:BoundField DataField="FLD_PROGRAM" HeaderText="PROGRAM" ItemStyle-BorderColor="#336600">
                                    <ItemStyle BorderColor="#336600"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FLD_CREDITS" HeaderText="OPTIONS" ItemStyle-BorderColor="#336600">
                                    <ItemStyle BorderColor="#336600"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle Font-Bold="True" ForeColor="White" BackColor="#507CD1" />
                            <RowStyle CssClass="GridViewRow" />
                            <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                            <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle CssClass="GridViewHeader" Font-Bold="False" Font-Italic="False" />
                            <AlternatingRowStyle CssClass="GridViewRowAlternateRow" />
                            <EmptyDataRowStyle CssClass="SubLabel" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel runat="server" ID="POSPanel" BorderColor="#336600" BorderStyle="Double"
                        Visible="true">
                        <asp:GridView ID="gdPOS" runat="server" Width="800px" AutoGenerateColumns="False"
                            Caption="Plan of Study " DataKeyNames="FLD_COURSE_ID" CellPadding="4" Font-Names="Arial Narrow" 
                            HorizontalAlign="Center" EmptyDataText="No data exists" CaptionAlign="Top" Font-Bold="True"
                             Font-Size="Medium" AllowSorting="True">
                            <Columns>                               
                                <asp:BoundField DataField="FLD_COURSE_ID" HeaderText="COURSE ID" ItemStyle-BorderColor="#336600">
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FLD_COURSE_NAME" HeaderText="COURSE NAME" ItemStyle-BorderColor="#000000">
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FLD_SEMESTER" HeaderText="SEMESTER" ItemStyle-BorderColor="#000000">
                                    <ItemStyle BorderColor="Black"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FLD_YEAR" HeaderText="YEAR" ItemStyle-BorderColor="#336600">
                                    <ItemStyle BorderColor="#336600" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FLD_CREDITS" HeaderText="CREDITS" ItemStyle-BorderColor="#000000">
                                    <ItemStyle BorderColor="#000000"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle Font-Bold="True" ForeColor="White" BackColor="#507CD1" />
                            <RowStyle CssClass="GridViewRow" />
                            <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                            <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle ForeColor="#214200" HorizontalAlign="Center" />
                            <HeaderStyle CssClass="GridViewHeader" />
                            <AlternatingRowStyle CssClass="GridViewRowAlternateRow" />
                            <EmptyDataRowStyle CssClass="SubLabel" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
