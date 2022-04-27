<%@page import="java.io.PrintWriter"%>
<%@page import="hygge.ejb.ics.Education"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	ArrayList<Education> educations = (ArrayList<Education>) request.getAttribute("educations");
	%>

	<div id="mydata">
		<b>Current data in the system ...</b>
		<table id="myTableData" border="1">
			<tr>
				<td>&nbsp;</td>
				<td><b>Name</b></td>
				<td><b>Locale</b></td>
			</tr>
		</table>
		&nbsp;

	</div>

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
				writer.println("</form>");
			}
			%>

		</table>
	</div>


	<div id="myDynamicTable">
		<input type="button" id="create" value="Click here"
			onclick="Javascript:addTable()"> to create a Table and add
		some data using JavaScript
	</div>
</body>
</html>


<form action="/HyggeClientProject/EducationServlet" method="post">
	<input type="submit" name="submit" value="Back"> <input
		name="operation" value="searcheducation" type="hidden">
</form>