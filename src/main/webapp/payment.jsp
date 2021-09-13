<%@page import="com.airlines.beans.AllObjects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<%@include file='all_component/allstyles.jsp'%>
</head>
<body>
	<%@include file='all_component/navbar.jsp'%>
	<%!AllObjects allObjects;%>
	<%
	if (session.getAttribute("allObjects") == null) {
	%>
	<div class="alert alert-danger" role="alert">Access Denied</div>
	<%
	} else {
	System.out.println(session.getAttribute("allObjects"));
	allObjects = (AllObjects) session.getAttribute("allObjects");
	%>
	<table class="table table-striped mt-5">
		<tbody>
			<tr>
				<th class='text-success' scope="col">Flight Details</th>

			</tr>
			<tr>

				<th scope="row">Flight No:</th>
				<td><%=allObjects.getFid()%></td>
				<th scope="row">Flight Name:</th>
				<td><%=allObjects.getFlight_name()%></td>
			</tr>
			<tr>
				<th scope="col">Travel:</th>
				<td><%=allObjects.getSource() + " To " + allObjects.getDestination()%></td>
				<th scope="col">Date:</th>
				<td><%=allObjects.getFlightDate()%></td>
			</tr>
			<tr>
				<th scope="col">Time:</th>
				<td><%=allObjects.getFlightTime()%></td>
				<th scope="col">Duration:</th>
				<td><%=allObjects.getTravelDuration() + " hours"%></td>
			</tr>
			<tr>
				<th scope="col">Airport:</th>
				<td><%=allObjects.getAirport()%></td>
				<th scope="col">Ticket Price:</th>
				<td><%=allObjects.getTicketPrice()%></td>
			</tr>




			<tr>
				<th class='text-info' scope="col">Your Details</th>

			</tr>
			<tr>
				<th scope="col">Name:</th>
				<td><%=allObjects.getFirstName() + " " + allObjects.getLastName()%></td>
				<th scope="col">Mobile Number:</th>
				<td><%=allObjects.getMobile_number()%></td>
			</tr>
			<tr>
				<th scope="col">Email:</th>
				<td><%=allObjects.getEmail()%></td>
				<th scope="col">Date:</th>
				<td><%=allObjects.getBook_date()%></td>
			</tr>
			<tr>
				<th scope="col">No. of Persons:</th>
				<td><%=allObjects.getNumber_of_persons()%></td>
				<th scope="col">Address:</th>
				<td><%=allObjects.getAddress()%></td>
			</tr>
			<tr>
				<th scope="col">Final Amount:</th>
				<td><%=allObjects.getNumber_of_persons() * allObjects.getTicketPrice()%></td>

			</tr>

		</tbody>
	</table>
	<%
	}if(request.getParameter("payment")==null){
	%>
	<div class="card mt-5 w-25 mx-auto">
		<h5 class="card-header text-primary bg-warning">Payment</h5>
		<div class="card-body">
			<form action='./payment.jsp?payment=success' method='post'>
				<div class="form-group">
					<label for="exampleInputEmail1">Card No.</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter card no."
						required="required">

				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Card Holder's Name</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter Name on Card"
						required="required">

				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Expiry Month</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="MM" required="required">

				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Expiry Year</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="yyyy"
						required="required">

				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">CVV</label> <input type="email"
						class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="cvv no"
						required="required">

				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form>

		</div>
	</div>
	<%}else{ %>
	
			<div class="alert alert-success w-25 mx-auto" role="alert">Payment Success<i class="fa fa-check-circle"></i></div>
	
	<%} %>
</body>
</html>