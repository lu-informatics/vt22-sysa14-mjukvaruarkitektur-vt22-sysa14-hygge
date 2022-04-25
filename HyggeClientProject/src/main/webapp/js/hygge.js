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
});//End ready function

function ParseJsonFile(result){
	var latitude= result.latitude;
	var longitude= result.longitude;
	var city=result.city;
	var ipNbr = result.ip;
	
	$("#city").text(city);
	$("#ipNbr").text(ipNbr);
	
}
