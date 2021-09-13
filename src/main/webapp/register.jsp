<%@page import="com.airlines.beans.Flight"%>
<%@page import="java.util.List"%>
<%@page import="com.airlines.dao.FlightDAOImpl"%>
<%@page import="com.airlines.dao.FlightDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<%@include file='all_component/allstyles.jsp'%>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<%@include file='all_component/navbar.jsp'%>


	<div class="container-fluid mt-5">
		<%
		if (session.getAttribute("isRegistered") != null && ((boolean) session.getAttribute("isRegistered"))) {
		%><div class="alert alert-info" role="alert">User Registration
			Successful</div>
			<a class="btn btn-info" href='./login.jsp'>Login</a>
		<%
		}else{
		%>
		<div class="card w-50 mx-auto ">

			<div class="card-header  ">Registration Form</div>
			<div class="card-body ">
			
				<form action='./UserRegistrationServlet' method='post'>
					<% if(session.getAttribute("isRegistered")!=null){%>
					<div class="alert alert-danger" role="alert">Email Already Exists,Please Enter a different Email</div>
					<% } %>
					<div class="form-group">
						<label for="exampleInputEmail1">First Name</label> <input
							type="text" class="form-control" name='firstName'
							id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="e.g Tony" required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Last Name</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							name='lastName' aria-describedby="emailHelp"
							placeholder="e.g Stark" required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Email</label> <input type="email"
							name='email' class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Stark@gmail.com"
							required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Enter password" name='password' required="required">
					</div>

					<button type="submit" class="btn btn-primary">Register</button>
				</form>
			</div>
			
		</div>
	</div>
	<%}session.removeAttribute("isRegistered"); %>
</body>
</html>