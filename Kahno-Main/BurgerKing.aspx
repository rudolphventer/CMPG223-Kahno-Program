<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BurgerKing.aspx.cs" Inherits="WebApplication1.BurgerKing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="StyleSheet1.css"/>
</head>
<body>
  
  <form id="form1" runat="server">
     <div class="header">     
        <h1>Burger King</h1>       
     </div>

     <div class="card">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm1.aspx" style="z-index: 1; left: 648px; top: 722px; position: absolute; bottom: 230px; margin-top: 0px">Home</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AboutUsForm.aspx" style="z-index: 1; left: 648px; top: 754px; position: absolute">About Us</asp:HyperLink>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ContactUsForm.aspx" style="z-index: 1; left: 648px; top: 789px; position: absolute">Contact Us</asp:HyperLink>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/FAQForm.aspx" style="z-index: 1; left: 648px; top: 823px; position: absolute">FAQ</asp:HyperLink>
        <asp:Button ID="btnOrder" runat="server" Text="Button" OnClick="btnOrder_Click" />
     </div>

</form>
</body>
</html>