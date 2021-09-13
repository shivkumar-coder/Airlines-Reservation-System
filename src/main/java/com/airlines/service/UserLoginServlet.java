package com.airlines.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.airlines.beans.User;
import com.airlines.dao.UsersDAO;
import com.airlines.dao.UsersDAOImpl;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UsersDAO userDAO = new UsersDAOImpl();
		User user = userDAO.getUser(email, password);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		if (user != null) {
			if (email.equals("Admin@airlines.com") && password.equals("admin@123")) {
				session.setAttribute("isAdmin", true);
			} else {
				session.setAttribute("isAdmin", false);
			}
			session.setAttribute("isLoggedIn", true);
			
			if (request.getParameter("fid") == null)
				response.sendRedirect("./UserHome.jsp");
			else {
				User user2=userDAO.getUser(email, password);
				response.sendRedirect("./bookFlight.jsp?fid="+request.getParameter("fid")+"&uid="+user2.getUid());
			}
			

		} else {
			session.setAttribute("isLoggedIn", false);
			if (request.getParameter("fid") == null)
				response.sendRedirect("./login.jsp");
			else
				response.sendRedirect("./login.jsp?fid="+request.getParameter("fid"));
			
		}

	}

}
