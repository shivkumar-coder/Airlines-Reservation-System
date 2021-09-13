
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
	<div class="container-fluid mt-5 ">
		<div class="card wt-50 mx-auto">
			<div class="card-header ">Login</div>
			<div class="card-body">
				<%
				String append="";
				System.out.println("fid= "+request.getParameter("fid"));
				if(request.getParameter("fid")!=null){
					append="?fid="+request.getParameter("fid");
				}
				
				if (session.getAttribute("user") != null &&( (boolean) session.getAttribute("isLoggedIn"))) {
					User user=(User)session.getAttribute("user");
					response.sendRedirect("bookFlight.jsp?fid="+request.getParameter("fid")+"&uid="+user.getUid());
				}
				if (session.getAttribute("isLoggedIn") != null &&( (boolean) session.getAttribute("isLoggedIn") == false)) {
					session.removeAttribute("user");
				%>
				<div class="alert alert-danger" role="alert">Invalid
					Email/Password</div>
					
				<%
				}
				%>

				<form action=<%="./UserLoginServlet"+append%> method='post'>
					<div class="form-group ">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							required="required" aria-describedby="emailHelp"
							placeholder="Enter email" name='email'>
					</div>
					
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Password" name='password' required="required">
					</div>
					<div class="form-row">
						<div class="form-group col-md-1">
							<button type="submit" class="btn btn-primary">Login</button>
						</div>
						<div class="form-group col-md-1">
							<h4>or</h4>
						</div>
						<div class="form-group col-md-2">
							<a type="submit" href='./register.jsp' class="btn btn-primary">Create
								Account</a>
						</div>
						
					</div>


				</form>



			</div>
		</div>

	</div>


</body>
</html>