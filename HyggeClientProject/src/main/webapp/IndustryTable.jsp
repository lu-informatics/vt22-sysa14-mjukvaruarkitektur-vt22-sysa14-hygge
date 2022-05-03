<%@page import="hygge.ejb.ics.Industry"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Hygge - Industry Index</title>
</head>
<body>
	<%
	ArrayList<Industry> industries = (ArrayList<Industry>) request.getAttribute("Industries");
	%>

	
		<table>
			<%
			PrintWriter writer = response.getWriter();
			writer.println("<head>");
			writer.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/hygge.css\">");
			
							
								
			writer.println("<meta charset=\"ISO-8859-1\">");
			writer.println("<meta name= \"viewport\" content =\"width=device-width, initial-scale=1.0\"\">");
			
			writer.println("</head>");
			writer.println("<body>");

			writer.println("<div class=\"header\">");
			writer.println("<nav>");
			writer.println("<img src = \"https://scontent.xx.fbcdn.net/v/t1.15752-9/278463040_556781142533262_2520632013925055238_n.png?stp=dst-png_p206x206&_nc_cat=103&ccb=1-5&_nc_sid=aee45a&_nc_ohc=ruope7E6Ih0AX_5py1G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLL9P-Zxo_n9s0OhNJt0VPVIA9sPTpyogfMQDz2kGq5bA&oe=629379B0\" class= \"logo\" \">");
		
			
			
			
			writer.println("<h1>Industries</h1>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"Home\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"home\">");
			writer.println("</form>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"About\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"about\">");
			writer.println("</form>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"Educations\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"fetch\">");
			writer.println("<input type=\"hidden\" name=\"entityType\" value=\"Education\">");
			writer.println("</form>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"Industries\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"fetch\">");
			writer.println("<input type=\"hidden\" name=\"entityType\" value=\"Industry\">");
			writer.println("</form><br><br>");

			writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
			writer.println("<input type=\"submit\" name=\"submit\" value=\"Search\">");
			writer.println("<input type=\"hidden\" name=\"navigate\" value=\"search\">");
			writer.println("<input type=\"hidden\" name=\"entityType\" value=\"Industry\">");
			writer.println("</form>");

			writer.println("<table><tr>");
			writer.println("<td>&emsp;&emsp;&emsp;<b>Name</b></td>");
			writer.println("<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>Field</b></td>");
			
			
			
			
			
			for (Industry i : industries) {
				writer.println("<form action=\"/HyggeClientProject/MergedServlet\" method=\"get\">");
				writer.println("<table>");
				writer.println("<tr>");
				writer.println("<td><input type=\"submit\" name=\"submit\" value=\"Manage\"></td>");

				writer.println("<td><input type=\"text\" name=\"txtID\" value=\"" + i.getIndustryName() + "\" readonly></td>");

				writer.println("<td><input type=\"text\" name=\"txtField\" value=\"" + i.getField() + "\" readonly></td>");

				writer.println("</tr>");
				writer.println("<input name=\"navigate\" value=\"fetch\" type=\"hidden\">");
				writer.println("<input name=\"entityType\" value=\"Industry\" type=\"hidden\">");
				writer.println("<input name=\"origin\" value=\"table\" type=\"hidden\">");
				writer.println("</form>");
				
				writer.println("</tr></table>");
			}
			%>
		</table>
		<br> <br>
		<h3>Create New Industry</h3>
		<form action="/HyggeClientProject/MergedServlet" method="post">
			<table>
				<tr>
					<td>Name:<input type="text"  name="txtID"></td>
				</tr>
				<tr>
					<td>Field:<input type="text" name="txtField"></td>
				</tr>
				<tr>
					<td><input type="submit" name="submit" value="Create"><input
						name="navigate" value="create" type="hidden"> <input
						name="entityType" value="Industry" type="hidden"></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>