<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome To Airlines Reservation System</title>
<%@include file='all_component/allstyles.jsp'%>
<style>

</style>

</head>
<body>
	<%@include file='all_component/navbar.jsp'%>
	<div class="container-fluid back-img">
		<%
		if (session.getAttribute("user") != null && (boolean) session.getAttribute("isLoggedIn")) {
			response.sendRedirect("UserHome.jsp");
		}
		%>
	</div>
	<div id="carouselExampleIndicators" class="carousel slide mx-auto "
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<a href='Flightlist.jsp'> <img class="d-block w-100"
					src="images/BN_TW_May22.jpg" alt="Third slide"></a>
				<div class="carousel-caption d-none d-md-block">
					<h5>Check available flights</h5>
					<p>All flight details at your home, convenience++</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="images/IndiGo-1-916x516-1-916x516.gif" alt="Second slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>Check your booking status</h5>
					<p>Passengers no longer have to rely on airport
						authorities,just one click and book your flights</p>
				</div>
			</div>
			<div class="carousel-item">
				<a href='login.jsp'><img class="d-block w-100"
					src="images/lufthansa_100119021241_241119061533.jpg"
					alt="First slide"></a>
				<div class="carousel-caption d-none d-md-block">
					<h5>Login/Register</h5>
					<p>We offer the best service, just login and book your flights</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</body>
</html>