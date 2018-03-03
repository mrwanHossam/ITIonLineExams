<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentAnswers.aspx.cs" Inherits="ITI_Online_Exams.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:Label ID="Label1_stid" runat="server" Font-Size="Medium" Text="Student Id"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1_stid" runat="server" AutoPostBack="True"  DataTextField="St_Id" DataValueField="St_Id">
        </asp:DropDownList>
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineExamsProjectDBConnectionString %>" SelectCommand="SELECT [St_Id] FROM [Student]"></asp:SqlDataSource>--%>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Exam Id"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2_examid" runat="server" AutoPostBack="True"  DataTextField="Exam_Id" DataValueField="Exam_Id">
        </asp:DropDownList>
        <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineExamsProjectDBConnectionString %>" SelectCommand="SELECT [Exam_Id] FROM [Exam]"></asp:SqlDataSource>--%>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1_display" runat="server" OnClick="Button1_display_Click" Text="Display" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <%--<table>
              <tr>
                 <th>question text</th>
                 <th>choice text</th>
                   <th>question answer</th>
                   <th>question student answer</th>
              </tr>--%>
                </HeaderTemplate>
                <ItemTemplate>
                    <%--<tr>
              <td>--%>
                    <div>
                        <asp:Label runat="server" ID="Label1" Text='<%# dr.GetString(3) %>' />
                        <%--</td>
              <td>--%>
                        <asp:Label runat="server" ID="Label2" Text='<%# dr.GetString(5) %>' />
                        <%--</td>
              <td>--%>
                        <asp:Label runat="server" ID="Label5" Text='<%# dr.GetString(6) %>' />
                        <%--</td>
              <td>--%>
                        <asp:Label runat="server" ID="Label6" Text='<%# dr.GetString(7) %>' />
                        <%--</td>
          </tr>--%>
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <%--<tr>
              <td >
                <asp:Label runat="server" ID="Label3" 
                    text='<%# Eval("Qstn_Text") %>' />
              </td>
              <td >--%>
                 <%--<asp:Label runat="server" ID="Label4" text='<%# Eval("Chc_Text") %>' />--%>
              <%--</td>
               <td >
                 <asp:Label runat="server" ID="Label7" 
                     text='<%# Eval("Qstn_Answer") %>' />
              </td>
               <td >
                 <asp:Label runat="server" ID="Label8" 
                     text='<%# Eval("Qstn_stAnswer") %>' />
              </td>
          </tr>--%>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    <%--</table>--%>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="extracontentPlaceHolder" runat="server">
</asp:Content>
