<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="WebApplication1.Confirmation" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="StyleSheet1.css"/>
</head>
<body>
    <div class="topnav">
  <a class="active" href="#home">Home</a>
  <a href="#news">News</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
</div>
    <form id="form1" runat="server">
        <div>
            
            <div class="header">     
                <h1>Confirmation</h1>       
            </div>

            </div>

            <div class="card">
                <p>
                    Please confirm your order for: 
                    </p>
            </div>
        </div>
        <asp:RadioButton ID="RadioButton1" runat="server" />
        <asp:RadioButton ID="RadioButton2" runat="server" />
    </form>
</body>
</html>
