<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfessorHome.aspx.cs" Inherits="POS_Code.ProfessorHome"
    MasterPageFile="~/Professor/Professor.Master" Title="Plan of Study Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table id="POSTable" border="0" cellpadding="0" cellspacing="0" align="center" width="800px">
            <tr>
                <td align="center">
                    <div id="Label">
                        <asp:Label ID="lblProfessor" runat="server" Text="Graduate Plan of Study (POS)"
                            Font-Bold="True" ForeColor="#FF9933" Font-Size="Medium"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="txtbox">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    A graduate student's Plan of Study must be completed and approved no later than the beginning of the semester. 
                    Students should check with their department about when they must file a Plan of Study, 
                    as some programs require students to file plans earlier than beginning of the semester.
                    <br />
                                        The plan serves as a record of the student's intentions, an indicator of the likely time-to-degree, 
                    and as an official acknowledgement of the adviser's and committee members' approval of the student's plan.
                    <br />
                                        Plans of Study list graduation requirements for each of majors.
                    <br />
                    Students should see an adviser and should contact all potential members of their 
                    committee prior to filling out their plan. This procedure will ensure that 
                    delays in approval of a projected plan of study do not occur.<br />
                    Students should use a Plan of Study to track their progress toward earning a degree.
                    <br />
                    Students must submit a Final Plan of Study to the Registrar's Office during the
                    semester prior to the semester they intend to graduate.
                </td>
            </tr>
            <tr>
                <td class="txtbox">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
