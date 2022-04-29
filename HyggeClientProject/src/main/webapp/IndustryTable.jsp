<%@page import="hygge.ejb.ics.Industry"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hygge - Industry Index</title>
</head>
<body>
	<%
	ArrayList<Industry> industries = (ArrayList<Industry>) request.getAttribute("Industries");
	%>

	<input type="hidden" name="navigate" value="search">
	<input type="hidden" name="entityType" value="Industry">
	</form>

	<div id="dynamictable">

		<table>
			<%
			PrintWriter writer = response.getWriter();
			writer.println("<h1>Industries</h1>");

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
			writer.println("<input type=\"hidden\" name=\"entityType\" value=\"Industry\">");
			writer.println("</form>");

			writer.println("<table><tr>");
			writer.println("<td>&emsp;&emsp;&emsp;<b>Name</b></td>");
			writer.println("<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>Field</b></td>");
			writer.println("</tr></table>");
			for (Industry i : industries) {
				writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
				writer.println("<table>");
				writer.println("<tr>");
				writer.println("<td><input type=\"submit\" name=\"submit\" value=\"Manage\"></td>");

				writer.println("<td><input type=\"text\" name=\"txtID\" value=\"" + i.getIndustryName() + "\" readonly></td>");

				writer.println("<td><input type=\"text\" name=\"txtField\" value=\"" + i.getField() + "\" readonly></td>");

				writer.println("</tr>");
				writer.println("<input name=\"navigate\" value=\"fetch\" type=\"hidden\">");
				writer.println("<input name=\"entityType\" value=\"Industry\" type=\"hidden\">");
				writer.println("<input name=\"origin\" value=\"table\" type=\"hidden\">");
				writer.println("</form>");
			}
			%>
		</table>
		<br> <br>
		<h3>Create New Industry</h3>
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
						name="entityType" value="Industry" type="hidden"></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>