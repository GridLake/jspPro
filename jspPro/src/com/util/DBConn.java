package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {

	private static Connection connection = null;
		
	private DBConn() {} ;
	
	public static  Connection getConnection() {
		
		if (connection == null ) {
			String className ="oracle.jdbc.driver.OracleDriver";
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="scott";
			String password="tiger";
			
			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password) ;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// if
		return connection;
	} // getConnection
	
	public static  Connection getConnection
		(String className, String url, String user ,String password) {
		if (connection == null ) {
			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password) ;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// if
		return connection;
	} // getConnection

	public static void close() {
	
		if (connection!=null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			connection = null; 
		} // if
	} // close
} // class