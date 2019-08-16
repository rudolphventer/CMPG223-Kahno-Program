<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="WebApplication1.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="StyleSheet1.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <div class="header">     
                <h1>About Us</h1>       
            </div>

            <div class="card">
                <p>Khano was established by a group of students who identidfied a gap in the market. We identified that it was very difficult to find good deals on good meals so we created a place where all of the deals in your area are located blah blah blah more nonsense.

                    </p>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm1.aspx" style="z-index: 1; left: 648px; top: 722px; position: absolute; bottom: 230px; margin-top: 0px">Home</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AboutUsForm.aspx" style="z-index: 1; left: 648px; top: 754px; position: absolute">About Us</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ContactUsForm.aspx" style="z-index: 1; left: 648px; top: 789px; position: absolute">Contact Us</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/FAQForm.aspx" style="z-index: 1; left: 648px; top: 823px; position: absolute">FAQ</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>