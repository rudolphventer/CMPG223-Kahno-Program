<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="Kahno_Main.Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/16.jpg');
    }   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="floatingdiv">
        <h1 style="text-align: center">Success!</h1>
        <h3>Your order has been placed, it should arrive shortly.</h3>
            <asp:Button ID="Button1" runat="server" Text="Take me home!" style="align-self: center" OnClick="Button1_Click"/>
            &nbsp;
        <br />
        <br />
        </div>
    
</asp:Content>
