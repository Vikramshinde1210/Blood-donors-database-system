package myweb;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class insertValues {

	public void insert(String nm ,String blood,String country,String state,String city,String date,String mob,String user,String pass) {
		db d=new db();
		Connection con=d.getConnection();
		PreparedStatement ps=null;
		try
		{
		String query="insert into donor values(?,?,?,?,?,?,?,?,?)";
		ps=con.prepareStatement(query);
		ps.setString(1, nm);
		ps.setString(2, blood);
		ps.setString(3, country);
		ps.setString(4, state);
		ps.setString(5, city);
		ps.setString(6, date);
		ps.setString(7, mob);
		ps.setString(8, user);
		ps.setString(9, pass);
		
        ps.executeUpdate();
		}
		catch(Exception e)
		{
		System.out.println(e);	
		}
		
		
		
	}
}
