<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUsForm.aspx.cs" Inherits="Kahno_Main.AboutUsForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/13.jpg');
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


            <div class="floatingdiv">
                <h1>About Us</h1>  
                <p>Kahno was established by students, for students. The creators of Kahno identified a gap in the market for a localized food ordering app which enabled students to browse all of the different restaurants in their location without having to search for multiple restaurants menus on their respective sites. Kahno allows you to only waste your money, not your time.

                    </p>
                <p>
                    <asp:Image ID="Image1" runat="server" ImageUrl="kahnologo.png" style="width: 100%"/>
                </p>
        </div>
</asp:Content>
