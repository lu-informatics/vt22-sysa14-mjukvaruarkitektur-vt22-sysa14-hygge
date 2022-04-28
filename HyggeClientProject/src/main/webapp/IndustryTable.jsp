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

	<div id="dynamictable">
		<table>
			<tr>
				<td>&nbsp;</td>
				<td><b>Name</b></td>
				<td><b>Field</b></td>
			</tr>
			<%
			PrintWriter writer = response.getWriter();
			for (Industry i : industries) {
				writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
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
	</div>
</body>
</html>