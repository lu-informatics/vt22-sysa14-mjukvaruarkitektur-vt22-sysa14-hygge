<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-
8859-1">
<title>Search Industry</title>
</head>
<body>
<form action="/HyggeClientProject/IndustryServlet" method="post">
<table cellspacing="0" cellpadding="0" border="0" align="left">
<tr>
<td><h2>Search Industry:</h2></td>
</tr>
<tr>
<td>
<input type="text" name="txtIndustryName" size="25"
maxlength="25">
<input type="submit" name="submit"
value="Send query" />
</td>
<td></td>
</tr>
</table>
<input name="operation" value="showindustry" type="hidden">
</form>
</body>
</html>