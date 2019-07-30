<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Kahno_Main.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="MainDataSource">
                <Columns>
                    <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                    <asp:BoundField DataField="customerName" HeaderText="customerName" SortExpression="customerName" />
                    <asp:BoundField DataField="phoneNum" HeaderText="phoneNum" SortExpression="phoneNum" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="passwordHash" HeaderText="passwordHash" SortExpression="passwordHash" />
                    <asp:BoundField DataField="Coordinates" HeaderText="Coordinates" SortExpression="Coordinates" />
                    <asp:CheckBoxField DataField="IsRestaurantOwner" HeaderText="IsRestaurantOwner" SortExpression="IsRestaurantOwner" />
                    <asp:BoundField DataField="RestaurantNumber" HeaderText="RestaurantNumber" SortExpression="RestaurantNumber" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="MainDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [USER]"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
        </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Email<br />
        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        <br />
        Password<br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
        <br />
    </form>
</body>
</html>
