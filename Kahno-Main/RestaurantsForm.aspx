<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RestaurantsForm.aspx.cs" Inherits="Kahno_Main.RestaurantsForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/14.jpg');
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header">     
         
</div>
  
    
    <div class="floatingdiv">
        <h2>Select a restaurant</h2>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RestaurantID" DataSourceID="RestaurantList" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
           <Columns>
               <asp:BoundField DataField="RestaurantID" HeaderText="RestaurantID" InsertVisible="False" ReadOnly="True" SortExpression="RestaurantID" Visible="False" />
               <asp:BoundField DataField="RestaurantName" SortExpression="RestaurantName" Visible="False" HeaderText="RestaurantName">
               </asp:BoundField>
               <asp:TemplateField>
            <ItemTemplate>
                <img src='data:image/jpg;base64,<%# Eval("imgbyte") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("imgbyte")) : string.Empty %>' alt="image" height="100" width="200"/>
            </ItemTemplate>
        </asp:TemplateField>
               <asp:TemplateField ShowHeader="False">
                   <ItemTemplate>
                        <asp:Button class="fancybutton" ID="lnkSelect" Text="Order Now" runat="server" CommandArgument='<%# Eval("RestaurantID") %>' OnClick="lnkSelect_Click"/>
                   </ItemTemplate>
               </asp:TemplateField>
           </Columns>
       </asp:GridView>
        </div>
       <asp:SqlDataSource ID="RestaurantList" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT RESTAURANT.RestaurantID, RESTAURANT.RestaurantName, IMGBYTE.imgbyte FROM RESTAURANT INNER JOIN IMGBYTE ON RESTAURANT.byteImg = IMGBYTE.imgbyteID"></asp:SqlDataSource>

</asp:Content>
