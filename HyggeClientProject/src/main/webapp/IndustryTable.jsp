<%@page import="hygge.ejb.ics.Industry"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/hygge.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hygge - Show Industries</title>
<script>src="validation.js"</script>
</head>

<body>
	<main>
		<div class="header">

			<nav>
				<img
					src="https://scontent.xx.fbcdn.net/v/t1.15752-9/278463040_556781142533262_2520632013925055238_n.png?stp=dst-png_p206x206&_nc_cat=103&ccb=1-5&_nc_sid=aee45a&_nc_ohc=ruope7E6Ih0AX_5py1G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLL9P-Zxo_n9s0OhNJt0VPVIA9sPTpyogfMQDz2kGq5bA&oe=629379B0"
					class="logo">

				<%
				ArrayList<Industry> industries = (ArrayList<Industry>) request.getAttribute("Industries");
				%>

				<form action="/HyggeClientProject/MergedServlet" method="get">
					<input type="submit" id="home-form" name="submit" value="Home"><input
						type="hidden" name="navigate" value="home">
				</form>

				<form action="/HyggeClientProject/MergedServlet" method="get">
					<input type="submit" id="about-form" name="submit" value="About"><input
						type="hidden" name="navigate" value="about">
				</form>

				<form action="/HyggeClientProject/MergedServlet" method="get">
					<input type="submit" id="educations-form" name="submit"
						value="Educations"><input type="hidden" name="navigate"
						value="fetch"><input type="hidden" name="entityType"
						value="Education">
				</form>

				<form action="/HyggeClientProject/MergedServlet" method="get">
					<input type="submit" id="industries-form" name="submit"
						value="Industries"><input type="hidden" name="navigate"
						value="fetch"><input type="hidden" name="entityType"
						value="Industry">
				</form>
				<form action="/HyggeClientProject/MergedServlet" method="get">

					<input type="submit" id="search-form" name="submit" value="Search"><input
						type="hidden" name="navigate" value="search"><input
						type="hidden" name="entityType" value="Industry">
				</form>
			</nav>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>

			<table>
				<%
				for (Industry i : industries) {
				%>

				<form action="/HyggeClientProject/MergedServlet" method="get">

					<tr>
						<td><input type="submit" id="manage" name="submit"
							value="Manage"> <input name="navigate" value="fetch"
							type="hidden"> <input name="entityType" value="Industry"
							type="hidden"> <input name="origin" value="table"
							type="hidden"></td>
						<td><input type="text" id="txtID1" name="txtID"
							value="<%=i.getIndustryName()%>" readonly></td>
						<td><input type="text" id="txtID1" name="txtField"
							value="<%=i.getField()%>" readonly></td>
					</tr>

				</form>

				<%
				}
				%>
			</table>
			<br> <br>
			<h3>Create New Industry</h3>
			<form action="/HyggeClientProject/MergedServlet" method="post">
				<table>
					<tr>
						<td>Name:<input type="text" id="txtID1" name="txtID"></td>
					</tr>
					<tr>
						<td>Field:<input type="text" id="txtID2" name="txtField"></td>
					</tr>
					<tr>
						<td><input type="submit" id="submit" name="submit"
							value="Create"><input name="navigate" value="create"
							type="hidden"> <input name="entityType" value="Industry"
							type="hidden"></td>
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