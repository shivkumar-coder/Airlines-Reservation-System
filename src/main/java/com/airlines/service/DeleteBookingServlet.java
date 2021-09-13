package com.airlines.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.airlines.dao.BookingDAO;
import com.airlines.dao.BookingDAOImpl;

/**
 * Servlet implementation class DeleteBookingServlet
 */
@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookingDAO bookingDAO=new BookingDAOImpl();
		bookingDAO.removeBooking(Integer.parseInt(request.getParameter("bid")));
		
		HttpSession session=request.getSession();
		session.setAttribute("isBookingDeleted",true);
		response.sendRedirect("bookings.jsp");
	}

}
