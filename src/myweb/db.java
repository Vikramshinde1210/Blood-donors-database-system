package myweb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

	public class db {
		public Connection getConnection()
		{
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://javapb.mysql.database.azure.com:3306/java?useSSL=true&requireSSL=false&serverTimezone=UTC","vicky@javapb","java@1210");
			return con;
			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace();
				return null;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
				return null;
			}
		}

	}

