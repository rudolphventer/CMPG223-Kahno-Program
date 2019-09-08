<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditUserInfoForm.aspx.cs" Inherits="Kahno_Main.EditUserInfoForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 20px;
        align-content:center;
        text-align:center;
    }
    .auto-style2 {
        width: 100%;
    }
    .auto-style3 {
        width: 117px;
        text-align: right;
        vertical-align: top;
    }
    .auto-style4 {
        height: 20px;
        width: 117px;
    }
        .auto-style5 {
            height: 20px;
        }
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/2.jpg');
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="floatingdiv">
             <h3>Edit your account details</h3>
                 <table class="auto-style2">
                     <tr>
                         <td class="auto-style3">
                             <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                         </td>
                         <td class="auto-style5">
                             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             <asp:Label ID="Label3" runat="server" Text="Phone Number:"></asp:Label>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                             <br />
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter valid phone number!" ValidationExpression="^(?:\+?27[-.●]?)?\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$"></asp:RegularExpressionValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             <asp:Label ID="Label4" runat="server" Text="Email Address:"></asp:Label>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                             <br />
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter a valid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             Latitude:</td>
                         <td>
                             <asp:TextBox ID="txtLatitude" runat="server"></asp:TextBox>
                             <br />
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLatitude" ErrorMessage="Co-ordinates only!" ValidationExpression="((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)"></asp:RegularExpressionValidator>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLatitude" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             Longitude:</td>
                         <td>
                             <asp:TextBox ID="txtLongitude" runat="server"></asp:TextBox>
                             <br />
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtLongitude" ErrorMessage="Co-ordinates only!" ValidationExpression="((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)"></asp:RegularExpressionValidator>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLongitude" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style4">&nbsp;</td>
                         <td>
                         &nbsp;
                             <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
                             </td>
                     </tr>
                     <tr>
                         <td class="auto-style4">&nbsp;</td>
                         <td>
                             <asp:Button ID="btnCoordinate" OnClientClick="getLocation();return false;" runat="server" Text="Refresh Coordinates" OnClick="btnCoordinate_Click" />
                             </td>
                     </tr>
                     <tr>
                         <td class="auto-style4">
                             &nbsp;</td>
                         <td class=>
                             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
                         </td>
                         </tr>
                     <tr>
                         <td class="auto-style4">&nbsp;</td>
                         <td>
                             <asp:Button ID="Button2" runat="server" class="dangerbutton" OnClick="Button2_Click" Text="Delete My Account" OnClientClick="return confirmdelete()"/>
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

        function confirmdelete() {
            if (confirm('Are you sure?')) {
                return true;
            } else {
                return false;
            }
        }

           function showPosition(position) {
               var pos = "Latitude: " + position.coords.latitude + "Longitude: " + position.coords.longitude;
               document.getElementById('ContentPlaceHolder1_txtLatitude').value = position.coords.latitude;
               document.getElementById('ContentPlaceHolder1_txtLongitude').value = position.coords.longitude;
           }

  </script>
</asp:Content>
