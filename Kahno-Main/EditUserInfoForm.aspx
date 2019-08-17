<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditUserInfoForm.aspx.cs" Inherits="Kahno_Main.EditUserInfoForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
      <div class="leftcolumn">

         <div class="card">
             <h5>Edit user info.</h5>
             <div class="fakeimg" style="height:200px;">&nbsp;
                 <asp:Label ID="lblFname" runat="server" Text="First Name:"></asp:Label>
                 <asp:Label ID="lblLname" runat="server" style="z-index: 1; left: 28px; top: 158px; position: absolute" Text="Last Name:"></asp:Label>
                 <asp:Label ID="lblPhoneNumber" runat="server" style="z-index: 1; left: 16px; top: 202px; position: absolute" Text="Phone Number:"></asp:Label>
                 <asp:Label ID="lblEmail" runat="server" style="z-index: 1; left: 27px; top: 252px; position: absolute" Text="Email:"></asp:Label>
                 <asp:TextBox ID="txtBoxFname" runat="server" ReadOnly="True"></asp:TextBox>
                 <asp:TextBox ID="txtBoxLname" runat="server" ReadOnly="True" style="z-index: 1; left: 135px; top: 168px; position: absolute"></asp:TextBox>
                 <asp:TextBox ID="txtBoxPhoneNum" runat="server" ReadOnly="True" style="z-index: 1; left: 139px; top: 205px; position: absolute"></asp:TextBox>
                 <asp:TextBox ID="txtBoxEmail" runat="server" ReadOnly="True" style="z-index: 1; left: 87px; top: 246px; position: absolute"></asp:TextBox>
                 <asp:Button ID="btnUpdateInfo" runat="server" OnClick="btnUpdateInfo_Click" style="z-index: 1; left: 472px; top: 212px; position: absolute" Text="Update User Information" />
                 <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" style="z-index: 1; left: 733px; top: 158px; position: absolute" Text="Update" />
                </div>
         </div>
      </div>
   </div>
</asp:Content>
