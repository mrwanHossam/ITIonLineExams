<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ITI_Online_Exams.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <form runat="server">
        <p>
            user name :<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            <br />
            password :<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnLogin" Text="login" runat="server" OnClick="btnLogin_Click" />
        </p>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="extracontentPlaceHolder" runat="server">
</asp:Content>
