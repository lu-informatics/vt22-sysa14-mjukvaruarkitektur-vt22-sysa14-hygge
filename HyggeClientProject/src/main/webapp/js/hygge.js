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
url: "http://localhost:8080/RestServerMovieProject/Movies/"+strValue,  
       error: ajaxFindReturnError,  
       success: ajaxFindReturnSuccess 
 }) 
 $("#DeleteBtn").click( function() {     var strValue = $("#id").val(); 
   if (strValue != "") { 
      $.ajax({ 
    method: "DELETE", 
  url: "http://localhost:8080/RestServerMovieProject/Movies/"+strValue,  
         error: ajaxDelReturnError,  
         success: ajaxDelReturnSuccess 
      }) 
      function ajaxDelReturnSuccess(result, status, xhr) { 
    clearFields(); 
    $("#title").attr("placeholder","Movie deleted" ); 
      
      } 
      function ajaxDelReturnError(result, status, xhr) { 
         alert("Error"); 
         console.log("Ajax-find movie: "+status); 
      } 
 
 } 
})//btnclick 
  function ajaxFindReturnSuccess(result, status, xhr) { 
  ParseJsonFileMovie(result);  
 } 
 function ajaxFindReturnError(result, status, xhr) { 
  alert("Error"); 
  console.log("Ajax-find movie: "+status); 
 } 
   } 
})//btnclick 
});//End ready function

function ParseJsonFile(result){
	var latitude= result.latitude;
	var longitude= result.longitude;
	var city=result.city;
	var ipNbr = result.ip;
	
	$("#city").text(city);
	$("#ipNbr").text(ipNbr);	
}
function ParseJsonFileMovie(result) { 
  $("#id").val(result.id); 
  $("#title").val(result.title); 
  $("#price").val(result.price); 
 } 
 function clearFields() { 
  $("#id").val(""); 
  $("#title").val(""); 
  $("#price").val(""); 
 } 