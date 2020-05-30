package myweb;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class tp {
	
	public void edit(User_Bean obj)
	{
	try
	{
	String nm=obj.getName();
	String user=obj.getUser();
	db d=new db();
	Connection con=d.getConnection();
	String query="update donor set name=?,country=?,state=?,city=?,donation=?,mob=? where user=? and pass=?";
	PreparedStatement ps=con.prepareStatement(query);
	ps.setString(1,nm);
	ps.setString(2, obj.getCountry());
	ps.setString(3, obj.getState());
	ps.setString(4, obj.getCity());
	ps.setString(5, obj.getDonation());
	ps.setString(6, obj.getMob());
	ps.setString(7,user);
	ps.setString(8, obj.getPassword());
	ps.executeUpdate();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	}
}
