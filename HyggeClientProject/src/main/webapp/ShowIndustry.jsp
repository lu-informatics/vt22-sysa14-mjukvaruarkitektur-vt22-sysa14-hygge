<%@ page import="hygge.ejb.ics.Industry"%>
<%@ page import="hygge.ejb.ics.Education"%>
<%@ page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href= "css/hygge.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hygge - Manage Industry</title>
</head>

<body>
<main>
	<div class="header">
	<nav>
		<img src="https://scontent.xx.fbcdn.net/v/t1.15752-9/278463040_556781142533262_2520632013925055238_n.png?stp=dst-png_p206x206&amp;_nc_cat=103&amp;ccb=1-5&amp;_nc_sid=aee45a&amp;_nc_ohc=ruope7E6Ih0AX_5py1G&amp;_nc_ad=z-m&amp;_nc_cid=0&amp;_nc_ht=scontent.xx&amp;oh=03_AVLL9P-Zxo_n9s0OhNJt0VPVIA9sPTpyogfMQDz2kGq5bA&amp;oe=629379B0" class="logo">
			<%
			Industry i = (Industry) request.getAttribute("entity");
			String origin = request.getAttribute("origin") != null ? (String) request.getAttribute("origin")
					: (String) request.getParameter("origin");
			String connectedEducationDescription = "None";
			Set<Education> connectedEducations = (Set<Education>) request.getAttribute("connectedEntities");
			if (connectedEducations != null && !connectedEducations.isEmpty()) {
				connectedEducationDescription = "";
				for (Education e: connectedEducations) {
					connectedEducationDescription += e.getEducationName() + "<br>";
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
				<input type="submit" id="test-form" name="submit" value="Test"><input
					type="hidden" name="navigate" value="fetch"><input
					type="hidden" name="entityType" value="Test">
			</form>
		</nav>
		<div class="education text-box">
			<h2>Manage Industry</h2>
			<br>

		</div>
		<div class ="contact">
<footer>
  <p>© 2022 Hygge Inc.</p>
  <p>Contact information: HyggeIncContact@gmail.com</p>
</footer>
</div>
		
		<table>
				<tr>
					<td><form action="/HyggeClientProject/MergedServlet" method="put">
			
				<b id="txtID1">Name:</b><input type="text" id="txtID" name="txtID"
					value="<%=i.getIndustryName()%>"> <b id="txtID1">Field:</b><input
					type="text" id="txtID2" name="txtField" value="<%=i.getField()%>">
			
			
			<input type="submit" id="txtID1" name="update" value="Update">
			<input name="navigate" value="update" type="hidden"><input
				name="entityType" value="Industry" type="hidden"><input
				name="origin" value=<%=origin%> type="hidden">
		</form><td>

					<td>
		<form action="/HyggeClientProject/MergedServlet" method="delete">
			<input type="submit" id="txtID1" name="submit" value="Delete">
			<input name="navigate" value="delete" type="hidden"><input
				name="entityType" value="Industry" type="hidden"><input
				name="origin" value="<%=origin%>" type="hidden">
		</form></td>

					<td><form action="/HyggeClientProject/MergedServlet" method="service">
			<input type="submit" id="txtID1" name="submit" value="Back"> <input
				name="navigate" value="<%=(origin != null ? "fetch" : "search")%>"
				type="hidden"> <input name="entityType" value="Industry"
				type="hidden">
		</form></td>
				</tr>
			</table>
		
		<p id="txtID1">Connected Industries:</p>
		<p id="txtID1"><%=connectedEducationDescription%></p>

		<form action="/HyggeClientProject/MergedServlet"
			method="manageEntityRelationship">
			<input type="text" id="txtID1" name="txtIndustryName"><input
				type="hidden" name="txtEducationName"
				value="<%=i.getIndustryName()%>"> <input type="submit"
				name="submit" id="txtID1" value="Attach"><input name="navigate"
				value="manageRelationship" type="hidden"><input
				name="operation" value="attach" type="hidden"><input
				name="entityType" value="Education" type="hidden">

		</form>
	</div>
	</main>
	<div class ="contact">
<footer>
  <p>© 2022 Hygge Inc.</p>
  <p>Contact information: HyggeIncContact@gmail.com</p>
</footer>
</div>
</body>
</html>