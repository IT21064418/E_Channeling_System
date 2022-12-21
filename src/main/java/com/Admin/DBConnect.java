package com.Admin;

import java.sql.Connection;
import java.sql.DriverManager;

//creating database connection
public class DBConnect {

	private static String url = "jdbc:mysql://localhost:3306/echanneling?autoReconnect=true&useSSL=false";
	private static String userName = "root";
	private static String password = "supun123";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, userName, password);
			
		}
		catch(Exception e) {
			System.out.println("Database connection is not succesfull");
		}
		
		return con;
		
	}
	
}
