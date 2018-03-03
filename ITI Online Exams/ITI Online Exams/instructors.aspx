<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="instructors.aspx.cs" Inherits="ITI_Online_Exams.instructors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navPlaceHolder" runat="server">
    <li><a href="#" accesskey="h">Home</a></li>
    <li><a href="instructors.aspx" accesskey="i" id="current">instractors</a></li>
    <li><a href="Students.aspx" accesskey="s">Students</a></li>
    <li><a href="Questions.aspx" accesskey="q">Questions</a></li>
    <li><a href="Topics.aspx" accesskey="t">Topics</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder1" runat="server">
    <br />
    <br />
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">Department Name :</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddl_department" DataTextField="Dept_Name" DataValueField="Dept_Id" runat="server" Width="207px">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Instructor ID :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_ins_id" runat="server" Width="363px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_ins_id" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="z"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Instructor Name :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_ins_name" runat="server" Width="363px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_ins_name" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="z"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Instructor Degree :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_ins_degree" runat="server" Width="363px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Instructor Salary : </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_ins_salary" runat="server" Width="363px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="btn_save_instructor" runat="server" OnClick="btn_save_instructor_Click" Text="Save" ValidationGroup="z" />
                        <br />
                        <asp:Label ID="lbl_msg_instructor" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <input id="Instructor_Hidden_id" runat="server" type="hidden" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="grd_instructors" AutoGenerateColumns="false" runat="server" OnRowCommand="grd_instructors_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button CommandName="DeleteInstructor" CommandArgument='<%#Eval("Ins_Id") %>' runat="server" Text="Delete" />
                        <asp:Button CommandName="EditCurrentInstructor" CommandArgument='<%#Eval("Ins_Id") %>' runat="server" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Ins_Id" HeaderText="Instructor Id" />
                <asp:BoundField DataField="Ins_Name" HeaderText="Instructor Name" />
                <asp:BoundField DataField="Ins_Degree" HeaderText="Instructor Degree" />
                <asp:BoundField DataField="Salary" HeaderText="Instructor Salary" />
                <asp:BoundField DataField="Department.Dept_Name" HeaderText="Department Id" />
            </Columns>
        </asp:GridView>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="extracontentPlaceHolder" runat="server">
</asp:Content>
