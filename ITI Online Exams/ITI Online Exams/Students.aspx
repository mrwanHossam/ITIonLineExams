<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="ITI_Online_Exams.Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navPlaceHolder" runat="server">





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder1" runat="server">


    <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Depatrment Name : </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddl_dept" DataTextField="Dept_Name" DataValueField="Dept_Id" runat="server" Width="162px">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">First Name :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_fname" runat="server" Width="204px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_fname" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="v"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Last Name :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_lname" runat="server" Width="205px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_lname" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="v"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Address :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_address" runat="server" Width="206px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_address" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="v"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Age : </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_age" runat="server" Width="206px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_age" ErrorMessage="Required !" ForeColor="#CC0000" ValidationGroup="v"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be greater then 18" ForeColor="#CC0000" MaximumValue="200" MinimumValue="18" Type="Integer" ValidationGroup="v" ControlToValidate="txt_age"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="btn_save" runat="server" Text="Save" ValidationGroup="v" Width="89px" OnClick="btn_save_Click" />
                    </td>
                    <td>
                        <input id="st_hidden_id" runat="server" type="hidden" />
                     
                    </td>
                </tr>
            </table>
        
            <asp:Label ID="lbl_meesage" runat="server" ForeColor="#CC0000"></asp:Label>
            <br />
        
            <asp:GridView ID="grd_students" OnRowCommand="grd_students_RowCommand" AutoGenerateColumns="false" runat="server" Height="254px" Width="524px">
                <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button CommandName="DeleteStudent" CommandArgument='<%#Eval("St_Id") %>' runat="server" Text ="Delete" />
                        <asp:Button CommandName="EditCurrentStudent" CommandArgument='<%#Eval("St_Id") %>' runat="server" Text ="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="St_Fname" HeaderText="First Name" />
                <asp:BoundField DataField="St_Lname" HeaderText="Last Name" />
                <asp:BoundField DataField="St_Address" HeaderText="Address" />
                <asp:BoundField DataField="St_Age" HeaderText="Age" />
                <asp:BoundField DataField="Department.Dept_Name" HeaderText="Department" />
            </Columns>
            </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="extracontentPlaceHolder" runat="server">
</asp:Content>
