<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Questions.aspx.cs" Inherits="ITI_Online_Exams.Questions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navPlaceHolder" runat="server">
    <li><a href="#" accesskey="h">Home</a></li>
    <li><a href="instructors.aspx" accesskey="i">instractors</a></li>
    <li><a href="Students.aspx" accesskey="s">Students</a></li>
    <li><a href="Questions.aspx" accesskey="q" id="current">Questions</a></li>
    <li><a href="Topics.aspx" accesskey="t">Topics</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder1" runat="server">
    <br />
    <br />
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">Course Name :</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddl_courses" DataTextField="Crs_Name" DataValueField="Crs_Id" runat="server" Height="16px" Width="187px">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Question id :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_qid" runat="server" Width="683px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_qid" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="q"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Question text : </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_qtext" runat="server" Width="683px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_qtext" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="q"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Question type :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_qtype" runat="server" Width="683px" OnTextChanged="txt_qtype_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_qtype" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="q"></asp:RequiredFieldValidator>
                        <asp:Label ID="lbl_Qtype" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Question answer :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_qanswer" runat="server" Width="683px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_qanswer" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="q"></asp:RequiredFieldValidator>
                        <asp:Label ID="lbl_Qanswer" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="btn_save_Q" runat="server" Text="Save" Width="105px" OnClick="btn_save_Q_Click" ValidationGroup="q" />
                        <br />
                        <asp:Label ID="lbl_msg_q" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <input id="Q_hidden_id" runat="server" type="hidden" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="grd_Questions" AutoGenerateColumns="false" runat="server" Width="618px" OnRowCommand="grd_Questions_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button CommandName="DeleteQuestion" CommandArgument='<%#Eval("Qstn_Id") %>' runat="server" Text="Delete" />
                        <asp:Button CommandName="EditCurrentQuestion" CommandArgument='<%#Eval("Qstn_Id") %>' runat="server" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Qstn_Id" HeaderText="Question id" />
                <asp:BoundField DataField="Qstn_Text" HeaderText="Question text" />
                <asp:BoundField DataField="Qstn_Type" HeaderText="Question type" />
                <asp:BoundField DataField="Qstn_Answer" HeaderText="Question answer" />
                <asp:BoundField DataField="Course.Crs_Name" HeaderText="Course Name" />
            </Columns>

        </asp:GridView>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="extracontentPlaceHolder" runat="server">
</asp:Content>
