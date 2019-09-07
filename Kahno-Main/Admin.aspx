<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Kahno_Main.Admin" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/1.jpg');
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="floatingdiv3">
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" GridLines="None" width="100%">
            <Columns>
                <asp:TemplateField>
            <ItemTemplate>
                <img src='data:image/jpg;base64,<%# Eval("byteImg") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("byteImg")) : string.Empty %>' alt="image" height="100" width="200"/>
            </ItemTemplate>
        </asp:TemplateField>
                <asp:BoundField DataField="RestaurantID" HeaderText="RestaurantID" InsertVisible="False" ReadOnly="True" SortExpression="RestaurantID" Visible="False" />
            </Columns>

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT [RestaurantID], [byteImg] FROM [RESTAURANT] WHERE ([RestaurantID] = @RestaurantID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="RestaurantID" SessionField="RID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    <div class="floatingdiv3">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT [ORDER].OrderDate, RESTAURANT.RestaurantName AS Restaurant, MENUITEM.itemName AS Item, ORDERDETAIL.PricePaidPerItem AS [Price Paid], ORDERDETAIL.Quantity, RESTAURANT.RestaurantID FROM [ORDER] INNER JOIN ORDERDETAIL ON [ORDER].OrderDetailID = ORDERDETAIL.OrderDetailID INNER JOIN MENUITEM ON ORDERDETAIL.ItemNumber = MENUITEM.ItemID INNER JOIN RESTAURANT ON [ORDER].restaurantID = RESTAURANT.RestaurantID AND MENUITEM.restaurantID = RESTAURANT.RestaurantID WHERE (RESTAURANT.RestaurantID = @RID)">
                               <SelectParameters>
                                   <asp:SessionParameter DefaultValue="0" Name="RID" SessionField="RID" />
                               </SelectParameters>
                           </asp:SqlDataSource>

        <br />
  <h3>Recent Orders</h3><asp:GridView ID="GridView3" runat="server" AllowPaging="True" DataSourceID="SqlDataSource3" AutoGenerateColumns="False" GridLines="None" Width="100%" Style="display: block; margin:auto;" CaptionAlign="Left" DataKeyNames="RestaurantID">
                               <Columns>
                                   <asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate" >
                                   <ItemStyle Width="25%" />
                                   </asp:BoundField>
                                   <asp:BoundField DataField="Restaurant" HeaderText="Restaurant" SortExpression="Restaurant" Visible="False" />
                                   <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                                   <asp:BoundField DataField="Price Paid" HeaderText="Price Paid" SortExpression="Price Paid" />
                                   <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                   <asp:BoundField DataField="RestaurantID" HeaderText="RestaurantID" InsertVisible="False" ReadOnly="True" SortExpression="RestaurantID" Visible="False" />
                               </Columns>
                               <RowStyle BorderStyle="None" />
                           </asp:GridView>
                           </div>
    <div class="floatingdiv3" style="align-items: center; text-align:center;">
  <h3>Reports</h3>
        <asp:GridView ID="GridView1" runat="server" style="width: 100%" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None">
            <Columns>
                <asp:BoundField DataField="Expr1" HeaderText="Average Rating" ReadOnly="True" SortExpression="Expr1" />
            </Columns>
            <EmptyDataTemplate>0</EmptyDataTemplate>
        </asp:GridView>
        <asp:GridView ID="GridView5" runat="server" style="width: 100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" GridLines="None" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Expr1" HeaderText="Orders Today" NullDisplayText="0" ReadOnly="True" SortExpression="Expr1" DataFormatString="{0:d}" />
                <asp:BoundField DataField="restaurantID" HeaderText="restaurantID" SortExpression="restaurantID" Visible="False" />
            </Columns>
            <EmptyDataTemplate>0</EmptyDataTemplate>
        </asp:GridView>
        <asp:GridView ID="GridView4" runat="server" style="width: 100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" GridLines="None" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Expr1" HeaderText="Orders in last 30 days" ReadOnly="True" SortExpression="Expr1" />
            </Columns>
            <EmptyDataTemplate>0</EmptyDataTemplate>
        </asp:GridView>
        <asp:GridView ID="GridView6" runat="server" style="width: 100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" GridLines="None" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Expr1" HeaderText="Income for last 7 days" ReadOnly="True" SortExpression="Expr1" />
            </Columns>
            <EmptyDataTemplate>0</EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT ORDERDETAIL.PricePaidPerItem AS Expr1 FROM [ORDER] INNER JOIN ORDERDETAIL ON [ORDER].OrderDetailID = ORDERDETAIL.OrderDetailID WHERE ([ORDER].restaurantID = @RID) AND ([ORDER].OrderDate &gt; DATEADD(day, - 7, GETDATE()))">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="RID" SessionField="RID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT COUNT(OrderNumber) AS Expr1 FROM [ORDER] WHERE (OrderDate &lt; DATEADD(day, 30, GETDATE())) GROUP BY restaurantID HAVING (restaurantID = @RID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="RID" SessionField="RID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT AVG(CUSTOMERFEEDBACK.UserFeedbackScore) AS Expr1 FROM CUSTOMERFEEDBACK INNER JOIN [ORDER] ON CUSTOMERFEEDBACK.OrderID = [ORDER].OrderNumber WHERE ([ORDER].restaurantID = @RestaurantID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="RestaurantID" SessionField="RID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT COUNT(OrderNumber) AS Expr1 FROM [ORDER] WHERE (OrderDate = GETDATE()) GROUP BY OrderDate, restaurantID HAVING (restaurantID = @RID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="RID" SessionField="@RID" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
</asp:Content>
