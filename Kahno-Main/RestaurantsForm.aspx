<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RestaurantsForm.aspx.cs" Inherits="Kahno_Main.RestaurantsForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('SpurLogo.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 296px;
            top: 333px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
        }
        .auto-style2 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('kfc.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 17px;
            top: 330px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
        }
        .auto-style3 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('bk.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 563px;
            top: 341px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
        }
        .auto-style4 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('macdonalds.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 823px;
            top: 347px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
            right: 512px;
        }
        .auto-style5 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('nandos.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 1085px;
            top: 352px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="header">     
   <h1>Restaurants</h1>       
</div>

    <asp:GridView ID="RESTAURANT" runat="server" AutoGenerateColumns="False" Width="1058px" DataSourceID="KahnoDBSource">
            <Columns>
                <asp:BoundField DataField="RestaurantName" HeaderText ="RestaurantName" SortExpression="RestaurantName" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton class="addbutton" ID="lnkSelect" Text="Select Restaurant" runat="server" CommandArgument='<%# Eval("RestaurantName") %>' OnClick="lnkSelect_Click"/>
                    </ItemTemplate>
                        
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    <asp:SqlDataSource ID="KahnoDBSource" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [RestaurantName] FROM [RESTAURANT]"></asp:SqlDataSource>

<div class="card">             
   <p>Please select a restaurant.</p>
   
   <div class="fakeimg" style="height:200px;">&nbsp;
      <asp:Button CssClass = "auto-style2" ID ="Button2" runat="server" Text="" height="199px" OnClick="Button2_Click" width="203px" />
      <asp:Button CssClass = "auto-style3" ID="Button3" runat="server" Text="" height="199px" width="203px" OnClick="Button3_Click" />
      <asp:Button CssClass = "auto-style4" ID="Button4" runat="server" Text="" height="199px" width="203px" OnClick="Button4_Click" />
      <asp:Button CssClass = "auto-style5" ID="Button5" runat="server" Text="" height="199px" width="203px" OnClick="Button5_Click" />
      <asp:Button CssClass ="auto-style1" ID="Button1" runat="server" Text="" OnClick="Button1_Click" />
   </div>
</div>

</asp:Content>
