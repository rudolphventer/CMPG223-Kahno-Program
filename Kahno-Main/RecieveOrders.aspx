<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RecieveOrders.aspx.cs" Inherits="Kahno_Main.RecieveOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="floatingdiv" style="width:80%; left:10%; align-content:center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone Number" HeaderText="Phone Number" SortExpression="Phone Number" />
                <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude" />
                <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />
                <asp:BoundField DataField="Date and Time" HeaderText="Date and Time" SortExpression="Date and Time" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Order Number" HeaderText="Order Number" SortExpression="Order Number" />
                <asp:BoundField DataField="Item Number" HeaderText="Item Number" SortExpression="Item Number" />
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT [USER].firstname AS Firstname, [USER].lastname AS Lastname, [USER].email AS Email, [USER].phone AS [Phone Number], COORDINATE.longitude AS Longitude, COORDINATE.latitude AS Latitude, [ORDER].OrderDate AS [Date and Time], ORDERDETAIL.Quantity, ORDERDETAIL.OrderNumber AS [Order Number], ORDERDETAIL.ItemNumber AS [Item Number], MENUITEM.itemName AS Item FROM [USER] LEFT OUTER JOIN [ORDER] ON [USER].UserID = [ORDER].userID INNER JOIN ORDERDETAIL ON [ORDER].OrderNumber = ORDERDETAIL.OrderNumber INNER JOIN COORDINATE ON [USER].CoordinateID = COORDINATE.CoordinateID INNER JOIN MENUITEM ON ORDERDETAIL.ItemNumber = MENUITEM.ItemID WHERE ([ORDER].restaurantID = @RID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="RID" SessionField="RID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
