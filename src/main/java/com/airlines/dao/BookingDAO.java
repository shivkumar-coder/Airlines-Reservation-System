package com.airlines.dao;

import java.util.List;

import com.airlines.beans.AllObjects;
import com.airlines.beans.Booking;

public interface BookingDAO {
	public boolean addBooking(Booking booking);
	public boolean removeBooking(int bid);
	public List<Booking> getAllBookings(int uid);
	public AllObjects getReciept(Booking booking);
	

}
