package com.airlines.service;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.airlines.beans.Flight;
import com.airlines.dao.FlightDAO;
import com.airlines.dao.FlightDAOImpl;



/**
 * Servlet implementation class EditFlightServlet
 */
@WebServlet("/EditFlightServlet")
public class EditFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditFlightServlet() {
		super();
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Flight flight=new Flight();
		int fid=Integer.parseInt(request.getParameter("fid"));
		String flight_name=request.getParameter("flight_name");
		String source=request.getParameter("source");
		String destination=request.getParameter("destination");
		String flight_date=request.getParameter("flight_date");
		String flight_time=request.getParameter("flight_time");
		float ticket_price=Float.parseFloat(request.getParameter("ticket_price"));
		String airport=request.getParameter("airport");	
	    int travel_duration=Integer.parseInt(request.getParameter("travel_duration"));
		String description=request.getParameter("description");
		flight.setFid(fid);
		flight.setFlight_name(flight_name);
	    flight.setSource(source);
	    flight.setDestination(destination);
	    flight.setFlightDate(flight_date);
	    flight.setFlightTime(flight_time);
	    flight.setTravelDuration(travel_duration);
	    flight.setTicketPrice(ticket_price);
	    flight.setAirport(airport);
	    flight.setDescription(description);
	    FlightDAO flightDAO=new FlightDAOImpl();
	    boolean isFlightUpdated=flightDAO.editFlight(flight);
	    HttpSession session=request.getSession();
	    if(isFlightUpdated) {
	    	session.setAttribute("isFlightUpdated",true);
	    }
	    response.sendRedirect("Flightlist.jsp");
	}

}
