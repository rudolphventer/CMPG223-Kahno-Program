<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditUserInfoForm.aspx.cs" Inherits="Kahno_Main.EditUserInfoForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 20px;
    }
    .auto-style2 {
        width: 100%;
    }
    .auto-style3 {
        width: 117px;
    }
    .auto-style4 {
        height: 20px;
        width: 117px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
      <div class="leftcolumn">

         <div class="card">
             <h5>
                 <table class="auto-style2">
                     <tr>
                         <td class="auto-style3">
                             <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                         </td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style4">
                             <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                         </td>
                         <td class="auto-style1">
                             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                         </td>
                         <td class="auto-style1"></td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             <asp:Label ID="Label3" runat="server" Text="Phone Number:"></asp:Label>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter valid phone number!" ValidationExpression="^(?:\+?27[-.●]?)?\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$"></asp:RegularExpressionValidator>
                         </td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             <asp:Label ID="Label4" runat="server" Text="Email Address:"></asp:Label>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter a valid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                         </td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             &nbsp;</td>
                         <td>
                             <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
                         </td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             Latitude:</td>
                         <td>
                             <asp:TextBox ID="txtLatitude" runat="server"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLatitude" ErrorMessage="Co-ordinates only!" ValidationExpression="((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)"></asp:RegularExpressionValidator>
                         </td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             Longitude:</td>
                         <td>
                             <asp:TextBox ID="txtLongitude" runat="server"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtLongitude" ErrorMessage="Co-ordinates only!" ValidationExpression="((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)"></asp:RegularExpressionValidator>
                         </td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style4">&nbsp;</td>
                         <td class="auto-style1">
                             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
                         &nbsp;
                             <asp:Button ID="btnCoordinate" OnClientClick="getLocation();return false;" runat="server" Text="Refresh Coordinates" OnClick="btnCoordinate_Click" />
                         </td>
                         <td class="auto-style1"></td>
                     </tr>
                     <tr>
                         <td class="auto-style4">&nbsp;</td>
                         <td class="auto-style1">
                             <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete My Account" CssClass="deletebutton"/>
                         </td>
                         <td class="auto-style1">&nbsp;</td>
                     </tr>
                 </table>
             </h5>
         </div>
      </div>
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
               document.getElementById('ContentPlaceHolder1_txtLatitude').value = position.coords.latitude;
               document.getElementById('ContentPlaceHolder1_txtLongitude').value = position.coords.longitude;
           }

  </script>
</asp:Content>
