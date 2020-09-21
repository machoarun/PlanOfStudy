<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPOSDetails.aspx.cs"
    Inherits="POS_Code.AddPOSDetails" MasterPageFile="~/Admin/POS.Master" Title="Add Course Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div id="title">
            <asp:Label ID="Label1" runat="server" CssClass="LabelHeading" Text="Add Student POS Details"
                Font-Bold="True" ForeColor="#FF9933"></asp:Label>
        </div>
        <div>
            <asp:Panel runat="server" BorderColor="#336600" BorderStyle="None" Visible="true"
                Width="200px">
                <table id="Table1" border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td colspan="1">
                            <asp:Label ID="lblActive" runat="server" Text="Active" Font-Bold="True" ForeColor="#336600">                
                            </asp:Label>
                        </td>
                        <td colspan="1">
                            <asp:RadioButtonList ID="rdActiveStatus" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                <asp:ListItem Value="No" Text="No"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:Button ID="btnActive" runat="server" Text="Update" CssClass="Label" OnClick="btnActive_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div>
            <table id="addcontact" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td>
                        <asp:Panel runat="server" ID="StudentPanel" BorderColor="#336600" BorderStyle="Double"
                            Visible="true">
                            <asp:GridView ID="StudentData" runat="server" Width="800px" AutoGenerateColumns="False"
                                Caption="Student Details" CellPadding="2" DataKeyNames="FLD_STUDENT_ID" DataSourceID="Student_Data"
                                Font-Names="Arial Narrow" GridLines="Both" HorizontalAlign="Center" BorderStyle="Solid"
                                PageSize="1" EmptyDataText="No data exists" CaptionAlign="Top" Font-Bold="True"
                                Font-Size="Medium">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
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
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FLD_NU_ID" HeaderText="NU ID" SortExpression="FLD_NU_ID"
                                        ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_FIRST_NAME" HeaderText="FIRST NAME" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_LAST_NAME" HeaderText="LAST NAME" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_PHONE" HeaderText="PHONE" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_CONCENTRATION_NAME" HeaderText="CONCENTRATION">
                                        <ControlStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_PROGRAM" HeaderText="PROGRAM" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_CREDITS" HeaderText="OPTIONS" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="50px" />
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
                        <asp:Panel runat="server" ID="POSPanel" BorderColor="#336600" BorderStyle="Double"
                            Visible="true">
                            <asp:GridView ID="gdPOS" runat="server" Width="800px" AutoGenerateColumns="False"
                                Caption="Plan of Study " DataSourceID="PlanOfStudy" DataKeyNames="FLD_COURSE_ID"
                                CellPadding="4" Font-Names="Arial Narrow" HorizontalAlign="Center" EmptyDataText="No data exists"
                                CaptionAlign="Top" Font-Bold="True" Font-Size="Medium" AllowSorting="True" OnSelectedIndexChanged="gdPOS_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update"
                                                Text="Update"></asp:LinkButton>
                                            <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FLD_COURSE_ID" HeaderText="COURSE ID" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_COURSE_NAME" HeaderText="COURSE NAME" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_SEMESTER" HeaderText="SEMESTER" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_YEAR" HeaderText="YEAR" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_CREDITS" HeaderText="CREDITS" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_TYPE" HeaderText="" ItemStyle-BorderColor="#336600">
                                        <ControlStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?');"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel runat="server" ID="TransitionPanel" BorderColor="#336600" BorderStyle="Double"
                            Visible="true">
                            <asp:GridView ID="gdTransition" runat="server" Width="800px" AutoGenerateColumns="False"
                                Caption="Transition Course Details" CellPadding="4" DataKeyNames="FLD_TRANSITION_COURSE_ID"
                                DataSourceID="Transition" Font-Names="Arial Narrow" HorizontalAlign="Center"
                                Visible="false" EmptyDataText="No data exists" CaptionAlign="Top" Font-Bold="True"
                                Font-Size="Medium" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gdTransition_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="FLD_TRANSITION_COURSE_ID" HeaderText="COURSE ID" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_TRANSITION_COURSE_NAME" HeaderText="TRANSITION COURSE"
                                        ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_SEMESTER" HeaderText="OFFERED IN" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_CREDITS" HeaderText="CREDITS" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle Font-Bold="True" ForeColor="White" BackColor="#507CD1" />
                                <RowStyle CssClass="GridViewRow" />
                                <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                                <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle CssClass="GridViewHeader" />
                                <AlternatingRowStyle CssClass="GridViewRowAlternateRow" />
                                <EmptyDataRowStyle CssClass="SubLabel" />
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel runat="server" ID="CoursePanel" BorderColor="#336600" BorderStyle="Double"
                            Visible="true">
                            <asp:GridView ID="gdCourseWork" runat="server" Width="800px" AutoGenerateColumns="False"
                                Caption="Core Course Details" CellPadding="4" DataKeyNames="FLD_COURSEWORK_ID"
                                DataSourceID="CourseWork" Font-Names="Arial Narrow" HorizontalAlign="Center"
                                EmptyDataText="No data exists" CaptionAlign="Top" Font-Bold="True" Font-Size="Medium"
                                AutoGenerateSelectButton="True" OnSelectedIndexChanged="gdCourseWork_SelectedIndexChanged"
                                PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="FLD_COURSEWORK_ID" HeaderText="COURSE ID" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_COURSEWORK_NAME" HeaderText="COURSE NAME" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_SEMESTER" HeaderText="OFFERED IN" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_CREDITS" HeaderText="CREDITS" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle Font-Bold="True" ForeColor="White" BackColor="#507CD1" />
                                <RowStyle CssClass="GridViewRow" />
                                <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                                <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle CssClass="GridViewHeader" />
                                <AlternatingRowStyle CssClass="GridViewRowAlternateRow" />
                                <EmptyDataRowStyle CssClass="SubLabel" />
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel runat="server" ID="ConcentrationPanel" BorderColor="#336600" BorderStyle="Double"
                            Visible="true">
                            <asp:GridView ID="gdConcentration" runat="server" Width="800px" AutoGenerateColumns="False"
                                Caption="Concentration Course Details" CellPadding="4" DataKeyNames="FLD_COURSE_ID"
                                DataSourceID="Concentration" Font-Names="Arial Narrow" HorizontalAlign="Center"
                                EmptyDataText="No data exists" CaptionAlign="Top" Font-Bold="True" Font-Size="Medium"
                                AutoGenerateSelectButton="True" OnSelectedIndexChanged="gdConcentration_SelectedIndexChanged"
                                PageSize="4">
                                <Columns>
                                    <asp:BoundField DataField="FLD_COURSE_ID" HeaderText="COURSE ID" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_COURSE_NAME" HeaderText="COURSE NAME" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_SEMESTER" HeaderText="OFFERED IN" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FLD_CREDITS" HeaderText="CREDITS" ItemStyle-BorderColor="#336600">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle Font-Bold="True" ForeColor="White" BackColor="#507CD1" />
                                <RowStyle CssClass="GridViewRow" />
                                <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                                <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle CssClass="GridViewHeader" />
                                <AlternatingRowStyle CssClass="GridViewRowAlternateRow" />
                                <EmptyDataRowStyle CssClass="SubLabel" />
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Panel runat="server" ID="ElectivePanel" BorderColor="#336600" BorderStyle="Double"
                            Visible="true" Width="800px">
                            <div id="Div1" style="overflow: scroll; height: 375px" visible="true">
                                <asp:GridView ID="gdElectives" runat="server" Width="800px" AutoGenerateColumns="False"
                                    Caption="Electives Course Details " CellPadding="4" DataKeyNames="FLD_COURSE_ID"
                                    DataSourceID="Electives" Font-Names="Arial Narrow" HorizontalAlign="Center" CaptionAlign="Top"
                                    Font-Bold="True" Font-Size="Medium" AllowSorting="True" OnSelectedIndexChanged="gdElectives_SelectedIndexChanged"
                                    AutoGenerateSelectButton="True">
                                    <Columns>
                                        <asp:BoundField DataField="FLD_COURSE_ID" HeaderText="COURSE ID" ItemStyle-BorderColor="#336600">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="FLD_COURSE_NAME" HeaderText="COURSE NAME" ItemStyle-BorderColor="#336600">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="FLD_SEMESTER" HeaderText="OFFERED IN" ItemStyle-BorderColor="#336600">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="FLD_CREDITS" HeaderText="CREDITS" ItemStyle-BorderColor="#336600">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                    </Columns>
                                    <FooterStyle Font-Bold="True" ForeColor="White" BackColor="#507CD1" />
                                    <RowStyle CssClass="GridViewRow" />
                                    <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                                    <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle ForeColor="#336600" HorizontalAlign="Center" BackColor="White" VerticalAlign="Bottom" />
                                    <HeaderStyle CssClass="GridViewHeader" />
                                    <AlternatingRowStyle CssClass="GridViewRowAlternateRow" />
                                    <EmptyDataRowStyle CssClass="SubLabel" />
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" align="center">
                        <asp:Button ID="btn_next" runat="server" Text="Next" OnClick="btn_next_Click" />
                        &nbsp;&nbsp;&nbsp;
                    </td>
                    <td colspan="1">
                    </td>
                </tr>
            </table>
            <div>
                <asp:AccessDataSource ID="Student_Data" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                    SelectCommand="SELECT FLD_STUDENT_ID, FLD_NU_ID, FLD_FIRST_NAME, FLD_LAST_NAME, FLD_EMAIL, FLD_PHONE, 
                                    FLD_DEPT, FLD_SEMESTER, FLD_DOJ, FLD_PROGRAM, FLD_CREDITS, FLD_ACTIVE_STATUS, FLD_CONCENTRATION_NAME
                                      FROM STUDENT_DATA 
                                        WHERE (FLD_NU_ID = ?)">
                    <SelectParameters>
                        <asp:SessionParameter Name="FLD_NU_ID" SessionField="sNuId" Type="String" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </div>
            <div>
                <div>
                    <asp:AccessDataSource ID="Transition" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                        SelectCommand="SELECT FLD_TRANSITION_COURSE_ID, FLD_TRANSITION_COURSE_NAME, FLD_SEMESTER, FLD_CREDITS 
                                        FROM TRANSITION_COURSE 
                                         ORDER BY FLD_TRANSITION_COURSE_ID">
                        <SelectParameters>
                            <asp:Parameter Name="FLD_TRANSITION_COURSE_ID" DbType="Int16" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <div>
                        <asp:AccessDataSource ID="CourseWork" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                            SelectCommand="SELECT C.FLD_COURSEWORK_ID, C.FLD_COURSEWORK_NAME, C.FLD_SEMESTER, C.FLD_CREDITS 
                                            FROM COURSE_WORK C
                                             WHERE NOT EXISTS
                                                    (SELECT * 
                                                      FROM PLAN_OF_STUDY P
                                                        WHERE C.FLD_COURSEWORK_ID = P.FLD_COURSE_ID AND 
                                                             (P.FLD_NU_ID = ?))
                                              ORDER BY C.FLD_COURSEWORK_ID">
                            <SelectParameters>
                                <asp:SessionParameter Name="FLD_NU_ID" SessionField="sNuId" Type="String" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </div>
                    <div>
                        <asp:AccessDataSource ID="Concentration" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                            SelectCommand="SELECT C.FLD_COURSE_ID, C.FLD_COURSE_NAME, C.FLD_SEMESTER, C.FLD_CREDITS 
                                            FROM COURSE C
                                              WHERE NOT EXISTS
                                                    (SELECT * 
                                                      FROM PLAN_OF_STUDY P
                                                        WHERE C.FLD_COURSE_ID = P.FLD_COURSE_ID AND 
                                                             (P.FLD_NU_ID = ?))
                                                   AND C.FLD_COURSE_TYPE IN (?,?,?)
                                              ORDER BY C.FLD_COURSE_ID">
                            <SelectParameters>
                                <asp:SessionParameter Name="FLD_NU_ID" SessionField="sNuId" Type="String" />
                                <asp:SessionParameter Name="FLD_COURSE_TYPE" SessionField="iType1" Type="Int16" />
                                <asp:SessionParameter Name="FLD_COURSE_TYPE" SessionField="iType2" Type="Int16" />
                                <asp:SessionParameter Name="FLD_COURSE_TYPE" SessionField="iType3" Type="Int16" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </div>
                    <div>
                        <asp:AccessDataSource ID="Electives" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                            SelectCommand="SELECT C.FLD_COURSE_ID, C.FLD_COURSE_NAME, C.FLD_SEMESTER, C.FLD_CREDITS 
                                    FROM COURSE C
                                        WHERE NOT EXISTS
                                                    (SELECT * 
                                                      FROM PLAN_OF_STUDY P
                                                        WHERE C.FLD_COURSE_ID = P.FLD_COURSE_ID AND 
                                                             (P.FLD_NU_ID = ?)) 
                                                             AND C.FLD_COURSE_TYPE NOT IN (1,?,?,?)  
                                          ORDER BY C.FLD_COURSE_ID">
                            <SelectParameters>
                                <asp:SessionParameter Name="FLD_NU_ID" SessionField="sNuId" Type="String" />
                                <asp:SessionParameter Name="FLD_COURSE_TYPE" SessionField="iType1" Type="Int16" />
                                <asp:SessionParameter Name="FLD_COURSE_TYPE" SessionField="iType2" Type="Int16" />
                                <asp:SessionParameter Name="FLD_COURSE_TYPE" SessionField="iType3" Type="Int16" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </div>
                    <div>
                        <asp:AccessDataSource ID="PlanOfStudy" runat="server" ConflictDetection="CompareAllValues"
                            DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                            SelectCommand="SELECT FLD_NU_ID, FLD_COURSE_ID, FLD_COURSE_NAME, FLD_CREDITS, FLD_SEMESTER, FLD_YEAR, FLD_TYPE, FLD_TYPE_ID FROM PLAN_OF_STUDY 
                                    WHERE (FLD_NU_ID = ?) ORDER BY FLD_TYPE_ID ASC, FLD_YEAR ASC, FLD_SEMESTER DESC"
                            DeleteCommand="DELETE FROM [PLAN_OF_STUDY] WHERE [FLD_NU_ID] = ? AND [FLD_COURSE_ID] = ? "
                            UpdateCommand="UPDATE [PLAN_OF_STUDY] SET [FLD_YEAR] = ?, [FLD_SEMESTER] = ?
                                                    WHERE [FLD_NU_ID] = ? AND [FLD_COURSE_ID] = ? " OldValuesParameterFormatString="original_{0}"
                            EnableCaching="True">
                            <SelectParameters>
                                <asp:SessionParameter Name="FLD_NU_ID" SessionField="sNuId" Type="String" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:SessionParameter Name="FLD_NU_ID" SessionField="sNuId" Type="String" />
                                <asp:Parameter Name="original_FLD_COURSE_ID" Type="String" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FLD_YEAR" Type="String" />
                                <asp:Parameter Name="FLD_SEMESTER" Type="String" />
                                <asp:SessionParameter Name="original_FLD_NU_ID" SessionField="sNuId" Type="String" />
                                <asp:Parameter Name="original_FLD_COURSE_ID" Type="String" />
                            </UpdateParameters>
                        </asp:AccessDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
