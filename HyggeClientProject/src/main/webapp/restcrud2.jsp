<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <link rel="stylesheet" type="text/css" href="css/hygge.css"> 
   <script src="js/hygge.js"></script> 
<title>Hygge Rest</title> 
</head> 
<body> 
<input type = "hidden" id="EntityType" name = "Industry" value = "">
   <header> 
 <p>Hygge RestClient Industry</p> 
   </header> 
   <section id="row"> 
<nav> 

      <ul> 
  <li class="active"><p></p><input type="button" onclick= "location.href = 'http://localhost:8080/HyggeClientProject/restcrud.jsp';" value= Education />
<p></p><input type="button" onclick="location.href = 'http://localhost:8080/HyggeClientProject/restcrud2.jsp';"  value= Industry /></li>   
     </ul> 
 </nav> 
      <section id="main"> 
         <section id="content">       
 <article> 
    <fieldset id="PersonalFS"> 
       <legend>Industry:</legend> 
       Industry name:<br> 
       <input type="text" name="industryName" id="industryName" value=""><br> 
     Field:<br> 
       <input type="text" name="field" id="field" value=""> 
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
   <form action="">
<div align="center"><textarea readonly name="" cols="50" rows="4"></textarea></div>
</form> 
   <footer> 
      <p>&copy; Hygge Inc. </p> 
   </footer> 
</body> 
</html> 

