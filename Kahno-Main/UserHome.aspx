<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Kahno_Main.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            z-index: 1;
            left: 437px;
            top: 67px;
            position: absolute;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
      <div class="leftcolumn">

         <div class="card">
            <h2>WELCOME TO KHANO</h2>
               <h3>Log in to view your account or find a restaurant</h3>
               <asp:Button ID="btnOrder" runat="server" Text="START YOUR ORDER" OnClick="btnOrder_Click" CssClass="auto-style1" />
         </div>

      </div>
   </div>
</asp:Content>
