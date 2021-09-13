package com.airlines.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.airlines.beans.Flight;
import com.airlines.dao.FlightDAO;
import com.airlines.dao.FlightDAOImpl;

/**
 * Servlet implementation class FlightRegistrationServlet
 */
@WebServlet("/FlightRegistrationServlet")
public class FlightRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FlightRegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flight_name = request.getParameter("flight_name");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		int travel_duration = Integer.parseInt(request.getParameter("travel_duration"));
		String airport = request.getParameter("airport");
		float ticket_price = Float.parseFloat(request.getParameter("ticket_price"));
		String description = request.getParameter("description");
		Flight flight = new Flight();
		flight.setFlight_name(flight_name);
		flight.setSource(source);
		flight.setDestination(destination);
		flight.setFlightDate(date);
		flight.setFlightTime(time);
		flight.setTravelDuration(travel_duration);
		flight.setAirport(airport);
		flight.setTicketPrice(ticket_price);
		flight.setDescription(description);
		
		FlightDAO flightDAO = new FlightDAOImpl();
		boolean flightAdded = flightDAO.addFlight(flight);
		if(flightAdded) {
			response.sendRedirect("./Flightlist.jsp?added=true");
		}
	}

}
