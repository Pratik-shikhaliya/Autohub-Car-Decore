﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="view_user.aspx.cs" Inherits="view_user" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section class="all_section">
     <h1 style="text-align:center;">View User</h1>
    <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" BackColor="#CCCCCC" DataKeyNames="user_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="user_id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
            <asp:BoundField DataField="user_name" HeaderText="Name" SortExpression="user_name" />
            <asp:BoundField DataField="user_email" HeaderText="E-mail" SortExpression="user_email" />
            <asp:BoundField DataField="user_phone" HeaderText="Phone no." SortExpression="user_phone" />
            <asp:BoundField DataField="user_address" HeaderText="Address" SortExpression="user_address" />
            
        </Columns>
    </asp:GridView></center>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:autohubConnectionString4 %>" SelectCommand="SELECT * FROM [tbl_user]" DeleteCommand="delete from tbl_user where user_id=@user_id;">
        <DeleteParameters>
            <asp:Parameter Name="user_id" />
        </DeleteParameters>
     </asp:SqlDataSource>
    </section>
</asp:Content>

