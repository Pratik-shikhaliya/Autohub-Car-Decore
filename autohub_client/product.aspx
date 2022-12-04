<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<link rel="stylesheet" type="text/css" href="style.css">
    <section class="shop">

        

    <div class="box">
       <div class="box1"><a href="product.aspx">All</a></div>
        
        <%
            SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
            SqlCommand cmd1 = new SqlCommand("select * from tbl_category", con);
            con.Open();
            SqlDataReader dr1 = cmd1.ExecuteReader();
            while (dr1.Read()){  
        %>
        <tr>
            <td><div class="box1"><a href="product.aspx?cat_id=<%Response.Write( dr1["cat_id"]);%>"><%Response.Write(dr1["cat_name"]); %></a><hr /></div></td>
        </tr> 
        <% } dr1.Close();%>   
    </div>
     <%
         if (Request.QueryString["cat_id"] != null)
         {             
         SqlCommand cmd = new SqlCommand("select * from tbl_product where pro_cat_id='" + Request.QueryString["cat_id"] + "'", con);
         SqlDataReader dr = cmd.ExecuteReader();   
        %>



 <table align="center" style="width:90%; margin-left: 75px;margin-top: 80px; padding-top: 40px">
       
        
        
            <%int i = 0; %>
            <%while (dr.Read()){  
                  if(i%3==0){                
                   %>
       <tr>
           <% } %>
        <td align="center" style="width: 150px; height: 200px;">            
            <div class="col-3">
                <a href="gallery.aspx?id=<%Response.Write(dr["pro_id"].ToString()); %>"><img src="uploadproduct/<%Response.Write(dr["pro_image"].ToString()); %>" style="height:250px; width:350px;"/></a>
                <div class="content_text">
                    <h2>
                        RS: <%Response.Write(dr["pro_price"].ToString()); %>
                    </h2>
                    <p>
                        <%Response.Write(dr["pro_name"].ToString()); %>
                    </p>
               </div>
            </div>
            <br />
             <center><%Response.Write(dr["pro_name"].ToString()); %></center>
            <br />
            <center><div class="links"><a href="product_detail.aspx?id=<%Response.Write(dr["pro_id"].ToString()); %>&stock=<%Response.Write(dr["pro_stock"].ToString()); %>">View Detail</a></div></center>
        </td>
           <%i++;
             if(i%3==0){ %>
       </tr> <%}
              } dr.Close();
                 
                 con.Close();%>
       </table><%} else{
                     SqlCommand cmd = new SqlCommand("select * from tbl_product", con);
                     SqlDataReader dr = cmd.ExecuteReader();   
             %>





     <table align="center" style="width:90%; margin-left: 75px;margin-top: 80px;padding-top: 40px">
        
        
            <%int i = 0; %>
            <%while (dr.Read()){  
                  if(i%3==0){                
                   %>
       <tr>
           <% } %>
        <td align="center" style="width: 150px; height: 200px;">            
            <div class="col-3">
                <a href="gallery.aspx?id=<%Response.Write(dr["pro_id"].ToString()); %>"><img src="uploadproduct/<%Response.Write(dr["pro_image"].ToString()); %>" style="height:250px; width:350px;"/></a>
                <div class="content_text">
                    <h2>
                        RS: <%Response.Write(dr["pro_price"].ToString()); %>
                    </h2>
                    <p>
                        <%Response.Write(dr["pro_name"].ToString()); %>
                    </p>
               </div>
            </div>
            <br />
             <center><%Response.Write(dr["pro_name"].ToString()); %></center>
            <br />
            <center><div class="links"><a href="product_detail.aspx?id=<%Response.Write(dr["pro_id"].ToString()); %>&stock=<%Response.Write(dr["pro_stock"].ToString()); %>">View Detail</a></div></center>
        </td>
           <%i++;
             if(i%3==0){ %>
       </tr> <%}
              } dr.Close();
                 
                 con.Close();%>
       </table>
            
         <% } %>
           
       </section>
</asp:Content>

