<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="gallery">
    
      <% 
          SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
         SqlCommand cmd = new SqlCommand("select * from tbl_product where pro_id='"+Request.QueryString["id"].ToString()+"'", con);
         con.Open();
         SqlDataReader dr = cmd.ExecuteReader();
         dr.Read();                
      %>
    
	<div class="image">	    
        <img src="uploadproduct/<%Response.Write(dr["pro_image"].ToString()); %>"/>
	</div>   
    <div class="close">
        <a href="product.aspx"><img src="img/close.png"/></a>
    </div>
</body>
</html>
