﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Kahno_Main.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/9.jpg');
    }   
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <p>&nbsp;</p>
<div class="floatingdiv">
                <br />
                <h3>Register</h3>
                        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                    <br />
                        <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                    <br />
                        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" EnableTheming="True" ErrorMessage="Please enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <br />
                        <asp:Label ID="Label7" runat="server" Text="Phone Number"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter a valid phone number!" ValidationExpression="^(?:\+?27[-.●]?)?\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$"></asp:RegularExpressionValidator>
                    <br />
                        <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                        
                        <br />
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                    <br />
                        <asp:Label ID="Label6" runat="server" Text="Password Repeat"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox6" ErrorMessage="Passwords must match!"></asp:CompareValidator>
                    <br />
            Latitude<br />
                        <asp:TextBox ID="TextBox7" runat="server" OnTextChanged="TextBox7_TextChanged"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox7" ErrorMessage="Coordinates only!" ValidationExpression="((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)"></asp:RegularExpressionValidator>
                    <br />
            Longitude<br />
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox8" ErrorMessage="Coordinates only!" ValidationExpression="((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)"></asp:RegularExpressionValidator>
                    <br />
                        <asp:Label ID="Label8" runat="server" Text="There was an error creating your account, an account with that email address may already exist" Visible="False"></asp:Label>
                    <br />

<asp:Button ID="Button2" OnClientClick="getLocation();return false;" runat="server" Text="Get Coordinates" OnClick="Button1_Click" Width="163px" />


                        <br />


                    <br />
                        <asp:Button ID="Register1" runat="server" Text="Register" OnClick="Register_Click" />
                        <br />
                <br />
                </div>

    <p></p>
       <script>
           var x = document.getElementById("demo");

           function getLocation() {
               if (navigator.geolocation) {
                   navigator.geolocation.getCurrentPosition(showPosition);
               } else {
                   x.innerHTML = "Geolocation is not supported by this browser.";
               }
           }

           function showPosition(position) {
               var pos = "Latitude: " + position.coords.latitude + "Longitude: " + position.coords.longitude;
               document.getElementById('ContentPlaceHolder1_TextBox7').value = position.coords.latitude;
               document.getElementById('ContentPlaceHolder1_TextBox8').value = position.coords.longitude;
           }

  </script>
</asp:Content>
