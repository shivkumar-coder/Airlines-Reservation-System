<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Flight</title>
<%@include file='all_component/allstyles.jsp'%>
</head>
<body>
	<%@include file='all_component/navbar.jsp'%>
	<%if(session.getAttribute("isAdmin")==null||((boolean)session.getAttribute("isAdmin"))==false){ %>
	<div class="alert alert-danger" role="alert">Access Denied</div>
	<%}else{
		
	int fid=Integer.parseInt(request.getParameter("fid"));
	String flight_name=request.getParameter("flight_name");
	String source=request.getParameter("source");
	String destination=request.getParameter("destination");
	String flight_date=request.getParameter("flight_date");
	String flight_time=request.getParameter("flight_time");
	int travel_duration=Integer.parseInt(request.getParameter("travel_duration"));
	String ticket_price=request.getParameter("ticket_price");
	String airport=request.getParameter("airport");
	String description=request.getParameter("description");
	if(session.getAttribute("isFlightUpdated")!=null){
	%>
	<div class="alert alert-danger" role="alert">Access Denied</div>
	<%} %>

	<div class="container-fluid mt-5">

		<div class="card w-50 mx-auto ">

			<div class="card-header bg-dark text-light ">Edit Flight
				Details</div>
			<div class="card-body ">

				<form action=<%="./EditFlightServlet?fid="+fid %> method='post'>

					<div class="form-group">
						<label for="exampleInputEmail1">Flight Name</label> <input
							type="text" class="form-control" name='flight_name'
							id="exampleInputEmail1" aria-describedby="emailHelp"
							required="required" placeholder="Enter flight name"
							value=<%=""+flight_name+"" %>>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">From City</label> <input
							type="text" name='source' class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="Enter source" required="required" value=<%=source %>>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">To city</label> <input type="text"
							name='destination' class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter destination"
							required="required" value=<%=destination %>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Date</label> <input type="date"
							class="form-control" id="exampleInputPassword1"
							placeholder="Enter password" name='flight_date'
							required="required" value=<%=flight_date %>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Time</label> <input type="time"
							class="form-control" id="exampleInputPassword1"
							placeholder="Enter departure time" name='flight_time'
							required="required" value=<%=flight_time %>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Travel Duration</label> <input
							type="number" min='1' step='any' max='100' class="form-control"
							id="exampleInputPassword1" placeholder="Enter travel duration"
							name='travel_duration' required="required"
							value=<%=travel_duration %>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Airport Name</label> <input
							type="text" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Airport Name" name='airport'
							required="required" value=<%=airport %>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Ticket Price</label> <input
							type="number" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Ticket price" name='ticket_price'
							required="required" min='1' step='0.01' value=<%=ticket_price %>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Description</label>
						<textarea rows='5' class="form-control" id="exampleInputPassword1"
							placeholder="Enter Description if there is any"
							name='description'><%=description %></textarea>
					</div>

					<button type="submit" class="btn btn-primary">Save</button>
				</form>
			</div>

		</div>
	</div>
	<%} %>
</body>
</html>