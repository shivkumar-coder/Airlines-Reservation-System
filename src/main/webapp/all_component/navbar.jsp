<%@page import="com.airlines.beans.User"%>
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom bg-custom">
	<a class="navbar-brand" href="#">AirLine Tickets Booking</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="./"><i
					class="fa fa-home"></i>Home <span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item  active"><a class="nav-link"
				href="./Flightlist.jsp"><i class="fa fa-fighter-jet"></i>Flight
					<%
			if (session.getAttribute("user") != null && ((boolean) session.getAttribute("isAdmin"))) {
			%>Report<%
			}
			%></a></li>
			<%
			if (session.getAttribute("user") != null && ((boolean) session.getAttribute("isAdmin"))) {
			%>
			<li class="nav-item active"><a class="nav-link"
				href="./AddFlight.jsp"><i class="fa fa-home"></i>Add Flight </a></li>
			<%
			}
			%>

			<%
			if (session.getAttribute("user") != null && session.getAttribute("isLoggedIn") != null
					&& (boolean) session.getAttribute("isLoggedIn")) {
			%>


			<li class="nav-item active"><a class="nav-link"
				href="./bookings.jsp"><i class="fa fa-home"></i>Booking Report </a></li>
			<%
			} else {
			%>
			<li class="nav-item active"><a class="nav-link" href="#">Hi,guest</a>
			</li>
			<%
			}
			%>
		</ul>
		<form class="form-inline my-2 my-lg-0">

			<%
			if (session.getAttribute("user") != null && (boolean) session.getAttribute("isLoggedIn")) {
				User user = (User) session.getAttribute("user");
			%>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary mr-3"
				data-toggle="modal" data-target="#exampleModal"><%=user.getFirstName()%></button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body mx-auto">
						 <i class="fa fa-user fa-4x ml-5"></i>
							<table>
								
								
								
								<tr>
									<th>First Name12:</th>
									<td><%=user.getFirstName()%></td>
								</tr>
								<tr>
									<th>Last Name:</th>
									<td><%=user.getLastName()%></td>
								</tr>
								<tr>
									<th>Email:</th>
									<td><%=user.getEmail()%></td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>
					</div>
				</div>
			</div>
			<a href='./UserLogoutServlet' class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-key"></i>Logout</a>
			<%
			} else {
			%>
			<a href='./login.jsp' class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-key"></i>Login</a> <a
				href='./register.jsp' class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-user-plus"></i>Register</a>

			<%
			}
			%>
		</form>
	</div>
</nav>