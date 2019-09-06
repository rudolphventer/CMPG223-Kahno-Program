<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kahno_Main.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style type="text/css">
    .auto-style2 {
        margin-left: 0px;
    }
    body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/12.jpg');
    }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>&nbsp;</p>
<div class="floatingdiv">
        <br />
            <h3>Sign in</h3>
            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style2" OnTextChanged="TextBox1_TextChanged" Width="50%"></asp:TextBox>
        <br />
        <br />
            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Width="50%" TextMode="Password"></asp:TextBox>
        <br />
            <asp:Label ID="Label4" runat="server" Text="No user with those credentials!" Visible="False"></asp:Label>
        <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Height="37px" Width="100px" />
        <br />
        <br />
        </div>
    <div id="coverscreen" class="coverscreen"></div>
    </asp:Content>
