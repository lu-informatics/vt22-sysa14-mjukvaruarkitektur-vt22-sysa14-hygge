<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=ISO-
8859-1">
<title>Search Industry</title>
</head>
<body>
	<form action="/HyggeClientProject/MergedServlet" method="get">
		<table>
			<tr>
				<td><h2>Search Industry:</h2></td>
			</tr>
			<tr>
				<td><input type="text" name="txtID" size="25" maxlength="25">
					<input type="submit" name="submit" value="Send query" /></td>
				<td></td>
			</tr>
		</table>
		<input name="entityType" value="Industry" type="hidden"> <input
			name="navigate" value="fetch" type="hidden">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="service">
		<input type="submit" name="submit" value="Back"> <input
			name="navigate" value="fetch" type="hidden"><input
			name="entityType" value="Industry" type="hidden">
	</form>
</body>
</html>