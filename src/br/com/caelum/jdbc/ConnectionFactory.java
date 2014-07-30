package br.com.caelum.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory { 

	public Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			System.out.println("problemas na execucao do Class.forName");
			e1.printStackTrace();
		}
				
		try {
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/fj21","root","1234");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
