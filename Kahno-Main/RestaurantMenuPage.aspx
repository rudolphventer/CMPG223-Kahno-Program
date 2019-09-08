<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RestaurantMenuPage.aspx.cs" Inherits="Kahno_Main.RestaurantMenuPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/9.jpg');
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="header">     
        
     </div>
    <div class="floatingdiv" style="width: 80%; left:10%;">
        <h1 ID="Heading" runat="server">Burger King</h1>   
        
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" GridLines="None" Width="95%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" Visible="False" />
            <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" DataFormatString="{0:C}" />
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

            <asp:TemplateField>
                </asp:TemplateField>

            <asp:TemplateField>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Order" />
        <br />
        &nbsp;&nbsp;
        <br />
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ItemID], [Description], [price], [itemName] FROM [MENUITEM] WHERE ([restaurantID] = @restaurantID)">
        <SelectParameters>
            <asp:SessionParameter Name="restaurantID" SessionField="restaurantID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    &nbsp;
    <asp:ListBox ID="ListBox1" runat="server" Height="167px" Width="636px"></asp:ListBox>
    <br />

</asp:Content>
