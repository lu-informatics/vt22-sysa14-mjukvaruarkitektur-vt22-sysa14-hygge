<%@ page import="hygge.ejb.ics.Industry"%>
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
	Industry i = (Industry) request.getAttribute("entity");
	String origin = request.getAttribute("origin") != null ? (String) request.getAttribute("origin")
			: (String) request.getParameter("origin");
	System.out.println(origin);
	%>
	<h2>Industry:</h2>
	<form action="/HyggeClientProject/MergedServlet" method="put">
		<p>
			<b>Name</b>: <input type="text" name="txtID"
				value="<%=i.getIndustryName()%>">
		</p>
		<p>
			<b>Field:</b> <input type="text" name="txtField"
				value="<%=i.getField()%>">
		</p>
		<input type="submit" name="submit" value="Update"> <input
			name="navigate" value="update" type="hidden"><input
			name="entityType" value="Industry" type="hidden"><input
			name="origin" value=<%=origin%> type="hidden">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="delete">
		<input type="submit" name="submit" value="Delete"> <input
			name="navigate" value="delete" type="hidden"><input
			name="entityType" value="Industry" type="hidden"><input
			name="origin" value=<%=origin%> type="hidden">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="service">
		<input type="submit" name="submit" value="Back"> <input
			name="navigate" value=<%=(origin != null ? "fetch" : "search")%>
			type="hidden"> <input name="entityType" value="Industry"
			type="hidden">
	</form>
</body>
</html>