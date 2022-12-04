<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="product_detail.aspx.cs" Inherits="product_detail" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">  
    <section class="pro_det">
     <% 
         SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS;Initial Catalog=db_autohub;Integrated Security=True");        
       SqlCommand cmd = new SqlCommand("select * from tbl_product left join tbl_category on tbl_product.pro_cat_id=tbl_category.cat_id where pro_id='"+Request.QueryString["id"].ToString()+"'", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();                
        %>
    
	<div class="pic">
		<img src="uploadproduct/<%Response.Write(dr["pro_image"].ToString()); %>"/>
		<div class="content">
			<h1><%Response.Write(dr["pro_name"].ToString()); %></h1>
			<table>
				<tr>
					<td><h3>Price:</h3></td>
					<td class="input"><%Response.Write(dr["pro_price"].ToString()); %></td>
				</tr>
				<tr>
					<td><h3>Category:</h3></td>
					<td class="input"><%Response.Write(dr["cat_name"].ToString()); %></td>
				</tr>
				<tr>
					<td><h3>Product Description:</h3></td>
					<td class="input"><%Response.Write(dr["pro_description"].ToString()); %></td>
				</tr>
				<tr>
					<td><h3>Available Quantity:</h3></td>
					<td class="input"><%Response.Write(dr["pro_stock"].ToString()); %></td>
				</tr>
				<tr>
					<td><h3>Select Quantity:</h3></td>
					<td class="input"><asp:TextBox ID="TextBox1" runat="server" TextMode="Number"></asp:TextBox></td>
				</tr>
			</table>
			<div class="btn">
				<a href="product.aspx">Go Back</a>
				  <%if(Session["userdata"]==null) { %>
                     <a href="signin.aspx">Add To Cart</a>
                    
                    <% }
                      else
                      {
                          %>
                    <asp:Button ID="btnaddtocart" runat="server" Text="Add To Cart" OnClick="btnaddtocart_Click" />
                   <% } %> 
			</div>
		</div>
	</div>    
    </section>
</asp:Content>
 