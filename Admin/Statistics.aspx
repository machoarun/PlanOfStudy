<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="POS_Code.Statistics"
    MasterPageFile="~/Admin/POS.Master" Title="POS Statistics Page" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div id="title">
            <asp:Label ID="Label1" runat="server" CssClass="LabelHeading" Text="Statistics of the Course/Students"
                Font-Bold="True" ForeColor="#FF9933"></asp:Label>
        </div>
        <div>
            <table id="tblDDL" width="800px">
                <tr>
                    <td class="bfont" align="right" style="width: 390px">
                        <asp:Label ID="lblSelect" runat="server" Text="Select Statistics Based On:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSelect" runat="server" CssClass="DDL" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSelect_SelectedIndexChanged">
                            <asp:ListItem Selected="True" />
                            <asp:ListItem Value="Active">Enrolled Students</asp:ListItem>
                            <asp:ListItem Value="Concentration">Type of Concentration</asp:ListItem>
                            <asp:ListItem Value="Course">Course Name</asp:ListItem>
                            <asp:ListItem Value="Options">Degree Options</asp:ListItem>
                            <asp:ListItem Value="Semester">Semester</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
            </table>
        </div>
        <%--<asp:Panel ID="pnlConcentration" runat="server" Visible="false">
            <table id="tblConcentration" width="800px">
                <tr>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblConcentration" runat="server" Text="Concentration:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                        <asp:DropDownList ID="ddlConcentration" runat="server" Width="150px" DataSourceID="Concentration"
                            DataTextField="FLD_CONCENTRATION_NAME" DataValueField="FLD_CONCENTRATION_ID"
                            CssClass="DDL">
                        </asp:DropDownList>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
            </table>
        </asp:Panel>--%>
        <asp:Panel ID="pnlCourse" runat="server" Visible="false">
            <table id="tblCourse" width="800px">
                <tr>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblCourse" runat="server" Text="Course:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                        <asp:DropDownList ID="ddlCourse" runat="server" Width="250px" DataSourceID="Course"
                            DataTextField="FLD_Course_NAME" DataValueField="FLD_COURSE_NAME" CssClass="DDL">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 134px">
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <%-- <asp:Panel ID="pnlOptions" runat="server" Visible="false">
            <table id="tblOptions" width="800px">
                <tr>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblOptions" runat="server" Text="Degree Options:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                        <asp:DropDownList ID="ddlOptions" runat="server" Width="150px" DataSourceID="Program"
                            DataTextField="FLD_PROGRAM_NAME" DataValueField="FLD_PROGRAM_ID" CssClass="DDL">
                        </asp:DropDownList>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
            </table>
        </asp:Panel>--%>
        <asp:Panel ID="pnlActive" runat="server" Visible="false">
            <table id="tblActive" width="800px">
                <tr>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblFrom" runat="server" Text="From Semester-Year:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                        <asp:DropDownList ID="ddlSemesterFrom" runat="server" CssClass="DDL" Width="50px">
                            <asp:ListItem Value="Fall" />
                            <asp:ListItem Value="Spring" />
                        </asp:DropDownList>
                        <asp:TextBox ID="txtYearFrom" runat="server" CssClass="TextBox" MaxLength="4" Width="50px"></asp:TextBox>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
                <tr>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblTo" runat="server" Text="To Semester-Year:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                        <asp:DropDownList ID="ddlSemesterTo" runat="server" CssClass="DDL" Width="50px">
                            <asp:ListItem Value="Fall" />
                            <asp:ListItem Value="Spring" />
                        </asp:DropDownList>
                        <asp:TextBox ID="txtYearTo" runat="server" CssClass="TextBox" MaxLength="4" Width="50px"></asp:TextBox>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlSemester" runat="server" Visible="false">
            <table id="tblSelect" width="800px">
                <tr>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblSemester" runat="server" Text="Semester:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                        <asp:DropDownList ID="ddlSemester" runat="server" CssClass="DDL" Width="85px">
                            <asp:ListItem Value="Fall" />
                            <asp:ListItem Value="Spring" />
                        </asp:DropDownList>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
                <tr>
                    <td class="bfont" align="right">
                        <asp:Label ID="lblYear" runat="server" Text="Year:"></asp:Label>
                    </td>
                    <td class="tableCellWidth">
                        <asp:TextBox ID="txtYear" runat="server" CssClass="TextBox" MaxLength="4" Width="75px"></asp:TextBox>
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <div>
            <table id="tblSearch" width="800px">
                <tr>
                    <td class="tableCellWidth">
                    </td>
                    <td align="center" colspan="2">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                            CssClass="Label" />
                    </td>
                    <td class="tableCellWidth">
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table id="tblChart" border="0" cellpadding="0" cellspacing="0" align="center" width="800px">
                <tr>
                    <td class="bfont" align="center" colspan="2">
                        <asp:GridView ID="gdDetails" runat="server" Width="600px" AutoGenerateColumns="True"
                            Caption="Statistics Details" Visible="False" Font-Names="Arial Narrow" HorizontalAlign="Center"
                            CaptionAlign="Top" Font-Bold="True" Font-Size="Medium">
                            <FooterStyle Font-Bold="True" ForeColor="White" BackColor="#507CD1" />
                            <RowStyle CssClass="GridViewRow" HorizontalAlign="Center" />
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
                    <td class="bfont" align="center" colspan="2" visible="false">
                        <asp:Panel ID="pnlLine" runat="server" BorderStyle="Double" CssClass="box" Height="400px"
                            Width="600px" Visible="false">
                            <asp:Chart ID="ChartLine" runat="server" BorderlineColor="Black" BorderlineDashStyle="Solid"
                                BackColor="#507CD1" BackGradientStyle="TopBottom" BackSecondaryColor="White"
                                Height="400px" Width="600px">
                                <Titles>
                                    <asp:Title Name="Title1" Text="Students Statistics Line Chart" Alignment="TopCenter"
                                        Font="Verdana, 12pt, style=Bold">
                                    </asp:Title>
                                </Titles>
                                <Legends>
                                    <asp:Legend Name="Options" Enabled="false">
                                    </asp:Legend>
                                </Legends>
                                <Series>
                                    <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Options" Name="Series1"
                                        Enabled="false" BorderWidth="3" MarkerStyle="Star4" MarkerSize="14">
                                    </asp:Series>
                                    <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Options" Name="Series2"
                                        Enabled="false" BorderWidth="3" MarkerStyle="Star5" MarkerSize="14">
                                    </asp:Series>
                                    <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Options" Name="Series3"
                                        Enabled="false" BorderWidth="3" MarkerStyle="Star6" MarkerSize="14">
                                    </asp:Series>
                                    <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Options" Name="Series4"
                                        Enabled="false" BorderWidth="3" MarkerStyle="Circle" MarkerSize="14">
                                    </asp:Series>
                                    <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Options" Name="Series5"
                                        Enabled="false" BorderWidth="3" MarkerStyle="Diamond" MarkerSize="14">
                                    </asp:Series>
                                    <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Options" Name="Series6"
                                        Enabled="false" BorderWidth="3" MarkerStyle="Square" MarkerSize="14">
                                    </asp:Series>
                                    <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Options" Name="Series7"
                                        Enabled="false" BorderWidth="3" MarkerStyle="Triangle" MarkerSize="14">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea BackGradientStyle="TopBottom" BackSecondaryColor="#B6D6EC" BorderDashStyle="Solid"
                                        BorderWidth="2" Name="ChartArea1">
                                        <AxisX>
                                            <MajorGrid Enabled="False" />
                                        </AxisX>
                                        <AxisY Title="Number of Students">
                                        </AxisY>
                                        <%-- <Area3DStyle Enable3D="True" Inclination="10" />--%>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </asp:Panel>
                        <asp:Panel ID="pnlColumn" runat="server" BorderStyle="Double" CssClass="box" Height="400px"
                            Width="600px" Visible="false">
                            <asp:Chart ID="ChartColumn" runat="server" BorderlineColor="Black" BorderlineDashStyle="Solid"
                                BackColor="#507CD1" BackGradientStyle="TopBottom" BackSecondaryColor="White"
                                Height="400px" Width="600px">
                                <Titles>
                                    <asp:Title Name="Title1" Text="Students Statistics Column Chart" Alignment="TopCenter"
                                        Font="Verdana, 12pt, style=Bold">
                                    </asp:Title>
                                </Titles>
                                <Series>
                                    <asp:Series Name="Series1" CustomProperties="DrawingStyle=Cylinder,
                                     MaxPixelPointWidth=50" ShadowOffset="2">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackGradientStyle="TopBottom" BackSecondaryColor="#B6D6EC"
                                        BorderDashStyle="Solid" BorderWidth="2">
                                        <AxisX>
                                            <MajorGrid Enabled="False" />
                                            <LabelStyle Interval="1"/>
                                        </AxisX>
                                        <AxisY Title="Number of Students">
                                        </AxisY>
                                        <Area3DStyle  Enable3D="true"/>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </asp:Panel>
                        <%--<asp:Panel ID="pnlPie" runat="server" BorderStyle="Double" CssClass="box" Height="350px"
                            Width="400px" Visible="false">
                            <asp:Chart ID="ChartPie" runat="server" BorderlineColor="Black" BorderlineDashStyle="Solid"
                                BackColor="#507CD1" BackGradientStyle="TopBottom" BackSecondaryColor="White"
                                Height="350px" Width="400px">
                                <Titles>
                                    <asp:Title Name="Course Name" Text="Student Statistics Pie Chart" Alignment="TopCenter"
                                        Font="Verdana, 12pt, style=Bold">
                                    </asp:Title>
                                </Titles>
                                <Legends>
                                    <asp:Legend Name="Legend1">
                                    </asp:Legend>
                                </Legends>
                                <Series>
                                    <asp:Series ChartType="Pie" CustomProperties="DrawingStyle=Pie, 
                                    PieDrawingStyle=Concave, MaxPixelPointWidth=50" IsValueShownAsLabel="True" IsXValueIndexed="True"
                                        Legend="Legend1" Name="Series1" ShadowOffset="2">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackGradientStyle="TopBottom" BackSecondaryColor="#B6D6EC"
                                        BorderDashStyle="Solid" BorderWidth="2" AlignmentOrientation="Horizontal" AlignmentStyle="PlotPosition">
                                        <AxisX Title="Course Name">
                                            <MajorGrid Enabled="False" />
                                        </AxisX>
                                        <Area3DStyle Enable3D="True" Inclination="50" />
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </asp:Panel>--%>
                    </td>
                </tr>
                <tr>
                    <td class="tableCellWidth">
                    </td>
                </tr>
                <tr>
                    <td class="tableCellWidth">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="tableCellWidth">
                        &nbsp;
                    </td>
                </tr>
                 <tr>
                    <td class="tableCellWidth">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                 <tr>
                    <td class="tableCellWidth">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                 <tr>
                    <td class="tableCellWidth">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </ajax:ToolkitScriptManager>
            <asp:AccessDataSource ID="Concentration" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                SelectCommand="SELECT [FLD_CONCENTRATION_ID], [FLD_CONCENTRATION_NAME] FROM [CONCENTRATION] order by FLD_CONCENTRATION_ID">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="Course" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                SelectCommand="SELECT DISTINCT [FLD_COURSE_ID], [FLD_COURSE_NAME] FROM [COURSE] order by FLD_COURSE_NAME">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="Program" runat="server" DataFile="F:\Retina Folder\Downloads\Masters Project\POS_Code\Sample POS\App_Data\POS.mdb"
                SelectCommand="SELECT [FLD_PROGRAM_ID], [FLD_PROGRAM_NAME] FROM [TYPE_OF_PROGRAM] order by FLD_PROGRAM_ID">
            </asp:AccessDataSource>
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
        </div>
    </div>
</asp:Content>
