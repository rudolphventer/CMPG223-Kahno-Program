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
                         </td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style4">
                             <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                         </td>
                         <td class="auto-style1">
                             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                         </td>
                         <td class="auto-style1"></td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             <asp:Label ID="Label3" runat="server" Text="Phone Number:"></asp:Label>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                         </td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             <asp:Label ID="Label4" runat="server" Text="Email Address:"></asp:Label>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
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
                         <td class="auto-style4">&nbsp;</td>
                         <td class="auto-style1">
                             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
                         &nbsp;
                         </td>
                         <td class="auto-style1"></td>
                     </tr>
                     <tr>
                         <td class="auto-style4">&nbsp;</td>
                         <td class="auto-style1">
                             <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete My Account" />
                         </td>
                         <td class="auto-style1">&nbsp;</td>
                     </tr>
                 </table>
             </h5>
         </div>
      </div>
   </div>
</asp:Content>
