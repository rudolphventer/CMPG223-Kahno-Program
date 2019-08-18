<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RestaurantMenuPage.aspx.cs" Inherits="Kahno_Main.RestaurantMenuPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="header">     
        <h1 ID="Heading" runat="server">Burger King</h1>   
        
     </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
            <asp:TemplateField ShowHeader="False">
                   <ItemTemplate>
                        <asp:Button class="addbutton" ID="addtoorder" Text="Add to Order" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="addToOrder"/>
                    </ItemTemplate>
               </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                   <ItemTemplate>
                        <asp:Button class="removebutton" ID="removefromorder" Text="Remove" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="RemoveFromOrder"/>
                    </ItemTemplate>
               </asp:TemplateField>

            <asp:BoundField HeaderText="Quantity" NullDisplayText="0" />

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ItemID], [Description], [price], [itemName] FROM [MENUITEM] WHERE ([restaurantID] = @restaurantID)">
        <SelectParameters>
            <asp:SessionParameter Name="restaurantID" SessionField="restaurantID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
