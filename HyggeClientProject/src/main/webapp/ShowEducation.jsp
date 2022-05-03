<%@ page import="hygge.ejb.ics.Education"%>
<%@ page import="hygge.ejb.ics.Industry"%>
<%@ page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="sv">
<head>

<style>
</style>
<link rel="stylesheet" href="css/hygge.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hygge Inc.</title>

</head>
<body>

	<div class="header">
		<nav>
			<img
				src="https://scontent.xx.fbcdn.net/v/t1.15752-9/278463040_556781142533262_2520632013925055238_n.png?stp=dst-png_p206x206&_nc_cat=103&ccb=1-5&_nc_sid=aee45a&_nc_ohc=ruope7E6Ih0AX_5py1G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLL9P-Zxo_n9s0OhNJt0VPVIA9sPTpyogfMQDz2kGq5bA&oe=629379B0"
				class="logo">



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
			<form action="/HyggeClientProject/MergedServlet" method="get">
				<input type="submit" id="home-form" name="submit" value="Home"><input
					type="hidden" name="navigate" value="Home">

			</form>


			<form action="/HyggeClientProject/MergedServlet" method="get">
				<input type="submit" id="about-form" name="submit" value="About"><input
					type="hidden" name="navigate" value="About">
			</form>

			<form action="/HyggeClientProject/MergedServlet" method="get">
				<input type="submit" id="education-form" name="submit"
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
				<input type="submit" id="industries-form" name="submit" value="Test"><input
					type="hidden" name="navigate" value="fetch"><input
					type="hidden" name="entityType" value="Test">
			</form>



		</nav>
		<div class="education text-box">

			<h2>Edit Education:</h2>
		</div>
		
		<table>
				<tr>
					<td><form action="/HyggeClientProject/MergedServlet" method="put">
			
				<b>Name:</b><input type="text" name="txtID"
					value="<%=e.getEducationName()%>"> <b>Locale:</b><input
					type="text" name="txtLocale" value="<%=e.getLocale()%>">
			
			
			<input type="submit" id="update" name="update" value="Update">
			<input name="navigate" value="update" type="hidden"><input
				name="entityType" value="Education" type="hidden"><input
				name="origin" value=<%=origin%> type="hidden">
		</form><td>

					<td>
		<form action="/HyggeClientProject/MergedServlet" method="delete">
			<input type="submit" id="delete" name="submit" value="Delete">
			<input name="navigate" value="delete" type="hidden"><input
				name="entityType" value="Education" type="hidden"><input
				name="origin" value=<%=origin%> type="hidden">
		</form></td>

					<td><form action="/HyggeClientProject/MergedServlet" method="service">
			<input type="submit" id="back" name="submit" value="Back"> <input
				name="navigate" value=<%=(origin != null ? "fetch" : "search")%>
				type="hidden"> <input name="entityType" value="Education"
				type="hidden">
		</form></td>

				</tr>

			</table>
		
		<p>Connected Industries:</p>
		<p><%=connectedIndustryDescription%></p>
		<form action="/HyggeClientProject/MergedServlet"
			method="manageEntityRelationship">
			<input type="text" name="txtIndustryName"><input
				type="hidden" name="txtEducationName"
				value=<%=e.getEducationName()%>> <input type="submit"
				name="submit" value="Attach"><input name="navigate"
				value="manageRelationship" type="hidden"><input
				name="operation" value="attach" type="hidden"><input
				name="entityType" value="Education" type="hidden">

		</form>
	</div>


</body>

</html>