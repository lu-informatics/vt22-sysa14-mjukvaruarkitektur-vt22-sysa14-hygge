<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="hygge.ejb.ics.Education"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=ISO-
8859-1">
<title>Create Education</title>
</head>
<body>
	<h2>Create New Education:</h2>
	<form action="/HyggeClientProject/EducationServlet" method="post">
		<p>
			<input type="text" name="txtEducationName">
		</p>
		<p>
			<input type="text" name="txtLocale">
		</p>
		<input type="submit" name="submit" value="Create"> <input
			name="operation" value="createeducation" type="hidden">
	</form>

	<form action="/HyggeClientProject/EducationServlet" method="post">
		<input type="submit" name="submit" value="Back"> <input
			name="operation" value="searcheducation" type="hidden">
	</form>
</body>
</html>