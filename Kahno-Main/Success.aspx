<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="Kahno_Main.Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1 style="text-align: center">Success! Your order has been placed, it should arrive shortly. <br /><br />

            <asp:Button ID="Button1" runat="server" Text="Take me home!" style="align-self: center" OnClick="Button1_Click"/>
        </h1>
    
</asp:Content>
