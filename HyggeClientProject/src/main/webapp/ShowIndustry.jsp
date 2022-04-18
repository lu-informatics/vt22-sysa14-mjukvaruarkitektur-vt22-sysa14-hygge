<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="hygge.ejb.ics.Industry"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=ISO-
8859-1">
<title>Show Industry</title>
</head>
<body>
	<%
	Industry i = (Industry) request.getAttribute("industry");
	%>
	<h2>Industry:</h2>
	<p>
		<input type="text" name="txtIndustryName"
			value="<%=i.getIndustryName()%>">
	</p>
	<p>
		<input type="text" name="txtField" value="<%=i.getField()%>">
	</p>
	<p><%=new java.util.Date()%></p>

	<form action="/HyggeClientProject/IndustryServlet" method="post">
		<input type="submit" name="submit" value="Update"> <input
			name="operation" value="updateindustry" type="hidden">
	</form>

	<form action="/HyggeClientProject/IndustryServlet" method="post">
		<input type="submit" name="submit" value="Back"> <input
			name="operation" value="searchindustry" type="hidden">
	</form>
</body>
</html>