<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Kahno_Main.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

      </div>
   </div>
</asp:Content>
