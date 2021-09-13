<%@page import="java.time.LocalDate"%>
<%@page import="com.airlines.dao.FlightDAOImpl"%>
<%@page import="com.airlines.dao.FlightDAO"%>
<%@page import="com.airlines.beans.Flight"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Flight</title>
<%@include file='all_component/allstyles.jsp'%>
</head>
<body>
	<%@include file='all_component/navbar.jsp'%>


	<div class="container-fluid mt-5">

		<div class="card w-50 mx-auto ">

			<div class="card-header bg-dark text-light ">Ticket Details</div>
			<div class="card-body ">

				<form action='./TicketBookingServlet' method='post'>

					<div class="form-group">
						<label for="exampleInputEmail1">Flight Id</label> <input
							type="text" class="form-control" name='fid'
							id="exampleInputEmail1" aria-describedby="emailHelp" readonly
							value=<%="'" + request.getParameter("fid") + "'"%>>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">User Id</label> <input type="text"
							name='uid' class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter source" readonly
							value=<%="'" + request.getParameter("uid") + "'"%>>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Email</label> <input type="email"
							name='email' class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email"
							required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Mobile number</label> <input
							type="text" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Mobile number" name='mobile_number'
							required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Number of persons</label> <input
							type="number" class="form-control" id="exampleInputPassword1"
							min='1' step='any' placeholder="Enter persons"
							name='number_of_persons' required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Date</label> <input type="text"
							class="form-control" id="exampleInputPassword1" name='book_date'
							readonly value=<%=LocalDate.now()%>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Address</label>
						<textarea rows='5'  class="form-control"
							id="exampleInputPassword1"
							placeholder="Enter Address"
							name='address'></textarea>
					</div>
                     <div class="form-row">
						<div class="form-group col-lg">
							 <button type="submit" class="btn btn-info class='form">Proceed to payment</button>
						</div>
						
						<div class="form-group col-lg">
							<a type="submit" href='./Flightlist.jsp' class="btn btn-danger">Cancel
								</a>
						</div>
					</div>
                      
                     
                      
                     
                      
					
				</form>
			</div>

		</div>
	</div>

</body>
</html>