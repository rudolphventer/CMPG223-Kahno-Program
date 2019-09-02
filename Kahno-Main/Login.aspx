<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kahno_Main.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        margin-left: 0px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>&nbsp;</p>
    <div class="logindiv">
            <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Please sign in"></asp:Label>
        <br />
            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style2" OnTextChanged="TextBox1_TextChanged" Width="50%"></asp:TextBox>
        <br />
            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Width="50%" TextMode="Password"></asp:TextBox>
        <br />
            <asp:Label ID="Label4" runat="server" Text="No user with those credentials!" Visible="False"></asp:Label>
        <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Height="37px" Width="100px" />
        <br />
        <p></p>
        </div>
    </asp:Content>
