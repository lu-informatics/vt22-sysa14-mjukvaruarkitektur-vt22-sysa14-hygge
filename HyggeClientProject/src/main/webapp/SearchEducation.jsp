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

<div class ="header" >
	
		<img src = "https://scontent.xx.fbcdn.net/v/t1.15752-9/278463040_556781142533262_2520632013925055238_n.png?stp=dst-png_p206x206&_nc_cat=103&ccb=1-5&_nc_sid=aee45a&_nc_ohc=ruope7E6Ih0AX_5py1G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLL9P-Zxo_n9s0OhNJt0VPVIA9sPTpyogfMQDz2kGq5bA&oe=629379B0" class= "logo">


</div>

<h2><span style="color:#FFFFFF;"> Search Education! </span> </h2>
</head>
<body>
	<form action="/HyggeClientProject/MergedServlet" method="get">
		<table>
			<tr>
				
			</tr>
			<tr>
				<td><input type="text" name="txtID" size="25" maxlength="25" class= "text" placeholder = "economics" required>
					<input type="submit" class= "button" name="submit" value="Send query" /></td>
				<td></td>
			</tr>
		</table>
		<input name="entityType" value="Education" type="hidden"> <input
			name="navigate" value="fetch" type="hidden">
	</form>
	<form action="/HyggeClientProject/MergedServlet" method="service">
		<input type="submit" name="submit" class= "button" value="Back"> <input
			name="navigate" value="fetch" type="hidden"><input
			name="entityType" value="Education" type="hidden">
	</form>
</body>
</html>