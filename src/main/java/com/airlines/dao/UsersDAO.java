package com.airlines.dao;

import java.sql.ResultSet;

import com.airlines.beans.User;

public interface UsersDAO {
	public boolean addUser(User user);
	public User getUser(String email,String password);
	public void removeUser(String loginID);

}
