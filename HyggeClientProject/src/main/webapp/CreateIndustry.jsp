<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="hygge.ejb.ics.Industry"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=ISO-
8859-1">
<title>Create Industry</title>
</head>
<body>
	<h2>Create New Industry:</h2>
	<form action="/HyggeClientProject/IndustryServlet" method="post">
		<p>
			<input type="text" name="txtIndustryName">
		</p>
		<p>
			<input type="text" name="txtField">
		</p>
		<input type="submit" name="submit" value="Create"> <input
			name="operation" value="createindustry" type="hidden">
	</form>

	<form action="/HyggeClientProject/MainServlet" method="post">
		<input type="submit" name="submit" value="Back"> <input
			name="operation" value="home" type="hidden">
	</form>
</body>
</html>