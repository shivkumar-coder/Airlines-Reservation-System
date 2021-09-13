package com.airlines.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.airlines.beans.AllObjects;
import com.airlines.beans.Booking;

public class BookingDAOImpl implements BookingDAO {
	static Connection con;
	static {
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shiv", "root", "root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean addBooking(Booking booking) {
		try {
			PreparedStatement pst = con.prepareStatement(
					"insert into booking(fid,uid,mobile_number,book_date,email,number_of_persons,address) values(?,?,?,?,?,?,?)");
			pst.setInt(1, booking.getFid());
			pst.setInt(2, booking.getUid());
			pst.setString(3, booking.getMobile_number());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date udate = sdf.parse(booking.getBook_date());
			System.out.println(booking.getBook_date() + " hey");
			long l = udate.getTime();
			java.sql.Date sdate = new java.sql.Date(l);
			pst.setDate(4, sdate);
			pst.setString(5, booking.getEmail());
			pst.setInt(6, booking.getNumber_of_persons());
			pst.setString(7, booking.getAddress());
			int i = pst.executeUpdate();

			if (i != 1) {

				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		return true;
	}

	@Override
	public boolean removeBooking(int bid) {
		try {
			PreparedStatement pst=con.prepareStatement("delete from booking where bid=?");
			pst.setInt(1, bid);
			int i=pst.executeUpdate();
			if(i==1)
				return true;
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		return false;
		
	}

	@Override
	public List<Booking> getAllBookings(int uid) {
		List <Booking>list=new ArrayList<Booking>();
		try{
			
			PreparedStatement pst=null;
			if(uid==-1) {
				pst=con.prepareStatement("select * from booking");
			}
			else {
				pst=con.prepareStatement("select * from booking where uid=?");
				pst.setInt(1, uid);
			}
			ResultSet res=pst.executeQuery();
			while(res.next()) {
				Booking booking=new Booking();
				booking.setBid(res.getInt(1));
				booking.setFid(res.getInt(2));
				booking.setUid(res.getInt(3));
				booking.setMobile_number(res.getString(4));
				java.sql.Date sdate=res.getDate(5);
				SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
				booking.setBook_date(sdf.format(sdate));
				booking.setEmail(res.getString(6));
				booking.setNumber_of_persons(res.getInt(7));
				booking.setAddress(res.getString(8));
				list.add(booking);
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override

	public AllObjects getReciept(Booking booking) {
		AllObjects allObjects = new AllObjects();
		try {
			Statement st = con.createStatement();
			ResultSet res = st.executeQuery(
					"select b.fid,flight_name,source,destination,f.flight_date,f.flight_time,f.airport,f.ticket_price,u.firstName,u.lastName,b.email,b.mobile_number,b.book_date,b.number_of_persons,b.address from users u ,flight f,booking b  where b.bid=(select max(bid) from	 booking ) and u.uid="+booking.getUid()+" and f.fid="+booking.getFid());
			if (res.next()) {
				allObjects.setFid(res.getInt(1));
				allObjects.setFlight_name(res.getString(2));
				allObjects.setSource(res.getString(3));
				allObjects.setDestination(res.getString(4));
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				allObjects.setFlightDate(sdf.format(res.getDate(5)));
				sdf = new SimpleDateFormat("hh:mm");
				allObjects.setFlightTime(sdf.format(res.getTime(6)));
				allObjects.setAirport(res.getString(7));
				allObjects.setTicketPrice(res.getFloat(8));
				allObjects.setFirstName(res.getString(9));
				allObjects.setLastName(res.getString(10));
				allObjects.setEmail(res.getString(11));
				allObjects.setMobile_number(res.getString(12));
				sdf = new SimpleDateFormat("dd-MM-yyyy");
				allObjects.setBook_date(sdf.format(res.getDate(13)));
				allObjects.setNumber_of_persons(res.getInt(14));
				allObjects.setAddress(res.getString(15));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;

		}
		return allObjects;

	}

}
