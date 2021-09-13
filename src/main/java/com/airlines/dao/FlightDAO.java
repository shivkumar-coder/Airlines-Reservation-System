package com.airlines.dao;
import java.util.List;

import com.airlines.beans.Flight;
public interface FlightDAO {
	public boolean addFlight(Flight flight);
	public void removeFlight(int fid);
	public List<Flight> getFlightList(String source,String destination) throws Exception;
	public boolean editFlight(Flight flight);
	
	
}
