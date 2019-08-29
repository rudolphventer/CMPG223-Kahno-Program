<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Kahno_Main.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
      <div class="leftcolumn">

         <div class="card">
            <h2>WELCOME TO KHANO</h2>
               <table style="width:100%;">
                   <tr>
                       <td>
                           <asp:Label ID="Label1" runat="server" Text="Welcome"></asp:Label>
                       </td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                   </tr>
                   <tr>
                       <td>
                           <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Start Your Order" />
                       </td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                   </tr>
                   <tr>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                   </tr>
             </table>
         </div>

      </div>
   </div>
</asp:Content>
