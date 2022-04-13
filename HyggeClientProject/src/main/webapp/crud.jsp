<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/hygge.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/hygge.css">


<title>Hygge Dashboard</title>
</head>
<body>
<section id="row">
<nav>
<ul>
<li class="active"><a>Home</a></li>
<li><a>Database</a></li>
<li><a>About</a></li>
</ul>
</nav>
<aside>
<table id="asideTable">
<tr>
<th><span id="city"></span></th>
<th><span></span></th>
<th><span></span></th>
<th><span id="ipNbr"></span></th>
</tr>
<tr>
<td><span id="degree"></span></td>
<td><span id="weather"></span></td>
<td><span></span></td>
<td><span></span></td>
</tr>
<tr>
<td colspan="4"><span id="sunrise"></span></td>
</tr>
<tr>
<td colspan="4"><span id="sunset"></span></td>
</tr>
</table>
</aside>
<section id="main">
<section id="content">
<article>
<fieldset id="PersonalFS">
<legend>Industry:</legend>
Name:<br>
<input type="text" name="name" id="name" value=""><br>
Field:<br>
<input type="text" name="field" id="field" value="">
<br><br>
<input type="button" name="submitBtn" value="Find" id="FindBtn">
<input type="button" name="submitBtn" value="Add" id="AddBtn">
<input type="button" name="submitBtn" value="Delete" id="DeleteBtn">
<input type="button" name="submitBtn" value="Update" id="UpdateBtn">
</fieldset>
</article>
</section>
</section>
</section>
</body>
</html>

