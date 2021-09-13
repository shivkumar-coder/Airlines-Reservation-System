package com.airlines.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.airlines.beans.AllObjects;
import com.airlines.beans.Booking;
import com.airlines.dao.BookingDAO;
import com.airlines.dao.BookingDAOImpl;
import com.mysql.cj.Session;

/**
 * Servlet implementation class TicketBookingServlet
 */
@WebServlet("/TicketBookingServlet")
public class TicketBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TicketBookingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int fid=Integer.parseInt(request.getParameter("fid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		String email=request.getParameter("email");
		String mobile_number=request.getParameter("mobile_number");
		int number_of_persons=Integer.parseInt(request.getParameter("number_of_persons"));
		String book_date=request.getParameter("book_date");
		String address=request.getParameter("address");
		Booking booking =new Booking();
		booking.setFid(fid);
		booking.setUid(uid);
		booking.setEmail(email);
		booking.setMobile_number(mobile_number);
		booking.setNumber_of_persons(number_of_persons);
		booking.setBook_date(book_date);
        booking.setAddress(address);
        BookingDAO bookingDAO=new BookingDAOImpl();
        boolean isBooked=bookingDAO.addBooking(booking);
        HttpSession session=request.getSession();
        if(isBooked) {
        	session.setAttribute("booking",booking);
        	AllObjects allObjects=bookingDAO.getReciept(booking);
        	session.setAttribute("allObjects", allObjects);
        	response.sendRedirect("payment.jsp");
        	System.out.println("booking success");
        }else {
        	System.out.println("booking failed");
        }
	}

}
