<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		body{
			background: url(img/sample15.jpg);	
			background-size: 100% 100%;
		}
		.container{
			padding-top: 120px;
            padding-bottom: 50px;
		}
		.card{
			padding: 40px;
			height: inherit;
			width: 400px;
			background: rgba(50, 50, 50, 0.2);
			box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
			backdrop-filter: blur(20.5px);
			border-radius: 10px;
			border: 1px solid rgba(255, 255, 255, 0.8);
		}
		h1{
			color: black;
            font-size: 25px;
		}
		.card .txt
		{
			position: relative;
			border-bottom: 2px solid #adadad;
			margin: 30px 0;
		}
		.txt input
		{
			width: 100%;
			padding: 0 5px;
			height: 40px;
			font-size: 16px;
			color: #000;
			border: none;
			background: none;
			outline: none;
		}
        .txt input::placeholder{
            color: black;
        }
		.txt textarea{
			width: 100%;
			padding: 0 5px;
			height: 50px;
			letter-spacing: 0px;
			font-size: 16px;
			color: #000;
			border: none;
			background: none;
			outline: none;
		}
        .txt textarea::placeholder{
            color: black;
        }
		.btn
		{
			display: flex;
			justify-content: space-around;
		}
		.btn input
		{
			width: 150px;
			height: 40px;
			border: 0.5px solid #fff;
			background: #222;
			border-radius: 25px;
			font-size: 15px;
			font-weight: 700;
			color: #fff;
			cursor: pointer;
			transition: .5s ease;
		}
		.btn input:hover
		{
			background: white;
            color: #222;
		}

	</style>
</head>
<body>
    <section class="feedback">
	<div class="container">
		<center>
		<div class="card">
			<h1>Feedback Form</h1>
			<div class="txt">
				<asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Your Name" height="30px" AutoCompleteType="Disabled"></asp:TextBox>				
			</div>
			<div class="txt">
				<asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Your Email" height="30px" AutoCompleteType="Disabled"></asp:TextBox>
			</div>
			<div class="txt">
				<asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Your Subject" height="30px" AutoCompleteType="Disabled"></asp:TextBox>
			</div>
			<div class="txt">
				<asp:TextBox ID="TextBox4" runat="server" placeholder="Enter Your Comment" TextMode="MultiLine" height="50px" AutoCompleteType="Disabled"></asp:TextBox>
			</div>
			<div class="btn">
				<asp:Button ID="Button1" runat="server" Text="Feedback" OnClick="btnfeedback_Click"/>
                <asp:Button ID="Button2" runat="server" Text="Clear" OnClick="btnclear_Click"/>
			</div>
		</div>
		</center>
	</div>
        </section>
</body>
</html>
</asp:Content>

