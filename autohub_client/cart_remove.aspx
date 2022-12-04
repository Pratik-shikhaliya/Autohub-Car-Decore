<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="cart_remove.aspx.cs" Inherits="cart_remove" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <%
        SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
            SqlCommand cmd= new SqlCommand("delete from tbl_cart  where c_id='"+Request.QueryString["cartid"]+"'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            Response.Redirect("cart.aspx");            
        %>
</asp:Content>

