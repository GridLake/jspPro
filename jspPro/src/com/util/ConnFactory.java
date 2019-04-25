package com.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnFactory {

	private static int maxconn = 0;
	private static String url = null;
	private static String driver = null;
	private static String user = null;
	private static String password = null;
	private static ConnFactory connFactory = new ConnFactory();

	static{
		try {
			loadProperties("jdbc.properties");
		} catch(IOException e) {
			System.out.println("jdbc.properties.....");
			e.printStackTrace();
		}
	}

	private ConnFactory() {};

	public static ConnFactory getDefaultFactory() {

		if(connFactory == null) {
			connFactory = new ConnFactory();
		}
		
		return connFactory;
	}

	public Connection createConnection() throws SQLException, ClassNotFoundException { 

		Class.forName(driver); 
		Connection conn = DriverManager.getConnection(url, user,password); 
		return conn;
	}

	public static void loadProperties(String filename) throws IOException {

		Properties p = new Properties();
		FileInputStream in = new FileInputStream(filename);
		p.load(in);
		in.close();
		url = p.getProperty("URL");
		password = p.getProperty("Password");
		driver = p.getProperty("Driver");
		user = p.getProperty("User");
		maxconn = Integer.parseInt(p.getProperty("MaxConn"));
	}

	public static int getMaxConn() {
		return maxconn;
	}

}
