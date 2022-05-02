<%@page import="hygge.ejb.ics.Education"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
aside { 
    position: absolute;
	right: 7%;
	bottom: 280px;
	display: flex;
	align-items: center;
	text-decoration: none;
	color: #fff;
	padding: 1px 20px;
	border-radius: 40px;	
 } 
.span {
color: #FFE4E1;
}

*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	front-family: 'poppins', sans-serif;
}

.header {
	width:100%;
	height:100vh;
	background-image: url(https://miro.medium.com/max/1200/1*OEnS6-DEn56szCwdOs2mrA.jpeg);
	background-position: center;
	background-size: cover;
	color: #fff;
	padding: 0 7%;
	position: relative;

}
nav{
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 30px 0 10px; 


}
nav ul li {
display: inline-block;
list-style: none;
margin: 10px 30px;

}
.logo{
	width: 160px;
	cursor: pointer;
}
nav ul li a{
	text-decoration: none;
	color: #fff;
	fron-size: 17px;
	letter-spacing: 1px;
}
nav ul li a:hover{
	color: #ff3e3b;
}
.text-box{
	margin-top: 16%;
	font-size: 22px;

}
.text-box h1{
	font-size: 85px;
	font-weight: 600px;
	line-height: 100px;
	margin-bottom: 10px;

}
.contact {
position: absolute;
	left: 7%;
	bottom: 20px;
	display: flex;
	align-items: center;
	text-decoration: none;
	color: #fff;
	padding: 1px 20px;
	border-radius: 40px;	

}

.download {
	position: absolute;
	right: 7%;
	bottom: 60px;
	display: flex;
	align-items: center;
	text-decoration: none;
	color: #fff;
	padding: 5px 5px;
	border-radius: 40px;	
}
.download img{
	width: 25px;
	margin-left: 15px;
	animation: move 2s linear infinite;

}
</style>
<meta charset="ISO-8859-1">
<title>Hygge - Education Index</title>
</head>
<body>
	<%
	ArrayList<Education> educations = (ArrayList<Education>)request.getAttribute("Educations");
	%>

	<div id="dynamictable">
		<table>
			<%
			PrintWriter writer = response.getWriter();
			writer.println("<h1>Educations hehe</h1>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"Home\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"home\">");
			writer.println("</form>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"About\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"about\">");
			writer.println("</form>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"Educations\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"fetch\">");
			writer.println("<input type=\"hidden\" name=\"entityType\" value=\"Education\">");
			writer.println("</form>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"Industries\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"fetch\">");
			writer.println("<input type=\"hidden\" name=\"entityType\" value=\"Industry\">");
			writer.println("</form><br><br>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"Search\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"search\">");
			writer.println("<input type=\"hidden\" name=\"entityType\" value=\"Education\">");
			writer.println("</form>");

			writer.println("<table><tr>");
			writer.println("<td>&emsp;&emsp;&emsp;<b>Name</b></td>");
			writer.println("<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>Locale</b></td>");
			writer.println("</tr></table>");
			for (Education e : educations) {
				writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
				writer.println("<table>");
				writer.println("<tr>");
				writer.println("<td><input type=\"submit\" name=\"submit\" value=\"Manage\"></td>");

				writer.println("<td><input type=\"text\" name=\"txtID\" value=\"" + e.getEducationName() + "\" readonly></td>");

				writer.println("<td><input type=\"text\" name=\"txtLocale\" value=\"" + e.getLocale() + "\" readonly></td>");

				writer.println("</tr>");
				writer.println("<input name=\"navigate\" value=\"fetch\" type=\"hidden\">");
				writer.println("<input name=\"entityType\" value=\"Education\" type=\"hidden\">");
				writer.println("<input name=\"origin\" value=\"table\" type=\"hidden\">");
				writer.println("</form>");
			}
			%>
		</table>
		<br> <br>
		<h3>Create New Education</h3>
		<form action="/HyggeClientProject/MergedServlet" method="post">
			<table>
				<tr>
					<td>Name:<input type="text" name="txtID"></td>
				</tr>
				<tr>
					<td>Field:<input type="text" name="txtField"></td>
				</tr>
				<tr>
					<td><input type="submit" name="submit" value="Create"><input
						name="navigate" value="create" type="hidden"> <input
						name="entityType" value="Education" type="hidden"></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>