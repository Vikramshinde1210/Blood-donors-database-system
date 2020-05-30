package myweb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import myweb.db;

public class edit1 {
	public User_Bean get_values_of_user(String user,String pass)
	{
		db d=new db();
		Connection con=d.getConnection();
		
		PreparedStatement ps=null;
		ResultSet rs =null;
		User_Bean u1=new User_Bean();
	    try {
	    	String query="select * from donor where user=? and pass=?";
	    	
			ps=con.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			rs=ps.executeQuery();
			while (rs.next()) {
				
	                  u1.setName(rs.getString("name"));
	                  u1.setBlood(rs.getString("blood"));
	                  u1.setState(rs.getString("state"));
	                  u1.setCountry(rs.getString("country"));
	                  u1.setCity(rs.getString("city"));
	                  u1.setDonation(rs.getString("donation"));
	                  u1.setMob(rs.getString("mob"));
	                  u1.setUser(rs.getString("user"));
	                  u1.setPassword(rs.getString("pass"));
	                  
	                  
	                  
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return u1;
	}

	public void edit_user(User_Bean obj)
	{
		db d=new db();
		Connection con=d.getConnection();
		
		PreparedStatement ps=null;

	    try {
	    	String query="update donor set name=? where user=?";
	    	
			ps=con.prepareStatement(query);
			ps.setString(1, obj.getName());
			ps.setString(2, obj.getUser());
			ps.executeUpdate();
			
				
			
		} 
	catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	  
	}



}
