<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Kahno_Main.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body{
        background: url('Assets/15.jpg') no-repeat center center fixed; 
    }
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

        <div class="floatingdiv3">

                      <h3><asp:Label ID="Label1" runat="server" Text="Welcome"></asp:Label></h3> 
                           <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Start Your Order" Height="79px" Width="236px" Style="display: block; margin: auto;"/>
                       <br />
                           
                           <br />

        </div>
    <div class="floatingdiv3">

                           <div id="ratingdiv" runat="server" class="ratingdiv">
                               <h3>Please rate your last order on:<br />
                               <asp:Label ID="Label2" runat="server"></asp:Label></h3>
                               <br />
                               <input type="range" id="fromPrice" value="5" min="0" max="10" 
                                    oninput="document.getElementById('ContentPlaceHolder1_TextBox1').value = this.value" class="slider" />
                                <label id="fPrice"></label>
                               <asp:TextBox ID="TextBox1" runat="server" CssClass="invisiblebox" BorderStyle="None" style="text-align: center" Height="16px">5</asp:TextBox>
                               <p>Out of 10</p>

                               <script>
                                   function ti() {
                                       var fP = document.getElementById('fPrice').innerHTML;
                                       document.getElementById('TextBox1').value = fp;
                                   }
                                </script>
                               <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="Submit" CausesValidation="False" />
&nbsp;
                           </div>
        <h3><asp:Label ID="Label3" runat="server"></asp:Label></h3>

    </div>
    <div class="floatingdiv3">

                           <h3>My Order History<asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" GridLines="None" Width="100%" Style="display: block; margin:auto;" CaptionAlign="Left">
                               <Columns>
                                   <asp:BoundField DataField="itemName" HeaderText="Item" SortExpression="itemName" />
                                   <asp:BoundField DataField="RestaurantName" HeaderText="Restaurant" SortExpression="RestaurantName" />
                                   <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                   <asp:BoundField DataField="PricePaidPerItem" HeaderText="Price Per Item" SortExpression="PricePaidPerItem" />
                               </Columns>
                               <RowStyle BorderStyle="None" />
                           </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT MENUITEM.itemName, RESTAURANT.RestaurantName, ORDERDETAIL.Quantity, ORDERDETAIL.PricePaidPerItem FROM [ORDER] INNER JOIN ORDERDETAIL ON [ORDER].OrderNumber = ORDERDETAIL.OrderNumber INNER JOIN MENUITEM ON ORDERDETAIL.ItemNumber = MENUITEM.ItemID INNER JOIN RESTAURANT ON [ORDER].restaurantID = RESTAURANT.RestaurantID AND MENUITEM.restaurantID = RESTAURANT.RestaurantID WHERE ([ORDER].userID = @UID)">
                                   <SelectParameters>
                                       <asp:SessionParameter DefaultValue="0" Name="UID" SessionField="UserID" />
                                   </SelectParameters>
                               </asp:SqlDataSource>
                           </h3>

    </div>

         </asp:Content>
