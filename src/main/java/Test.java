import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;
import java.text.*;

import com.airlines.beans.*;
import com.airlines.dao.FlightDAO;
import com.airlines.dao.FlightDAOImpl;
import com.airlines.dao.UsersDAO;
import com.airlines.dao.UsersDAOImpl;
public class Test {

	public static void main(String[] args) throws SQLException, ParseException {
		 Flight f=new Flight();
		 f.setFlight_name("Indian Airlines");
		 f.setSource("Hyd");
		 f.setDestination("Mum");
		 f.setFlightDate("12-01-1999");
		 f.setFlightTime("01:30:12");
		 f.setAirport("Tribhuvan");
		 f.setTicketPrice(1890);
		 f.setDescription("No hijacking");
		 FlightDAO fdao=new FlightDAOImpl();
		 fdao.addFlight(f);
	}

}
