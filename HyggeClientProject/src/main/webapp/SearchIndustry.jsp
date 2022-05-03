<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body style="background-color: #957DAD;">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=ISO-
8859-1">
<style>
.button {
  background-color: #B4B6D3; 
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}

.text {

border: none;
  color: black;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}


</style>
<h2><span style="color:#FFFFFF;"> Search Industry! </span> </h2>
</head>
<body>
	<form action="/HyggeClientProject/MergedServlet" method="get">
		<table>
			<tr>
			
			</tr>
			<tr>
				<td><input type="text" name="txtID" size="25" maxlength="25" class="text" placeholder = "finance" required>
					<input type="submit" class= "button" name="submit" value="Send query" /></td>
				<td></td>
			</tr>
		</table>
		<input name="entityType" value="Industry" type="hidden"> <input
			name="navigate" value="fetch" type="hidden">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="service">
		<input type="submit" name="submit" class= "button" value="Back"> <input
			name="navigate" value="fetch" type="hidden"><input
			name="entityType" value="Industry" type="hidden">
	</form>
</body>
</html>