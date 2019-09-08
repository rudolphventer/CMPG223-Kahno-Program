<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RestaurantMenuPage.aspx.cs" Inherits="Kahno_Main.RestaurantMenuPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/9.jpg');
    }
        .auto-style2 {
            width: 977px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="header">     
        
     </div>
    <div class="floatingdiv" style="width: 80%; left:10%;">
        <h1 ID="Heading" runat="server">Burger King</h1>  
        <table style="width: 100%; padding: 5px 5px 5px 5px">
            <tr>
                <td class="auto-style2">
         
        
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="itemName" HeaderText="Item" SortExpression="itemName" />
            <asp:TemplateField>
            <ItemTemplate>
                <img src='data:image/jpg;base64,<%# Eval("imgByte") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("imgByte")) : string.Empty %>' alt="image" height="100" width="200"/>
            </ItemTemplate>
        </asp:TemplateField>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="imgByte" HeaderText="imgByte" SortExpression="imgByte" Visible="False" />
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
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

        </Columns>
    </asp:GridView>
                </td>
                <td style="vertical-align: top; width: 20%; border: none;">
        <h3 style="text-align: center">My Order</h3>
                    
        <asp:ListBox ID="ListBox1" runat="server" Height="257px" Width="100%" style="border: none !important;" ></asp:ListBox>
                    <br />
                    <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Place Order" Height="80px" Width="225px" Enabled="False" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
         
        
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
        <p>  </p>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT ItemID, Description, price, itemName, imgByte FROM MENUITEM WHERE (restaurantID = @restaurantID)">
        <SelectParameters>
            <asp:SessionParameter Name="restaurantID" SessionField="restaurantID" Type="Int32" DefaultValue="0" />
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
    <br />

</asp:Content>
