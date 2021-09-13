<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Flight</title>
<%@include file='all_component/allstyles.jsp'%>
</head>
<body>
	<%@include file='all_component/navbar.jsp'%>
	<%if(session.getAttribute("isAdmin")==null||!((boolean)session.getAttribute("isAdmin"))) {%>
	<div class="alert alert-danger" role="alert">Access Denied</div>
	<%}else{
	
	%>



	<div class="container-fluid mt-5">

		<div class="card w-50 mx-auto ">

			<div class="card-header bg-dark text-light ">Flight Details</div>
			<div class="card-body ">

				<form action='./FlightRegistrationServlet' method='post'>

					<div class="form-group">
						<label for="exampleInputEmail1">Flight Name</label> <input
							type="text" class="form-control" name='flight_name'
							id="exampleInputEmail1" aria-describedby="emailHelp"
							required="required" placeholder="Enter flight name">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">From City</label> <input
							type="text" name='source' class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="Enter source" required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">To city</label> <input type="text"
							name='destination' class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter destination"
							required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Date</label> <input type="date"
							class="form-control" id="exampleInputPassword1"
							placeholder="Enter password" name='date' required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Time</label> <input type="time"
							class="form-control" id="exampleInputPassword1"
							placeholder="Enter departure time" name='time'
							required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Travel Duration</label> <input
							type="number" min='1' step='any' max='100' class="form-control"
							id="exampleInputPassword1" placeholder="Enter travel duration"
							name='travel_duration' required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Airport Name</label> <input
							type="text" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Airport Name" name='airport'
							required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Ticket Price</label> <input
							type="number" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Ticket price" name='ticket_price'
							required="required" min='1' step='0.01'>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Description</label>
						<textarea rows='5' type="textarea" class="form-control"
							id="exampleInputPassword1"
							placeholder="Enter Description if there is any"
							name='description'></textarea>
					</div>

					<button type="submit" class="btn btn-primary">Add</button>
				</form>
			</div>

		</div>
	</div>
	<%} %>
</body>
</html>