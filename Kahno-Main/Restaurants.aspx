
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Restaurants.aspx.cs" Inherits="WebApplication1.Restaurants" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="StyleSheet1.css"/>
</head>
<body>
<form id="form1" runat="server">

<div class="header">     
   <h1>Restaurants</h1>       
</div>

<div class="card">             
   <p>Please select a restaurant.</p>
   
   <div class="fakeimg" style="height:200px;">&nbsp;
      <asp:Button CssClass = "KFCButton" ID ="Button2" runat="server" Text="" height="199px" OnClick="Button2_Click" width="203px" />
      <asp:Button CssClass = "BKButton" ID="Button3" runat="server" style="z-index: 1; left: 547px; top: 157px; position: absolute" Text="" height="199px" width="203px" OnClick="Button3_Click" />
      <asp:Button CssClass = "MDButton" ID="Button4" runat="server" style="z-index: 1; left: 825px; top: 160px; position: absolute; right: 917px;" Text="" height="199px" width="203px" OnClick="Button4_Click" />
      <asp:Button CssClass = "NandosButton" ID="Button5" runat="server" style="z-index: 1; left: 1095px; top: 157px; position: absolute" Text="" height="199px" width="203px" OnClick="Button5_Click" />
      <asp:Button CssClass ="SpurButton" ID="Button1" runat="server" Text="" OnClick="Button1_Click" />
   </div>
</div>

<div class="card">
   <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm1.aspx" style="z-index: 1; left: 648px; top: 722px; position: absolute; bottom: 230px; margin-top: 0px">Home</asp:HyperLink>
   <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AboutUsForm.aspx" style="z-index: 1; left: 648px; top: 754px; position: absolute">About Us</asp:HyperLink>
   <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ContactUsForm.aspx" style="z-index: 1; left: 648px; top: 789px; position: absolute">Contact Us</asp:HyperLink>
   <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/FAQForm.aspx" style="z-index: 1; left: 648px; top: 823px; position: absolute">FAQ</asp:HyperLink>
</div>

</form>
</body>
</html>