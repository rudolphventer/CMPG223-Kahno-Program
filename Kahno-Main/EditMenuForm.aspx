<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditMenuForm.aspx.cs" Inherits="Kahno_Main.EditMenuForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/3.jpg');
    }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function openAddForm() {
            document.getElementById("newmenuitempopup").style.display = "block";
            document.getElementById("coverscreen").style.display = "block";
            return false;
        }

        function closeAddForm() {
            document.getElementById("newmenuitempopup").style.display = "none";
            document.getElementById("coverscreen").style.display = "none";
        }
    </script>
    <div class="floatingdiv" style="width: 80%; left:10%; align-items:center;">
        <h1>&nbsp;<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

        </h1>
            <asp:GridView ID="EditMenuGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="MenuID" Height="176px" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="None">
                <Columns>

                    <asp:CommandField ButtonType="Button" ShowEditButton="True" CausesValidation="False" />

                    <asp:BoundField DataField="ItemID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                    
                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />

                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" >
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="itemImageUrl" HeaderText="itemImageUrl" SortExpression="itemImageUrl" Visible="False" />
                    <asp:TemplateField>
            <ItemTemplate>
                <img src='data:image/jpg;base64,<%# Eval("imgByte") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("imgByte")) : string.Empty %>' alt="image" height="100" width="200"/>
            </ItemTemplate>
        </asp:TemplateField>
                    <asp:BoundField DataField="restaurantID" HeaderText="restaurantID" SortExpression="restaurantID" Visible="False" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" CausesValidation="False" />
                
                </Columns>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:GridView>
            <br />
            <button ID="Button2" class="fancyButton" type="button" onclick="openAddForm()" causesvalidation="False">Add new item</button>
            <asp:SqlDataSource ID="MenuID" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT Description, price, itemName, restaurantID, ItemID, imgByte FROM MENUITEM WHERE (restaurantID = @RID)" DeleteCommand="DELETE FROM MENUITEM WHERE (ItemID = @ItemID);" UpdateCommand="UPDATE MENUITEM SET Description = @Description, itemImageUrl = @itemImageUrl, itemName = @itemName, price = @price WHERE (ItemID = @ItemID)">
                <DeleteParameters>
                    <asp:Parameter Name="ItemID" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="RID" SessionField="RID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="itemImageUrl" />
                    <asp:Parameter Name="itemName" />
                    <asp:Parameter Name="price" />
                    <asp:Parameter Name="ItemID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        <br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            </div>
    <div class="floatingdivhidden" id="newmenuitempopup">
            <h3>Add a new menu item</h3>
            Name:
            <br />
            <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemName" ErrorMessage="Required!"></asp:RequiredFieldValidator>
            <br />
            Price:<br />
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice" ErrorMessage="Required!"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Must be a valid price!" ValidationExpression="^[+-]?[0-9]{1,3}(?:,?[0-9]{3})*\.[0-9]{2}$"></asp:RegularExpressionValidator>
        &nbsp;<br />
            Desciption:<br />
            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
        <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="Required!"></asp:RequiredFieldValidator>
            
            <br />
            <asp:FileUpload ID="imgUpload" runat="server" accept=".png,.jpg,.jpeg,.gif"/>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="imgUpload" ErrorMessage="Image required!"></asp:RequiredFieldValidator>
        <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add new item" />
            <button ID="Buttonback" class="fancyButton" type="button" onclick="closeAddForm()" causesvalidation="False">Cancel</button>
            <br />
            <br />
        
    </div>
    <div id="coverscreen" class="coverscreen"></div>
</asp:Content>
