<%@page import="hygge.ejb.ics.Industry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hygge - Show Industry</title>
</head>
<body>
	<%
	Industry i = (Industry) request.getAttribute("industry");
	String origin = (String) request.getParameter("origin");
	System.out.println(origin);
	%>
	<h2>Industry:</h2>
	<form action="/HyggeClientProject/MergedServlet" method="post">
		<p>
			<input type="text" name="txtIndustryName"
				value="<%=i.getIndustryName()%>">
		</p>
		<p>
			<input type="text" name="txtField" value="<%=i.getField()%>">
		</p>
		<input type="submit" name="submit" value="Update">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="delete">
		<input type="submit" name="submit" value="Delete">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="service">
		<input type="submit" name="submit" value="Back"> <input
			name="navigate" value=<%=(origin != null ? "fetch" : "search")%>
			type="hidden"> <input name="entityType" value="Industry"
			type="hidden">
	</form>
</body>
</html>