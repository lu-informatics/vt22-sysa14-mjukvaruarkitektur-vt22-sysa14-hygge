<%@ page import="hygge.ejb.ics.Education"%>
<%@ page import="hygge.ejb.ics.Industry"%>
<%@ page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hygge - Show Education</title>
</head>
<body>
	<%
	Education e = (Education) request.getAttribute("entity");
	String origin = request.getAttribute("origin") != null ? (String) request.getAttribute("origin")
			: (String) request.getParameter("origin");
	String connectedIndustryDescription = "None";
	Set<Industry> connectedIndustries = (Set<Industry>) request.getAttribute("connectedEntities");
	if (connectedIndustries != null && !connectedIndustries.isEmpty()) {
		connectedIndustryDescription = "";
		for (Industry i : connectedIndustries) {
			connectedIndustryDescription += i.getIndustryName() + "<br>";
		}
	}
	%>
	<h2>Education:</h2>
	<form action="/HyggeClientProject/MergedServlet" method="put">
		<p>
			<b>Name:</b><input type="text" name="txtID"
				value="<%=e.getEducationName()%>">
		</p>
		<p>
			<b>Locale:</b><input type="text" name="txtLocale"
				value="<%=e.getLocale()%>">
		</p>
		<input type="submit" name="submit" value="Update"> <input
			name="navigate" value="update" type="hidden"><input
			name="entityType" value="Education" type="hidden"><input
			name="origin" value=<%=origin%> type="hidden">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="delete">
		<input type="submit" name="submit" value="Delete"> <input
			name="navigate" value="delete" type="hidden"><input
			name="entityType" value="Education" type="hidden"><input
			name="origin" value=<%=origin%> type="hidden">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="service">
		<input type="submit" name="submit" value="Back"> <input
			name="navigate" value=<%=(origin != null ? "fetch" : "search")%>
			type="hidden"> <input name="entityType" value="Education"
			type="hidden">
	</form>
	<p>Connected Industries:</p>
	<p><%=connectedIndustryDescription%></p>
	<form action="/HyggeClientProject/MergedServlet"
		method="manageEntityRelationship">
		<input type="text" name="txtIndustryName"><input type="hidden"
			name="txtEducationName" value=<%=e.getEducationName()%>> <input
			type="submit" name="submit" value="Attach"><input
			name="navigate" value="manageRelationship" type="hidden"><input
			name="operation" value="attach" type="hidden"><input
			name="entityType" value="Education" type="hidden">
	</form>
</body>
</html>