package com.airlines.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.airlines.beans.*;

public class UsersDAOImpl implements UsersDAO {
	Connection con;
	public UsersDAOImpl(){
		try {
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiv","root","root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
		public boolean addUser(User user) {
		try{
			PreparedStatement pst=con.prepareStatement("insert into users(firstName,lastName,email,password) values(?,?,?,?)");
			pst.setString(1,user.getFirstName());
			pst.setString(2, user.getLastName());
			pst.setString(3,user.getEmail());
			pst.setString(4, user.getPassword());
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
	public User getUser(String email,String password) {
		ResultSet res;
		User user=null;
		try {
			PreparedStatement pst=con.prepareStatement("select uid,firstName,lastName,email from users where email=? and password= ?");
			pst.setString(1, email);
			pst.setString(2, password);
			 res=pst.executeQuery();
			if(res.next()==false)
				return null;
			user=new User();
			user.setUid(res.getInt(1));
			user.setFirstName(res.getString(2));
			user.setLastName(res.getString(3));
			user.setEmail(res.getString(4));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
		return user;
	}


	public void removeUser(String loginID) {
		

	}

}
