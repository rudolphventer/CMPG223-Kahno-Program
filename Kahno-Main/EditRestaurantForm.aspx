<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditRestaurantForm.aspx.cs" Inherits="Kahno_Main.EditRestaurantForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3
        {
            width: 117px;
        text-align: right;
        vertical-align: top;
        }
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/5.jpg');
    }



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="floatingdiv">
        <h3>Edit your restaurant's details</h3>
    <table class="auto-style2">
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label1" runat="server" Text="Restaurant Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Phone Number:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter a valid phone number!" ValidationExpression="^(?:\+?27[-.●]?)?\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label3" runat="server" Text="Latitude:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Co-ordinates only!" ValidationExpression="((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label4" runat="server" Text="Longitude:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Co-ordinates only!" ValidationExpression="((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6"></td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:FileUpload ID="imgUpload" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnResetCoordinates" OnClientClick="getLocation();return false;" runat="server" Text="Reset Co-ordinates" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
            </td>
        </tr>
    </table>
        </div>
    <script>
           var x = document.getElementById("demo");

           function getLocation() {
               if (navigator.geolocation) {
                   navigator.geolocation.getCurrentPosition(showPosition);
               } else {
                   x.innerHTML = "Geolocation is not supported by this browser.";
               }
           }

           function showPosition(position) {
               var pos = "Latitude: " + position.coords.latitude + "Longitude: " + position.coords.longitude;
               document.getElementById('ContentPlaceHolder1_TextBox3').value = position.coords.latitude;
               document.getElementById('ContentPlaceHolder1_TextBox4').value = position.coords.longitude;
           }

  </script>
        
</asp:Content>
