<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ConfirmationForm.aspx.cs" Inherits="Kahno_Main.ConfirmationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header">     
       <h1>Confirmation</h1>       
    </div>

   <div class="card">
      <p>Please confirm your order for:</p>
       <p>
           <asp:ListBox ID="ListBox1" runat="server" Height="250px" Width="500px"></asp:ListBox>
       </p>
       <p><strong>Contanct details:</strong></p>
       <p>Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="lblName" runat="server" Text="..."></asp:Label>
       </p>
       <p>Identification:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="lblId" runat="server" Text="..."></asp:Label>
       </p>
       <p>PhoneNo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="lblPhone" runat="server" Text="..."></asp:Label>
       </p>
       <p>Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="lblEmail" runat="server" Text="..."></asp:Label>
       </p>
       <p>Delivery address:&nbsp;&nbsp;&nbsp;
           <asp:Label ID="lblAddress" runat="server" Text="..."></asp:Label>
       </p>
       <p>
           <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Return" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirm" />
       </p>
       <p>&nbsp;</p>
   </div>

</asp:Content>
