<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RestaurantMenuPage.aspx.cs" Inherits="Kahno_Main.RestaurantMenuPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="header">     
        <h1 ID="Heading" runat="server">Burger King</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ViewStateMode="Enabled" EditIndex="0" >
                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" Visible="False" />
                    <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="addToOrder" runat="server" class="addbutton" CommandArgument='<%# Eval("ItemID") %>'  OnClick="addToOrder" Text="Add to Order" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="removefromorder" runat="server" class="removebutton" CommandArgument='<%# Eval("ItemID") %>' OnClick="RemoveFromOrder" Text="Remove" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Quantity" NullDisplayText="0" />
                </Columns>
            </asp:GridView>
        
        
     </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ItemID], [Description], [price], [itemName] FROM [MENUITEM] WHERE ([restaurantID] = @restaurantID)">
        <SelectParameters>
            <asp:SessionParameter Name="restaurantID" SessionField="restaurantID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <asp:Button ID="BtnOrder" runat="server" OnClick="BtnOrder_Click1" Text="Order" CommandArgument ='' />

&nbsp;&nbsp;&nbsp;
    <asp:Label ID="testlbl" runat="server" Text="Label"></asp:Label>

</asp:Content>
