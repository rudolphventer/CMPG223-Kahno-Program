<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kahno_Main.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
            height: 25px;
            float: left;
        }
    .auto-style2 {
        margin-left: 0px;
    }
    .auto-style3 {
        height: 25px;
        width: 91px;
    }
    .auto-style4 {
            width: 91px;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
    <tr>
        <td class="auto-style3" rowspan="1">
        </td>
        <td class="auto-style1">
        </td>
        <td class="auto-style1" colspan="1" rowspan="1"></td>
    </tr>
    <tr>
        <td class="auto-style4">
            &nbsp;</td>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style2" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
        <tr>
        <td class="auto-style4">&nbsp;</td>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
        </tr>
        <tr>
        <td class="auto-style4">&nbsp;</td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="No user with those credentials!" Visible="False"></asp:Label>
        </td>
        <td>&nbsp;</td>
        </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
    </asp:Content>
