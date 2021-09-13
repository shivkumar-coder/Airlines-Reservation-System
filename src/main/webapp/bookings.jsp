
<%@page import="com.airlines.beans.Booking"%>
<%@page import="java.util.List"%>
<%@page import="com.airlines.dao.BookingDAO"%>
<%@page import="com.airlines.dao.BookingDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file='all_component/allstyles.jsp'%>
<title>Insert title here</title>
</head>
<body>
	<%@include file='all_component/navbar.jsp'%>
	<%
	if (session.getAttribute("isLoggedIn") == null || (boolean) session.getAttribute("isLoggedIn") == false) {
	%>
	<div class="alert alert-danger" role="alert">Acess Denied ,Please
		Login First to see your bookings</div>
	<%
	} else {
		if(session.getAttribute("isBookingDeleted")!=null){
			%>
			<div class="alert alert-success w-25 mx-auto" role="alert">Flight Booking cancelled </div>
		<% session.removeAttribute("isBookingDeleted");}
	%>
	<form class=' mt-5 p-4'>
		<p class="h3 text-center">Your Bookings</p>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope='col'>Booking No.</th>
					<th scope='col'>Flight No.</th>
					<th scope='col'>Customer ID</th>
					<th scope='col'>Mobile Number</th>
					<th scope='col'>Booking Date</th>
					<th scope='col'>Email</th>
					<th scope='col'>Number of persons</th>
					<th scope='col'>Address</th>
					<th scope='col'>Options</th>


				</tr>
			</thead>
			<tbody>
				<%
				BookingDAO bookingDAO = new BookingDAOImpl();
				List<Booking> list = null;

				if (session.getAttribute("isLoggedIn") != null && (boolean) session.getAttribute("isLoggedIn")
						&& ((boolean) session.getAttribute("isAdmin") == false)) {
					User user = (User) session.getAttribute("user");
					list = bookingDAO.getAllBookings(user.getUid());
					System.out.println(user.getUid());
				} else {
					list = bookingDAO.getAllBookings(-1);
				}

				if (list == null||list.isEmpty()) {
				%>
				<tr>
					<td><div class="alert alert-dark mx-auto" role="alert">No
							Booking Availiable</div></td>
				</tr>
				<%
				} else {
				System.out.println("isLoggedIn" + session.getAttribute("isLoggedIn") + " " + session.getAttribute("isAdmin"));
				//User user=(User)session.getAttribute("user");

				int i = 1;
				for (Booking b : list) {
					out.println("<tr><th scope='row'>" + b.getBid() + "</th><td>" + b.getFid() + "</td><td> " + b.getUid() + "</td><td>"
					+ b.getMobile_number() + "</td><td> " + b.getBook_date() + "</td><td> " + b.getEmail() + "</td><td> "
					+ b.getNumber_of_persons() + " </td><td>" + b.getAddress() + "</td><td><a class='btn btn-danger' href='./DeleteBookingServlet?bid="+b.getBid()+"'>Cancel Booking</td></tr>");
				}

				}
				}
				%>
			</tbody>
		</table>

	</form>

</body>
</html>