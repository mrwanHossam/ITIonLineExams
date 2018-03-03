<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Topics.aspx.cs" Inherits="ITI_Online_Exams.Topics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navPlaceHolder" runat="server">
    <li><a href="#" accesskey="h">Home</a></li>
    <li><a href="instructors.aspx" accesskey="i">instractors</a></li>
    <li><a href="Students.aspx" accesskey="s">Students</a></li>
    <li><a href="Questions.aspx" accesskey="q">Questions</a></li>
    <li><a href="Topics.aspx" accesskey="t" id="current">Topics</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder1" runat="server">
    <br />
    <br />
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">Course Name :</td>
                    <td>
                        <asp:DropDownList ID="ddl_coursename" DataTextField="Crs_Name" DataValueField="Crs_Id" runat="server" Width="192px">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Topic Name :</td>
                    <td>
                        <asp:TextBox ID="txt_topic_name" runat="server" Width="207px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_topic_name" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="x"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Topic ID:</td>
                    <td>
                        <asp:TextBox ID="txt_topic_id" runat="server" Width="207px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_topic_id" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="x"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="btn_save_topic" runat="server" Text="Save" Width="87px" OnClick="btn_save_topic_Click" ValidationGroup="x" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <input id="Topic_Hidden_id" runat="server" type="hidden" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="grd_topics" AutoGenerateColumns="false" runat="server" OnRowCommand="grd_topics_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button CommandName="DeleteTopic" CommandArgument='<%#Eval("Top_Id") %>' runat="server" Text="Delete" />
                        <asp:Button CommandName="EditCurrentTopic" CommandArgument='<%#Eval("Top_Id") %>' runat="server" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Top_Id" HeaderText="Topic id" />
                <asp:BoundField DataField="Top_Name" HeaderText="Topic text" />
                <asp:BoundField DataField="Course.Crs_Name" HeaderText="Course Name" />
            </Columns>
        </asp:GridView>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="extracontentPlaceHolder" runat="server">
</asp:Content>
