<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditMenuForm.aspx.cs" Inherits="Kahno_Main.EditMenuForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 752px;
    }
    .auto-style3 {
        height: 232px;
    }
    .auto-style4 {
        width: 752px;
        height: 232px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 519px;">
    <tr>
        <td class="auto-style3"></td>
        <td class="auto-style4">
            
            
            <asp:GridView ID="EditMenuGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="MenuID" Height="176px" Width="739px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>

                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="itemImageUrl" HeaderText="itemImageUrl" SortExpression="itemImageUrl" />
                    <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                    <asp:BoundField DataField="restaurantID" HeaderText="restaurantID" SortExpression="restaurantID" />
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                    
                    <asp:TemplateField ShowHeader="false">
                        <ItemTemplate>
                            <asp:Button class="addbutton" ID="deleteMenuItem" Text="Remove" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="deleteMenuItem_Click"/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="false">
                        <ItemTemplate>
                            <asp:Button class="addbutton" ID="EditMenuItem" Text="Edit" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="editMenuItem_Click"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="MenuID" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT Description, price, itemImageUrl, itemName, restaurantID, ItemID FROM MENUITEM WHERE (restaurantID = @RID)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="RID" SessionField="RID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style3"></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style2">Description:<asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style2">Price:
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style2">Name:
            <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style2">
            <asp:Button ID="Button1" runat="server" Height="40px" OnClick="Button1_Click" Text="Add new item" Width="189px" />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
