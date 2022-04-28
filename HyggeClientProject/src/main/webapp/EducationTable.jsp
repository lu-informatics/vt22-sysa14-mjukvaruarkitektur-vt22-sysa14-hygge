<%@page import="java.io.PrintWriter"%>
<%@page import="hygge.ejb.ics.Education"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hygge - Education Index</title>
</head>
<body>
	<%
	ArrayList<Education> educations = (ArrayList<Education>) request.getAttribute("Educations");
	%>

	<div id="dynamictable">
		<table>
			<tr>
				<td>&nbsp;</td>
				<td><b>Name</b></td>
				<td><b>Locale</b></td>
			</tr>
			<%
			PrintWriter writer = response.getWriter();
			for (Education e : educations) {
				writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
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
	</div>
</body>
</html>