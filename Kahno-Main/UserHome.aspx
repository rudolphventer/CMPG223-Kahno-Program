<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Kahno_Main.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 57px;
            column-gap: 10px;
        }
        .auto-style3 {
            width: 507px;
        }
        .auto-style4 {
            height: 57px;
            width: 507px;
            margin: 0px;
        }
        .auto-style5 {
            width: 473px;
        }
        .auto-style6 {
            
        }
        body{
        background: url('Assets/15.jpg') no-repeat center center fixed; 
    }
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="floatingdiv" style="width: 80%; left: 10%">
               <table style="width:100%; text-align:center;">
                   <tr>
                       <td class="LeftTable">
                           <h3>
                       <asp:Label ID="Label1" runat="server" Text="Welcome" CssClass="h3"></asp:Label>
                           </h3></td>
                       <td class="CenterTable">
                           &nbsp;
                       </td>
                       <td class="RightTable">
                           <h3>My Order History</h3>
                           </td>
                   </tr>
                   <tr>
                       <td class="auto-style4" style="vertical-align:top;" >
                           <br />
                           <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Start Your Order" Height="79px" Width="236px" Style="display: block; margin: auto;"/>
                       </td>
                       <td class="CenterTable" style="vertical-align: top; align-items:center">
                           
                           <div id="ratingdiv" runat="server" class="ratingdiv">
                               Please rate your last order on:<br />
                               <asp:Label ID="Label2" runat="server"></asp:Label>
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
&nbsp;</div>
                           <div class="ratingdiv">
                               <h3>You have rated your latest meal</h3>
                           </div>

                       </td>
                       <td class="auto-style2">
                           <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" GridLines="None" Width="500px" Style="display: block; margin:auto;" CaptionAlign="Left">
                               <Columns>
                                   <asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate" />
                                   <asp:BoundField DataField="Restaurant" HeaderText="Restaurant" SortExpression="Restaurant" />
                                   <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                                   <asp:BoundField DataField="Price Paid" HeaderText="Price Paid" SortExpression="Price Paid" />
                                   <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                               </Columns>
                               <RowStyle BorderStyle="None" />
                           </asp:GridView>
                           <br />
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style3">&nbsp;</td>
                       <td class="auto-style5">
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT [ORDER].OrderDate, RESTAURANT.RestaurantName AS Restaurant, MENUITEM.itemName AS Item, ORDERDETAIL.PricePaidPerItem AS [Price Paid], ORDERDETAIL.Quantity FROM [ORDER] INNER JOIN ORDERDETAIL ON [ORDER].OrderDetailID = ORDERDETAIL.OrderDetailID INNER JOIN MENUITEM ON ORDERDETAIL.ItemNumber = MENUITEM.ItemID INNER JOIN RESTAURANT ON [ORDER].restaurantID = RESTAURANT.RestaurantID AND MENUITEM.restaurantID = RESTAURANT.RestaurantID WHERE ([ORDER].userID = @userID)">
                               <SelectParameters>
                                   <asp:SessionParameter Name="userID" SessionField="UserID" Type="Int32" />
                               </SelectParameters>
                           </asp:SqlDataSource>
                           </td>
                       <td>
                           &nbsp;</td>
                   </tr>
             </table>
        </div>

         </asp:Content>
