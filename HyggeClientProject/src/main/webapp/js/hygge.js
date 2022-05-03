$(document).ready(function(){
	
	function ajaxReturn_Success(result, status, xhr) { 
      ParseJsonFile(result); 
 
       } 
     function ajaxReturn_Error(result, status, xhr) { 
         console.log("Ajax-find movie: "+status); 
     } 
       
    });//End ready function 
    

 