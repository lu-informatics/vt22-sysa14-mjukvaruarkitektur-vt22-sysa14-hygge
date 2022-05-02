<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang = "eng">

<head>
	<meta name= "viewport" content ="width=device-width, initial-scale=1.0">
	<title>Hygge Inc</title>
<style>

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
position: relative;
bottom: 150px;
	
	
}
.text-box p {
	position: relative;
	bottom: 130px;
	

}

.text-box .btn{
	outline: none;
	border: none; 
	font-size: 16px;
	margin-top: 30px;
	background: #E4552A;
	color: #fff;
	padding 14px 40px;
	cursor: pointer;
}
.download {
	position: absolute;
	right: 7%;
	bottom: 60px;
	display: flex;
	align-items: center;
	text-decoration: none;
	color: #fff;
	padding: 20px 40px;
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
}

</style>
</head>
<body>

<div class ="header">
	<nav>

		<img src = "https://scontent.xx.fbcdn.net/v/t1.15752-9/278463040_556781142533262_2520632013925055238_n.png?stp=dst-png_p206x206&_nc_cat=103&ccb=1-5&_nc_sid=aee45a&_nc_ohc=ruope7E6Ih0AX_5py1G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLL9P-Zxo_n9s0OhNJt0VPVIA9sPTpyogfMQDz2kGq5bA&oe=629379B0" class= "logo">
 
<ul>
	<li><a href="HomeFinal.jsp">Home</a></li>	
	<li><a href="AboutFinal.jsp">About</a></li>
	<li><a href="IndustryTable.jsp">Industry</a></li>
	<li><a href="EducationTable.jsp">Education</a></li>
</ul>
</nav>
	
<div class ="text-box">
	<center>
	<h1>Who is Hygge</h1>
	<p>~ Learn about how five student started a leading dating app ~</p>
<p>&nbsp;</p> 
<p><small>Hygge Inc. was originally established in 2022 by five students at Ekonomihögskolan at Lund University. The idea behind the company is that dating should be fun and easy. We saw the lack in a good dating application where the look should not determine whether it would be a match or not, instead, we thought the determination should be based on interests and the individual goal of a relationship. Hygge is the modern way to interact with like-minded people. Hygge allow the user- the flexibility to narrow its search based on education and interests to find a match with someone with the same background.</small></p>
</center>	
</div>
<div class ="contact">
<footer>
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
  <p>© 2022 Hygge Inc.</p>
  <p>Contact information: HyggeIncContact@gmail.com</a>.</p>
</footer>
</div>
</div>
</body>
</html>