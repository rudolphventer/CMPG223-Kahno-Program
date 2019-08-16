<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<link rel="stylesheet" type ="text/css" href="StyleSheet1.css"/>
</head>
<body>
  <div class="topnav">
      <a class="active" href="#home">Home</a>
      <a href="#aboutus">About Us</a>
      <a href="#contactus">Contact Us</a>
      <a href="#faq">FAQ</a>
  </div>
<form id="form1" runat="server">
   <div>
      <div class="card">
    
       <div class="header">     
          <h1>Khano Prototype</h1>       
         </div>
      </div>
    </div>

   <div class="row">
      <div class="leftcolumn">

         <div class="card">
            <h2>WELCOME TO KHANO</h2>
               <h3>Log in to view your account or find a restaurant</h3>
               <asp:Button ID="btnOrder" runat="server" style="z-index: 1; left: 633px; top: 230px; position: absolute" Text="START YOUR ORDER" OnClick="btnOrder_Click" />
         </div>
         <div class="card">
             <h5>Specials.</h5>
             <div class="fakeimg" style="height:200px;">&nbsp;
                <asp:Button CssClass = "SpecialButton1" ID="Button1" runat="server" Text="" OnClick="Button1_Click" />
                <asp:Button CssClass = "SpecialButton2" ID ="Button2" runat="server" Text="" height="199px" OnClick="Button2_Click" width="203px" />
                <asp:Button CssClass = "SpecialButton3" ID="Button3" runat="server" style="z-index: 1; left: 541px; top: 330px; position: absolute" Text="" height="199px" width="203px" OnClick="Button3_Click" />
                <asp:Button CssClass = "SpecialButton4" ID="Button4" runat="server" style="z-index: 1; left: 804px; top: 330px; position: absolute; right: 142px;" Text="" height="199px" width="203px" OnClick="Button4_Click" />
                <asp:Button CssClass = "SpecialButton5" ID="Button5" runat="server" style="z-index: 1; left: 1067px; top: 330px; position: absolute" Text="" height="199px" width="203px" OnClick="Button5_Click" />
            </div>
         </div>

         <div class="card">
            <h3>&nbsp;</h3>
            <h4 style="height: 109px">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm1.aspx" style="z-index: 1; left: 13px; top: 665px; position: absolute; width: 100px">Home</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AboutUs.aspx" style="z-index: 1; left: 13px; top: 690px; position: absolute" width="100px">About Us</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ContactUsForm.aspx" style="z-index: 1; left: 13px; top: 717px; position: absolute" width="100px">Contact Us</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/FAQForm.aspx" style="z-index: 1; left: 13px; top: 739px; position: absolute" width="100px">FAQ</asp:HyperLink>
            </h4>

         </div>

      </div>
   </div>

</form>
</body>
</html>
