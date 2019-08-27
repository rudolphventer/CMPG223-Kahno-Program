<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kahno_Main.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 33px;
        float: left;
    }
    .auto-style2 {
        margin-left: 0px;
    }
    .auto-style3 {
        height: 33px;
        width: 609px;
    }
    .auto-style4 {
            width: 609px;
        }
        .auto-style5 {
            width: 609px;
            height: 20px;
        }
        .auto-style6 {
            height: 20px;
        }
        .auto-style7 {
            width: 232px;
        }
        .auto-style9 {
            height: 20px;
            width: 232px;
        }
        .auto-style10 {
            width: 232px;
            height: 33px;
        }
        .auto-style11 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="text-align:center" class="auto-style11">
    <tr>
        <td class="auto-style3" rowspan="1">
        </td>
        <td class="auto-style10">
            <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Please sign in"></asp:Label>
        </td>
        <td class="auto-style1" colspan="1" rowspan="1"></td>
    </tr>
    <tr>
        <td class="auto-style4">
            &nbsp;</td>
        <td class="auto-style7">
            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style2" OnTextChanged="TextBox1_TextChanged" Width="100%"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
        <tr>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style7">
            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Width="100%"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
        </tr>
        <tr>
        <td class="auto-style5"></td>
        <td class="auto-style9">
            <asp:Label ID="Label4" runat="server" Text="No user with those credentials!" Visible="False"></asp:Label>
        </td>
        <td class="auto-style6"></td>
        </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style7">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Height="37px" Width="100px" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
    </asp:Content>
