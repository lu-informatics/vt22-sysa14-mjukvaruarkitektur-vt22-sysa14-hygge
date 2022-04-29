<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"> 
  </script> 
   <meta charset="ISO-8859-1"> 
   <link rel="stylesheet" type="text/css" href="css/hygge.css"> 
   <script src="js/hygge.js"></script> 
<title>Hygge Rest Education</title> 
</head> 
<body>
<input type = "hidden" id="EntityType" name = "Education" value = ""> 
   <header> 
 <p>Hygge RestClient</p> 
   </header> 
   <section id="row"> 
<nav> 
      <ul> 
  <li class="active"><p></p><input type="button" onclick="location.href = 'http://localhost:8080/HyggeClientProject/restcrud.jsp';" value= Education />
	<p></p><input type="button" onclick="location.href = 'http://localhost:8080/HyggeClientProject/restcrud2.jsp';"  value=Industry /></li> 
      </ul> 
 </nav> 
      <section id="main"> 
         <section id="content">       
 <article> 
    <fieldset id="PersonalFS"> 
       <legend>Education:</legend> 
       Education name:<br> 
       <input type="text" name="educationName" id="educationName" value=""><br> 
      Locale:<br> 
       <input type="text" name="locale" id="locale" value=""> 
       <br> 
       <br> 
      <input type="button" name="submitBtn" value="Find" id="FindBtn"> 
      <input type="button" name="submitBtn" value="Add" id="AddBtn"> 
      <input type="button" name="submitBtn" value="Delete" id="DeleteBtn"> 
      <input type="button" name="submitBtn" value="Update" id="UpdateBtn"> 
              </fieldset> 
 </article> 
         </section> 
      </section> 
   </section> 
   <footer> 
      <p>&copy; Hygge Inc. </p> 
   </footer> 
</body> 
</html>

 
    