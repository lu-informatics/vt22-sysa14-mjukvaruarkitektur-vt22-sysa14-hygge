<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html> 
<html> 
<head>
<style>
@media screen and (max-width:600px) { 
      .column { 
           width: 100%; 
      } 
 } 
   * { 
       box-sizing: border-box; 
 } 
 
 header{ 
      padding: 10px; 
      text-align: center; 
      font-size: 35px; 
      background-color: #F0FFF0; 
 } 
 section#row{ 
       padding: 10px 0px 10px 0px; 
       display:block; 
 } 
 section#row:after { 
      content: ""; 
      display: table; 
      clear: both; 
 } 
 section#main { 
      float: left; 
      width:47%; 
       padding: 0px 10px 0px 15px; 
      background-color: #ffffff; 
      color: #000000; 
 } 
 section#content { 
      padding: 10px 10px 10px 10px; 
      background-color: #F5FFFA; 
      color: #000000; 
} 
 #PersonalFS { 
    width:350px; 
 } 
 footer{ 
      text-align: center; 
      padding: 1px; 
      background-color: #F5FFFA; 
      clear: both; 
 } 
nav{ 
      float: left; 
      width:20%;     
      background-color: #F5FFFA; 
    padding: 0px 10px 0px 0px; 
 } 
 nav a { 
     display: block; 
      color: ffffff; 
      padding: 10px 10px; 
      text-decoration: none; 
 } 
 
 /* Change color on hover */ 
 nav1 a:hover { 
      background-color: #ddd; 
      color: black; 
 } 
 nav ul { 
      list-style-type: none; 
      margin: 0; 
      padding: 0; 
 } 
 nav li:hover, 
 nav li:focus { 
    color: #ffffff; 
    background-color: #d6d6d6; 
 } 
 nav li.active { 
           background: #555; 
           color: #ffffff !important; 
 } 
aside { 
    float: right; 
    width: 30%; 
    background-color: #f1f1f1; 
 } 
 .active {
  color: #ffffff; 
  background-color: #d6d6d6; 
 }
 .EducationBtn {
  color: #ffffff; 
  background-color: #d6d6d6; 
 }
</style> 
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"> 
  </script> 
  <meta charset="ISO-8859-1">
<title>Hygge Rest Education</title> 
</head> 
<body>
   <header> 
 <p>Hygge RestClient</p> 
   </header> 
   <section id="row">  
      <section id="main"> 
         <section id="content">       
 <article> 
    <fieldset id="PersonalFS"> 
       <legend>Find or Create an Education</legend> 
       Education name:<br> 
       <input type="text" name="educationName" id="educationName" value=""><br> 
      Locale:<br> 
       <input type="text" name="locale" id="locale" value=""> 
       <br> 
       <br> 
      <input type="button" class ="button" name="submitBtn" value="Find" id="FindBtn"> 
      <input type="button" class ="button" name="submitBtn" value="Add" id="AddBtn"> 
              </fieldset> 
 </article> 
         </section> 
      </section> 
   </section> 
   <footer> 
      <p>&copy; Hygge Inc. </p> 
   </footer> 
</body> 
<script>

$(document).ready(function(){
	$("#FindBtn").click( function() {  
		 var strValue =  $("#educationName").val();
		 if ( strValue != "") { 		
	       $.ajax({ 
	     method: "GET", 
	url: "http://localhost:8080/HyggeClientProject/HyggeRestServlet2/"+strValue,  
	       error: ajaxFindReturnError,  
	       success: ajaxFindReturnSuccess 
	 }) 
	 function ajaxFindReturnSuccess(result, status, xhr) { 
	   ParseJsonFileEducation(result);  
	  } 
	  function ajaxFindReturnError(result, status, xhr) {  
	   console.log("Ajax-find education: "+status); 
	   alert("Error");
	  } 
	    
	}
	    
})
	 $("#AddBtn").click( function() { 
	const ob = {}
   var strEducationName = $("#educationName").val();
   var strLocale = $("#locale").val(); 
	ob.educationName = strEducationName;
	ob.locale = strLocale;
	   var jsonString = JSON.stringify(ob);


   if (strEducationName != "") {   
 $.ajax({ 
  method: "POST", 
  url: "http://localhost:8080/HyggeClientProject/HyggeRestServlet2/",  
        data: jsonString, 
        dataType:'json', 
        error: ajaxAddReturnError,  
        success: ajaxAddReturnSuccess 
 })
 function ajaxAddReturnSuccess(result, status, xhr) { 
  clearFields(); 
  $("#educationName").attr("placeholder","Education added"); 
     
 } 
 function ajaxAddReturnError(result, status, xhr) { 
  alert("Error Add"); 
  console.log("Ajax-find education: "+status); 
	 } 
 
   } 
	 })
function ParseJsonFileEducation(result) { 
	  $("#educationName").val(result.educationName); 
	  $("#locale").val(result.locale); 
	console.log(result.educationName)
	 } 
	 function clearFields() { 
	  $("#EducationName").val(""); 
	  $("#locale").val("");  
	 }
 });
</script>
 </html>


 
    