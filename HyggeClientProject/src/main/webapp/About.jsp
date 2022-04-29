<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hygge - About</title>
</head>
<body>

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

	<p>this will be the about page.</p>
</body>
</html>
<!-- TODO: add information about  -->