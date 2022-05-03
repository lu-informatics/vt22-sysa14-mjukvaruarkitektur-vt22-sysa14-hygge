<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang = "eng">

<head>
	<meta name= "viewport" content ="width=device-width, initial-scale=1.0">
	<title>Hygge Inc</title>
<style>
aside { 
    position: absolute;
	right: 7%;
	bottom: 280px;
	display: flex;
	align-items: center;
	text-decoration: none;
	color: #fff;
	padding: 1px 20px;
	border-radius: 40px;	
 } 
.span {
color: #FFE4E1;
}

*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	front-family: 'poppins', sans-serif;
}

.header {
	width:100%;
	height:100vh;
	background-image: url(https://miro.medium.com/max/1200/1*OEnS6-DEn56szCwdOs2mrA.jpeg);
	background-position: center;
	background-size: cover;
	color: #fff;
	padding: 0 7%;
	position: relative;

}
nav{
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 30px 0 10px; 


}
nav ul li {
display: inline-block;
list-style: none;
margin: 10px 30px;

}
.logo{
	width: 160px;
	cursor: pointer;
}
nav ul li a{
	text-decoration: none;
	color: #fff;
	fron-size: 17px;
	letter-spacing: 1px;
}
nav ul li a:hover{
	color: #ff3e3b;
}
.text-box{
	margin-top: 16%;
	font-size: 22px;

}
.text-box h1{
	font-size: 85px;
	font-weight: 600px;
	line-height: 100px;
	margin-bottom: 10px;

}
.contact {
position: absolute;
	left: 7%;
	bottom: 20px;
	display: flex;
	align-items: center;
	text-decoration: none;
	color: #fff;
	padding: 1px 20px;
	border-radius: 40px;	

}

.download {
	position: absolute;
	right: 7%;
	bottom: 60px;
	display: flex;
	align-items: center;
	text-decoration: none;
	color: #fff;
	padding: 5px 5px;
	border-radius: 40px;	
}
.download img{
	width: 25px;
	margin-left: 15px;
	animation: move 2s linear infinite;

}
@keyframes move{
0&{
	transform: translateY(-10px);
}
50%{
	transform: translateY(10px);
}
100%{
	transform: translateY(-10px);
}
input[type=text] {
 text-decoration: none;
	color: #fff;
	fron-size: 17px;
	letter-spacing: 1px;
}


</style>
</head>
<body>
<div class ="header">
	<nav>
		<img src = "https://scontent.xx.fbcdn.net/v/t1.15752-9/278463040_556781142533262_2520632013925055238_n.png?stp=dst-png_p206x206&_nc_cat=103&ccb=1-5&_nc_sid=aee45a&_nc_ohc=ruope7E6Ih0AX_5py1G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLL9P-Zxo_n9s0OhNJt0VPVIA9sPTpyogfMQDz2kGq5bA&oe=629379B0" class= "logo">


<form action="/HyggeClientProject/MergedServlet" method="get">
		<input type="submit" name="submit" value="Home"><input
			type="hidden" name="navigate" value="home">
	</form>

	<form action="/HyggeClientProject/MergedServlet" method="get">
		<input type="submit" name="submit" value="About"><input
			type="hidden" name="navigate" value="about">
	</form>

	<form action="/HyggeClientProject/MergedServlet" method="get">
		<input type="submit" name="submit" value="Educations"><input
			type="hidden" name="navigate" value="fetch"><input
			type="hidden" name="entityType" value="Education">
	</form>

	<form action="/HyggeClientProject/MergedServlet" method="get">
		<input type="submit" name="submit" value="Industries"><input
			type="hidden" name="navigate" value="fetch"><input
			type="hidden" name="entityType" value="Industry">
	</form>
	
</nav>	
<div class ="text-box">
	<h1>Go on<br>Your First Date</h1>
</div>
<a href = "#" class= "download">DOWNLOAD THE APP<img src="https://scontent.xx.fbcdn.net/v/t1.15752-9/279275934_4956982131024421_3508513496646403461_n.png?stp=dst-png_p206x206&_nc_cat=105&ccb=1-5&_nc_sid=aee45a&_nc_ohc=5q5bVbwbK-oAX9cOVUu&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKGP0XUfQksObxDCHlSiold805I5Bj6QxvCH4A244eLyw&oe=6293599B" width="20" height="20"></a>
</div>
<div class ="contact">
<footer>
  <p>© 2022 Hygge Inc.</p>
  <p>Contact information: HyggeIncContact@gmail.com</p>
</footer>
</div>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"> 
  </script> 
   <meta charset="ISO-8859-1"> 
<title>Rest Test</title> 
</head> 
<body> 
   <section id="row"> 
 <aside> 

    <table id="asideTable"> 
     <tr> 
	
       <td><span id="city" style="color:white; postition ="></span></th> 
       <td><span></span></th> 
       <td><span></span></th> 
       <td><span id="ipNbr" style="color:white"></span></th>
</tr> 
    <tr> 
       <td><span id="degree" style="color:white"></span></td> 
       <td><span id="weather" style="color:white"></span></td> 
           <td><span></span></td> 
       <td><span></span></td> 
    </tr> 
    <tr> 
     <td colspan="4"><span id="sunrise" style="color:white"></span></td>  
    </tr> 
    <tr> 
         <td colspan="4"><span id="sunset" style="color:white"></span></td> 
    </tr> 
    </table>  
  </aside> 
      <section id="main"> 
         <section id="content">       
         </section> 
      </section> 
   </section> 
   <footer> 
   </footer> 
</body>
</html>
<script> 
$(document).ready(function(){ 
        $.ajax({ 
             method: "GET", 
       url: "http://api.ipstack.com/check?access_key=b96e07c0799629b46faa36b25c063ded",  
             error: ajaxReturn_Error,  
             success: ajaxReturn_Success 
        }) 
  
     function ajaxReturn_Success(result, status, xhr) { 
      ParseJsonFile(result); 
 
       } 
     function ajaxReturn_Error(result, status, xhr) { 
         console.log("Ajax-find movie: "+status); 
     }   
    });//End ready function 
 
 
    function ParseJsonFile(result) { 
       var lat = result.latitude; 
       var long = result.longitude; 
       var city = result.city; 
       var ipNbr = result.ip 
       $("#city").text(city); 
       $("#ipNbr").text(ipNbr); 
 
 $.ajax({ 
             method: "GET", 
      url: "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+ 
   long+"&units=metric"+ "&APPID=e0b52cb8538047de8020c53dde9e732c",  
                error: ajaxWeatherReturn_Error,  
                success: ajaxWeatherReturn_Success 
            })
function ajaxWeatherReturn_Success(result, status, xhr) { 
     var sunrise = result.sys.sunrise; 
    var sunset = result.sys.sunset; 
 
    var sunriseDate = new Date(sunrise*1000); 
    var timeStrSunrise = sunriseDate.toLocaleTimeString(); 
    var sunsetDate = new Date(sunset*1000); 
    var timeStrSunset = sunsetDate.toLocaleTimeString(); 
 
    $("#sunrise").text("Sunrise: "+timeStrSunrise); 
    $("#sunset").text("Sunset: "+timeStrSunset); 
 
    $("#weather").text(result.weather[0].main); 
             
    $("#degree").text(result.main.temp+" \u2103"); 
       }//ajaxWeatherReturn_Success 
 
     function ajaxWeatherReturn_Error(result, status, xhr) { 
             alert("Error i OpenWeaterMap Ajax"); 
             console.log("Ajax-find movie: "+status); 
     } 
     } 
</script>

    