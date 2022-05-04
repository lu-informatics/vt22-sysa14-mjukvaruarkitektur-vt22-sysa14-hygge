<%@page import="hygge.ejb.ics.Education"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/hygge.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hygge - Show Education</title>
<script>function validateForm(form,field1,field2) {
	  let x = document.forms[form][field1].value;
	  let y = document.forms[form][field2].value;
	  if (x == "" || !x.match(/^[A-Za-z]+$/) || y==""||!y.match(/^[A-Za-z]+$/) ) {
	    alert("Please fill out all fields, using alphabets only.");
	    return false;
	  }
	}</script>
</head>

<body>
	<main>
		<div class="header">

			<nav>
				<img
					src="https://scontent.xx.fbcdn.net/v/t1.15752-9/278463040_556781142533262_2520632013925055238_n.png?stp=dst-png_p206x206&_nc_cat=103&ccb=1-5&_nc_sid=aee45a&_nc_ohc=ruope7E6Ih0AX_5py1G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLL9P-Zxo_n9s0OhNJt0VPVIA9sPTpyogfMQDz2kGq5bA&oe=629379B0"
					class="logo">


				<%
				ArrayList<Education> educations = (ArrayList<Education>) request.getAttribute("Educations");
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
						type="hidden" name="entityType" value="Education">
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
				for (Education e : educations) {
				%>

				<form action="/HyggeClientProject/MergedServlet" method="get">
					<tr>
						<td><input type="submit" id="manage" name="submit"
							value="Manage"> <input name="navigate" value="fetch"
							type="hidden"> <input name="entityType" value="Education"
							type="hidden"> <input name="origin" value="table"
							type="hidden"></td>
						<td><input type="text" id="txtID1" name="txtID"
							value="<%=e.getEducationName()%>" readonly></td>
						<td><input type="text" id="txtID1" name="txtLocale"
							value="<%=e.getLocale()%>" readonly></td>
					</tr>
				</form>

				<%
				}
				%>
			</table>
			<br> <br>
			<h3>Create New Education</h3>
			<form name="createForm" action="/HyggeClientProject/MergedServlet" onsubmit="return validateForm('createForm','txtID','txtLocale')" method="post">
				<table>
					<tr>
						<td>Name:<input type="text" id="txtID1" name="txtID"></td>
					</tr>
					<tr>
						<td>Locale:<input type="text" id="txtID2" name="txtLocale"></td>
					</tr>
					<tr>
						<td><input type="submit" id="submit" name="submit"
							value="Create"><input name="navigate" value="create"
							type="hidden"> <input name="entityType" value="Education"
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