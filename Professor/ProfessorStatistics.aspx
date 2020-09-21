<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfessorStatistics.aspx.cs" Inherits="POS_Code.ProfessorStatistics"
     MasterPageFile="~/Professor/Professor.Master" Title="POS Statistics Page" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div id="title">
            <asp:Label ID="Label1" runat="server" CssClass="LabelHeading" Text="Statistics of the Course"
                Font-Bold="True" ForeColor="#FF9933"></asp:Label>
        </div>
        <div id="Label">
            <asp:Label ID="lblCourse" runat="server" Text="" Font-Bold="True" ForeColor="#FF9933"></asp:Label>
        </div>
        <div>
        </div>
        <div>
            <table id="addcontact" border="0" cellpadding="0" cellspacing="0" align="center"
                width="800px">                
                <%--<tr>
                    <td class="tableCellWidth">
                    </td>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblSemester" runat="server" Text="Semester:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                        <asp:DropDownList ID="ddlSemester" runat="server" CssClass="DDL" Width="50px">
                            <asp:ListItem Value="Fall" />
                            <asp:ListItem Value="Spring" />
                        </asp:DropDownList>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
                <tr>
                    <td class="tableCellWidth">
                    </td>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblYear" runat="server" Text="Year:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                        <asp:TextBox ID="txtYear" runat="server" CssClass="TextBox" MaxLength="4" Width="25px"></asp:TextBox>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>--%>
                <tr>
                    <td class="tableCellWidth">
                    </td>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblCourseName" runat="server" Text="CourseName:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                         <asp:DropDownList ID="ddlCourse" runat="server" Width="250px" DataSourceID="Course"
                            DataTextField="FLD_Course_NAME" DataValueField="FLD_COURSE_NAME" CssClass="DDL">
                        </asp:DropDownList>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
                <tr>
                    <td class="tableCellWidth">
                    </td>
                    <td align="center" colspan="2">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="Label"/>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
                <tr visible="false">
                    <td class="bfont" align="center" colspan="4" visible="false">
                        <asp:GridView ID="gdDetails" runat="server" Width="500px" AutoGenerateColumns="False"
                            Caption="Semester Details" CellPadding="4" DataKeyNames="FLD_YEAR" Visible="False"
                            Font-Names="Arial Narrow" HorizontalAlign="Center" CaptionAlign="Top" Font-Bold="True"
                            Font-Size="Medium" AllowSorting="True">
                            <Columns>
                                <asp:BoundField DataField="FLD_YEAR" HeaderText="YEAR" ItemStyle-BorderColor="#336600">
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                               <%-- <asp:BoundField DataField="FLD_COURSE_NAME" HeaderText="COURSE NAME" ItemStyle-BorderColor="#336600">
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>--%>
                                <asp:BoundField DataField="'Number'" HeaderText="Number of Students" ItemStyle-BorderColor="#336600">
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
                    </td>
                </tr>
                <tr>
                    <td class="bfont" align="center" colspan="4" visible="false">                                  
                        <asp:Panel ID="pnlColumn" runat="server" BorderStyle="Double" CssClass="box" Height="350px" Width="400px" Visible="false">
                        <asp:Chart ID="ChartColumn" runat="server" BorderlineColor="Black" BorderlineDashStyle="Solid"
                            BackColor="#507CD1" BackGradientStyle="TopBottom" BackSecondaryColor="White"
                            Height="350px" Width="400px">
                            <Titles>
                                <asp:Title Name="Title1" Text="Students Statistics Column Chart" Alignment="TopCenter"
                                    Font="Verdana, 12pt, style=Bold">
                                </asp:Title>
                            </Titles>
                            <Series>
                                <asp:Series Name="Series1" CustomProperties="DrawingStyle=Cylinder,
                                     MaxPixelPointWidth=50" ShadowOffset="2" IsValueShownAsLabel="True">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackGradientStyle="TopBottom" BackSecondaryColor="#B6D6EC"
                                    BorderDashStyle="Solid" BorderWidth="2">
                                    <AxisX Title="Year">
                                        <MajorGrid Enabled="False" />
                                    </AxisX>
                                    <AxisY Title="Number of Students"></AxisY>
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        </asp:Panel>
                    </td>
                </tr>                
            </table>
        </div>
        <div>
            <%--<asp:AccessDataSource ID="Details" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                SelectCommand="SELECT FLD_COURSE_ID, FLD_COURSE_NAME, COUNT(FLD_COURSE_NAME) as 'Number'
                                    FROM PLAN_OF_STUDY 
                                        WHERE  [FLD_SEMESTER] = ? AND
                                               [FLD_YEAR] = ?
                                            GROUP BY [FLD_COURSE_ID], [FLD_COURSE_NAME]">
                <SelectParameters>
                    <asp:ControlParameter Name="FLD_SEMESTER" ControlID="ddlSemester" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="FLD_YEAR" ControlID="txtYear" />
                </SelectParameters>
            </asp:AccessDataSource>--%>
            <asp:AccessDataSource ID="Course" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                SelectCommand="SELECT DISTINCT [FLD_COURSE_ID], [FLD_COURSE_NAME] FROM [COURSE] order by FLD_COURSE_NAME">
            </asp:AccessDataSource>
        </div>
    </div>
</asp:Content>
