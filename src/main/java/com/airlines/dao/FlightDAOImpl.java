package com.airlines.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.airlines.beans.Flight;

public class FlightDAOImpl implements FlightDAO {
	Connection con;
	public FlightDAOImpl() {
		try {
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiv","root","root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public boolean addFlight(Flight flight) {
		try {
			PreparedStatement pst=con.prepareStatement("insert into flight(flight_name,source,destination,flight_date,flight_time,travel_duration,airport,ticket_price,description) values(?,?,?,?,?,?,?,?,?)");
			System.out.println(flight.getFlight_name()+flight.getAirport());
			pst.setString(1, flight.getFlight_name());
			pst.setString(2, flight.getSource());
			pst.setString(3,flight.getDestination());
			System.out.println("HEy");
			DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
			try {
				java.util.Date udate=dateFormat.parse(flight.getFlightDate());
				long l=udate.getTime();
				java.sql.Date sdate=new java.sql.Date(l);
				pst.setDate(4, sdate);
				dateFormat=new SimpleDateFormat("hh:mm");
				java.util.Date udate2=dateFormat.parse(flight.getFlightTime());
				long l2=udate2.getTime();
				java.sql.Time stime=new java.sql.Time(l2);
				pst.setTime(5, stime);
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pst.setInt(6,flight.getTravelDuration());
			pst.setString(7,flight.getAirport());
			
			pst.setFloat(8, flight.getTicketPrice());		
			pst.setString(9,flight.getDescription());
			int i=pst.executeUpdate();
			if(i!=1)
				 return false;
		}catch(SQLException e) {
			
			e.printStackTrace();
			return false;
		} 
		return true;
	}

	@Override
	public void removeFlight(int fid) {
		

	}

	@Override
	public List<Flight> getFlightList(String source,String destination)throws Exception {
		List<Flight >list=new ArrayList<Flight>();
		Statement statement=con.createStatement();
		ResultSet resultSet;
		if (source!=null&&destination!=null) {
			resultSet=statement.executeQuery("select * from flight where source='"+source+"' && destination='"+destination+"'");
		}
		else
		resultSet=statement.executeQuery("select * from flight");
		while(resultSet.next()) {
			Flight f=new Flight();
			f.setFid(resultSet.getInt(1));
			f.setFlight_name(resultSet.getString(2));
			f.setSource(resultSet.getString(3));
			f.setDestination(resultSet.getString(4));
			f.setFlightDate(new SimpleDateFormat("dd-MM-yyyy").format(resultSet.getDate(5)));
			f.setFlightTime(new SimpleDateFormat("hh:mm:ss").format(resultSet.getTime(6)));
			f.setTravelDuration(resultSet.getInt(7));
			f.setAirport(resultSet.getString(8));
			f.setTicketPrice(resultSet.getFloat(9));
			f.setDescription(resultSet.getString(10));
			list.add(f);
			
		}
		return list;
	}

	@Override
	public boolean editFlight(Flight flight) {
		try {
			PreparedStatement pst=con.prepareStatement("update  flight set flight_name=?,source=?,destination=?,flight_date=?,flight_time=?,travel_duration=?,airport=?,ticket_price=?,description=? where fid=?");
			System.out.println(flight.getFlight_name()+flight.getAirport());
			pst.setString(1, flight.getFlight_name());
			pst.setString(2, flight.getSource());
			pst.setString(3,flight.getDestination());
			System.out.println(flight.getFlightDate()+"good morning ");
			DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
			try {
				java.util.Date udate=dateFormat.parse(flight.getFlightDate());
				
				long l=udate.getTime();
				java.sql.Date sdate=new java.sql.Date(l);
				pst.setDate(4, sdate);
				dateFormat=new SimpleDateFormat("hh:mm");
				java.util.Date udate2=dateFormat.parse(flight.getFlightTime());
				long l2=udate2.getTime();
				java.sql.Time stime=new java.sql.Time(l2);
				pst.setTime(5, stime);
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pst.setInt(6,flight.getTravelDuration());
			pst.setString(7,flight.getAirport());
			
			pst.setFloat(8, flight.getTicketPrice());		
			pst.setString(9,flight.getDescription());
			pst.setInt(10, flight.getFid());
			int i=pst.executeUpdate();
			if(i!=1)
				 return false;
		}catch(SQLException e) {
			
			e.printStackTrace();
			return false;
		} 
		return true;
	}

}
