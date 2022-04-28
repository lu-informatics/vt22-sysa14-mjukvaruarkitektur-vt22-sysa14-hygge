$(document).ready(function(){

$.ajax({
	method:"GET",
	url:"http://api.ipstack.com/check?access_key=7c186ff6d8893f6200e0722232814616",
	error: ajaxReturn_Error,
	success: ajaxReturn_Success
})

function ajaxReturn_Success(result,status,xhr){
	ParseJsonFile(result);
}
function ajaxReturn_Error(result,status,xhr){
	console.log("Ajax-api-stack:"+status);
	
}
("#FindBtn").click( function() {  
   var strValue = $("#id").val(); 
   if (strValue != "") { 
       $.ajax({ 
     method: "GET", 
url: "http://localhost:8080/HyggeClientProject/HyggeRestServlet/"+strValue,  
       error: ajaxFindReturnError,  
       success: ajaxFindReturnSuccess 
 }) 
  $("#DeleteBtn").click( function() {     var strValue = $("#id").val(); 
   if (strValue != "") { 
      $.ajax({ 
    method: "DELETE", 
  url: +strValue,  
         error: ajaxDelReturnError,  
         success: ajaxDelReturnSuccess   
      }) 
      function ajaxDelReturnSuccess(result, status, xhr) { 
    clearFields(); 
    $("#educationName").attr("placeholder","Education deleted" ); 
    $("#industryName").attr("placeholder","Industry deleted" ); 
      
      } 
      function ajaxDelReturnError(result, status, xhr) { 
         alert("Error"); 
         console.log("Ajax-find movie: "+status); 
      } 
 } 
})//btnclick 
 $("#AddBtn").click( function() {  
   var strId = $("#id").val(); 
   var strTitle = $("#title").val(); 
   var strPrice = $("#price").val(); 
   
   var obj = { id: strId, title: strTitle, price: strPrice}; 
   var jsonString = JSON.stringify(obj); 
   
   if (strId != "") { 
    
 $.ajax({ 
  method: "POST", 
  url: "http://localhost:8080/RestServerMovieProject/Movies/",  
        data: jsonString, 
        dataType:'json', 
        error: ajaxAddReturnError,  
        success: ajaxAddReturnSuccess 
 }) 
 function ajaxAddReturnSuccess(result, status, xhr) { 
  clearFields(); 
  $("#title").attr("placeholder","Movie added" ); 
     
 } 
 function ajaxAddReturnError(result, status, xhr) { 
  alert("Error Add"); 
  console.log("Ajax-find movie: "+status); 
 } 
 
   } 
})//btnclick 
$("#UpdateBtn").click( function() {  
  var strId = $("#id").val(); 
  var strTitle = $("#title").val(); 
  var strPrice = $("#price").val(); 
   
  var obj = { id: strId, title: strTitle, price: strPrice}; 
  var jsonString = JSON.stringify(obj); 
   
   if (strId != "") { 
    
     $.ajax({ 
  method: "PUT", 
  url: "http://localhost:8080/RestServerMovieProject/Movies/"+strId,  
  data: jsonString, 
  dataType:'json', 
  error: ajaxUpdateReturnError,  
  success: ajaxUpdateReturnSuccess 
     }) 
     function ajaxUpdateReturnSuccess(result, status, xhr) { 
  clearFields(); 
  $("#title").attr("placeholder","Movie updated" );    
     } 
     function ajaxUpdateReturnError(result, status, xhr) { 
  alert("Error Update"); 
  console.log("Ajax-find movie: "+status); 
     } 
 
  } })//btnclick 

  function ajaxFindReturnSuccess(result, status, xhr) { 
  ParseJsonFileEducation(result);  
 } 
  function ajaxFindReturnSuccess(result, status, xhr) { 
  ParseJsonFileIndustry(result);  
 } 
 function ajaxFindReturnError(result, status, xhr) { 
  alert("Error"); 
  console.log("Ajax-find movie: "+status); 
 } 
   } 
})//btnclick 
function test(username) {
	var returnValue = true;
	if (username == "") {
		alert("Please provide a name");
		return value = false;
	}
}

});//End ready function

function ParseJsonFileEducation(result) { 
  $("#educationName").val(result.id); 
  $("#locale").val(result.locale); 
 
 } 
 function ParseJsonFileIndustry(result) { 
  $("#indystryName").val(result.id); 
  $("#field").val(result.field); 
 
 } 
 function clearFields() { 
  $("#id").val(""); 
  $("#title").val(""); 
  $("#price").val(""); 
 }
 
 
  
  