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
      <input type="button" name="submitBtn" value="Find" id="FindBtn"> 
      <input type="button" name="submitBtn" value="Add" id="AddBtn"> 
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
		 var strValue =  $("#EntityType").val();
		 if ( strValue != "") { 		
	       $.ajax({ 
	     method: "GET", 
	url: "http://localhost:8080/HyggeClientProject/HyggeRestServlet2/"+strValue,  
	       error: ajaxFindReturnError,  
	       success: ajaxFindReturnSuccess 
	 }) 
}
	 }) 
	 function ajaxFindReturnSuccess(result, status, xhr) { 
	   ParseJsonFileEducation(result);  
	  } 
	  function ajaxFindReturnError(result, status, xhr) { 
	   alert("Error"); 
	   console.log("Ajax-find education: "+status); 
	  } 
	    }
	    
	 })
	 $("#AddBtn").click( function() {  
   var strEducationName = $("#educationName").val();
   var strLocale = $ ("#industryName").val(); 
   var obj = { educationName: strEducationName, industryLoale: strLocale}; 
   var jsonString = JSON.stringify(obj); 
  
   if (strEducationNumber != "") {   
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
})//btnclick 
function ParseJsonFileEducation(result) { 
	  $("#educationName").val(result.educationName); 
	  $("#locale").val(result.locale); 
	 
	 } 
	 function clearFields() { 
	  $("#EducationName").val(""); 
	  $("#locale").val("");  
	 }
</script>
 </html>


 
    