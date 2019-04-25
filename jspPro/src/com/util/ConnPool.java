package com.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Vector;

// 커넥션 풀 : 미리 커넥션 객체를 풀에 생성해서 빌려주고 받고... 재사용
public class ConnPool {

	// 1. 컬렉션 객체 생성(MaxConn 개수만큼 미리 생성해서 담아두겠다)
	private Vector<Connection> buffer = new Vector<>();
	// 2. static 생성
	private static ConnPool connPool = new ConnPool();
	
	static {
		try {
			initConnPool();
		} catch (ClassNotFoundException e) {
			System.out.println("---Connection Create Error---");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("---Driver Class Not Found Error---");
			e.printStackTrace();
		}
	}
	
	// 3. 생성자 private - 하나만 쓰겠다(Singleton)
	private ConnPool() {}

	public static void initConnPool() throws ClassNotFoundException, SQLException {
		
		// 이미 생성된 풀 또는 남아있는 풀 제거
		destroyConnPool();
		
		//			  buffer를 non-static으로 선언했으므로 this.buffer를 못쓰지만, this.buffer로 만들어도 됨
		Vector temp = ConnPool.getConnPool().getConnPoolBuffer();
		ConnFactory factory = ConnFactory.getDefaultFactory();
		
		for (int i = 0; i < factory.getMaxConn(); i++) {
			Connection conn = factory.createConnection();
			temp.addElement(conn);
			System.out.println("ConnPool Add : New Connection Created.." + conn);
		}
	}
	
	public synchronized static void destroyConnPool() {
		
		Vector temp = ConnPool.getConnPool().getConnPoolBuffer();
		Enumeration en = temp.elements();
		
		while (en.hasMoreElements()) {
			Connection conn = (Connection) en.nextElement();
			if(conn != null) {
				try {
					conn.close();
					System.out.println("Connection Closed.." + conn);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
	}
	
	// Singleton
	public static ConnPool getConnPool() {
		
		if(connPool == null) {
			connPool = new ConnPool();
		}
		// Singleton으로 풀 객체 가져옴
		return connPool;
	}
	
	// 동기화 처리를 하는 이유?
	public synchronized Connection getConnection() throws InterruptedException {
		
		while (buffer.size() == 0) {
			this.wait();
		}
		Connection conn = (Connection) this.buffer.remove(buffer.size() -1);
		System.out.println("Connection 대여 getConnection()" + conn);
		return conn;
	}
	
	public synchronized void releaseConnection(Connection conn) {
		
		this.buffer.addElement(conn);
		System.out.println("Connection 반환 releaseConnection()" + conn);
		this.notifyAll();
	}
	
	private Vector getConnPoolBuffer() {
		
		return this.buffer;
	}
}
