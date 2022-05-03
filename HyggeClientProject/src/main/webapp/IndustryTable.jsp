<%@page import="hygge.ejb.ics.Industry"%>
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
	<main>
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
	<table>
		<%
		for (Industry i : industries) {
		%>
		<form action="/HyggeClientProject/MergedServlet" method="get">
		<tr>
			<td><input type="submit" name="submit" value="Manage"> <input
				name="navigate" value="fetch" type="hidden"> <input
				name="entityType" value="Industry" type="hidden"> <input
				name="origin" value="table" type="hidden"></td>
			<td><input type="text" name="txtID"
				value=<%=i.getIndustryName()%> readonly></td>
			<td><input type="text" name="txtField" value=<%=i.getField()%>
				readonly></td>
		</tr>
		</form>
		<%
		}
		%>
	</table>
	<br>
	<br>
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
	</main>
</body>
</html>