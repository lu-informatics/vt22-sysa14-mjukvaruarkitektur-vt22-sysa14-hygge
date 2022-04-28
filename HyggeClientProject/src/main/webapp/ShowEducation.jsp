<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="hygge.ejb.ics.Education"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=ISO-
8859-1">
<title>Hygge - Show Education</title>
</head>
<body>
	<%
	Education e = (Education) request.getAttribute("education");
	String origin = (String) request.getAttribute("origin");
	System.out.println(origin);
	%>
	<h2>Education:</h2>
	<form action="/HyggeClientProject/EducationServlet" method="post">
		<p>
			<input type="text" name="txtEducationName"
				value="<%=e.getEducationName()%>">
		</p>
		<p>
			<input type="text" name="txtLocale" value="<%=e.getLocale()%>">
		</p>
		<input type="submit" name="submit" value="Update"> <input
			name="operation" value="updateeducation" type="hidden">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="delete">
		<input type="submit" name="submit" value="Delete"><input
			name="operation" value="deleteeducation" type="hidden">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="service">
		<input type="submit" name="submit" value="Back"> <input
			name="navigate" value=<%=(origin!=null?"fetch":"search")%> type="hidden">
		<input name="entityType" value="Education" type="hidden">
	</form>
</body>
</html>