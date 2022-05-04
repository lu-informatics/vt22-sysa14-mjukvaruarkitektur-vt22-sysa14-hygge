<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/hygge.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Industry</title>
<style>
input[type=submit] {
	font-weight: bold;
	font-family: times new roman;
	font-size: 30px;
	background-color: rgba(0, 0, 0, 0);
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 0px 0px;
	cursor: pointer;
	box-sizing: border-box;
}

input[type=submit]:hover {
	color: #800080;
}
</style>
</head>
<body>
	<main>
		<div class="header">
			<nav>
				<img
					src="https://scontent.xx.fbcdn.net/v/t1.15752-9/278463040_556781142533262_2520632013925055238_n.png?stp=dst-png_p206x206&_nc_cat=103&ccb=1-5&_nc_sid=aee45a&_nc_ohc=ruope7E6Ih0AX_5py1G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLL9P-Zxo_n9s0OhNJt0VPVIA9sPTpyogfMQDz2kGq5bA&oe=629379B0"
					class="logo">
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

				<form action="/HyggeClientProject/index.html" method="get">
					<input type="submit" name="submit" value="Test"><input
						type="hidden" name="navigate" value="fetch"><input
						type="hidden" name="entityType" value="Tests">
				</form>

			</nav>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<form action="/HyggeClientProject/MergedServlet" method="get">
				<table>
					<tr>
						<td><h2>Search Industry:</h2></td>
					</tr>
					<tr>
						<td><input type="text" id="txtID1" name="txtID" size="25"
							maxlength="25"> <input type="submit" name="submit"
							value="Send query" /><input name="entityType" value="Industry"
							type="hidden"> <input name="navigate" value="fetch"
							type="hidden"></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</main>
	<div class="contact">
		<footer>
			<p>© 2022 Hygge Inc.</p>
			<p>Contact information: HyggeIncContact@gmail.com</p>
		</footer>
	</div>
</body>
</html>