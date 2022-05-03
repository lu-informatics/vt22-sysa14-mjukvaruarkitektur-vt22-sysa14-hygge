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
	<form action="/HyggeClientProject/MergedServlet" method="get">
		<input type="submit" name="submit" value="Home"><input
			type="hidden" name="navigate" value="home">
	</form>

	<form action="/HyggeClientProject/MergedServlet" method="get">
		<input type="submit" name="submit" value="About"><input
			type="hidden" name="navigate" value="about">
	</form>

	<form action="/HyggeClientProject/MergedServlet" method="get">
		<input type="submit" name="submit" value="Educations"><input
			type="hidden" name="navigate" value="fetch"><input
			type="hidden" name="entityType" value="Education">
	</form>

	<form action="/HyggeClientProject/MergedServlet" method="get">
		<input type="submit" name="submit" value="Industries"><input
			type="hidden" name="navigate" value="fetch"><input
			type="hidden" name="entityType" value="Industry">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="get">
		<input type="submit" name="submit" value="Search"><input
			type="hidden" name="navigate" value="search"><input
			type="hidden" name="entityType" value="Education">
			
	</form>
	<table>
		<%
		for (Education e : educations) {
		%>
		<form action="/HyggeClientProject/MergedServlet" method="get">
			<tr>
				<td><input type="submit" name="submit" value="Manage">
					<input name="navigate" value="fetch" type="hidden"> <input
					name="entityType" value="Education" type="hidden"> <input
					name="origin" value="table" type="hidden"></td>
				<td><input type="text" name="txtID"
					value=<%=e.getEducationName()%> readonly></td>
				<td><input type="text" name="txtLocale"
					value=<%=e.getLocale()%> readonly></td>
			</tr>
		</form>
		<%
		}
		%>
	</table>
	<br>
	<br>
	<h3>Create New Education</h3>
	<form action="/HyggeClientProject/MergedServlet" method="post">
		<table>
			<tr>
				<td>Name:<input type="text" name="txtID"></td>
			</tr>
			<tr>
				<td>Locale:<input type="text" name="txtLocale"></td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="Create"><input
					name="navigate" value="create" type="hidden"> <input
					name="entityType" value="Education" type="hidden"></td>
			</tr>
		</table>
	</form>
</body>
</html>