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
<title>Flight List</title>
<%@include file='all_component/allstyles.jsp'%>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<%@include file='all_component/navbar.jsp'%>
	<%
	if (session.getAttribute("isFlightUpdated") != null && (boolean) session.getAttribute("isFlightUpdated")) {
	%>
	<div class="alert alert-success mx-auto w-25" role="alert">Flight
		information updated successfully</div>
	<%
	session.removeAttribute("isFlightUpdated");
	}
	if (request.getParameter("added") != null) {
	%>
	<div class="alert alert-success mx-auto w-25" role="alert">Flight
		Added Successfully</div>


	<%
	
	}
	%>
	<form class=' mt-5 p-4'>
		<p class="h3 text-center">Available Flights</p>
		<table class='table'>
			<tr>
				<td>From city</td>
				<td><input type="text" class="form-control"
					placeholder="First name" name='source'></td>
				<td>To city</td>
				<td><input type="text" class="form-control"
					placeholder="First name" name='destination'></td>
				<td>Date</td>
				<td><input type="date" class="form-control"
					placeholder="First name"></td>
				<td><button type='submit' class='btn btn-dark'>Search</button></td>
			</tr>

		</table>
		<table class="table">
			<tr>


			</tr>
			<thead class="thead-dark">
				<tr>
					<th>Flight No.</th>
					<th>Flight Name</th>
					<th>From City</th>
					<th>To City</th>
					<th>Date</th>
					<th>Time</th>
					<th>Duration</th>
					<th>Airport Name</th>
					<th>Ticket Price</th>
					<th>Description</th>
					<th>Book</th>
				</tr>
			</thead>
			<tbody>
				<%
				String source = request.getParameter("source");
				String destination = request.getParameter("destination");

				FlightDAO fdao = new FlightDAOImpl();
				List<Flight> list = fdao.getFlightList(source, destination);
				boolean isAdmin = session.getAttribute("user") != null && ((boolean) session.getAttribute("isAdmin"));

				if (list.isEmpty()) {
				%>
				<tr>
					<td><div class="alert alert-dark mx-auto" role="alert">No
							Flights Available</div></td>
				</tr>
				<%
				} else {
				int i = 1;
				for (Flight f : list) {
					out.println(
					"<tr><td>" + f.getFid() + "</td><td>" + f.getFlight_name() + "</td><td> " + f.getSource() + "</td><td>"
							+ f.getDestination() + "</td><td> " + f.getFlightDate() + "</td><td> " + f.getFlightTime()
							+ "</td><td> " + f.getTravelDuration() + " hours</td><td>" + f.getAirport() + "</td><td>"
							+ f.getTicketPrice() + "</td><td>" + f.getDescription() + "</td><td><a class='btn btn-"
							+ (isAdmin ? ("info'" + "href='editFlight.jsp?fid=" + f.getFid() + "&flight_name="
									+ f.getFlight_name() + "&source=" + f.getSource() + "&destination=" + f.getDestination()
									+ "&flight_date=" + f.getFlightDate() + "&flight_time=" + f.getFlightTime()
									+ "&travel_duration=" + f.getTravelDuration() + "&airport=" + f.getAirport()
									+ "&ticket_price=" + f.getTicketPrice() + "&description=" + f.getDescription() + "'")
									: ("warning' href=login.jsp?fid=" + f.getFid()))
							+ ">" + (isAdmin ? "Edit" : "Book") + "</a></td></tr>");
					System.out.println("loop " + f.getFid());
				}
				System.out.println("loop exit");
				//</td><td><a class='btn btn-"+(isAdmin?("info"):("warning")) +"' href='login.jsp?fid="+f.getFid()+"'>"+(isAdmin?"Edit":"Book")+"</a></td></tr>");
				//href='editFlight.jsp?fid="+f.getFid()+"&flight_name="+f.getFlight_name()+"&source="+f.getSource()+"&destination="+f.getDestination()+"&flight_date"+f.getFlightDate()+"&flight_time="+f.getFlightTime()+"&travel_duration"+f.getTravelDuration()+"&airport="+f.getAirport()+"&ticket_price="+f.getTicketPrice()+"&description="+f.getDescription()
				}
				%>
			</tbody>
		</table>

	</form>

</body>
</html>