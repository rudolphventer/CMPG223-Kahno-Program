<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ConfirmationForm.aspx.cs" Inherits="Kahno_Main.ConfirmationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/6.jpg');
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="floatingdiv">
    <div class="header">     
       <h1>Confirmation</h1>       
    </div>

   <div class="card">
      <p>Please confirm your order for:</p>
       <p>
           <asp:ListBox ID="ListBox1" runat="server" Height="200px"  Width="100%" style="border: none !important;"></asp:ListBox>
       </p>
       <H3>
           <asp:Button ID="btnConfirm" runat="server" Text="Confirm Order" OnClick="btnConfirm_Click" />
           <br />
           <br />
           <asp:Button ID="btnReturn" class="dangerbutton" runat="server" Text="Cancel Order" OnClick="btnReturn_Click" />
           </H3>
       <H3>Contact details:</H3>
       <div style="text-align:left; padding-left:30px;">
         <b>Name:</b>
        <asp:Label ID="lblName" runat="server" Text="..."></asp:Label>
       <br />
       <br />
       <b>Identification:</b>
           <asp:Label ID="lblId" runat="server" Text="..."></asp:Label>
        <br />
        <br />
        <b>PhoneNo:</b>
           <asp:Label ID="lblPhone" runat="server" Text="..."></asp:Label>
       <br />
       <br />
       <b>Email: </b>
           <asp:Label ID="lblEmail" runat="server" Text="..."></asp:Label>
           <br />
           <br />
           <b>Delivery address:</b>
           <asp:Label ID="lblAddress" runat="server" Text="..."></asp:Label>
           <br />
           <br />
           </div>
   </div>
        </div>

</asp:Content>
