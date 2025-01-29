package com.tap.crediantials;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

public class Insert_Servlet extends HttpServlet{
	private Connection con;
	private PreparedStatement pstmt;
	private static String SQL="insert into `data`(`name`,`age`,`email`,`password`,`mobile_number`,`Address`) values(?,?,?,?,?,?)";
	
	@Override
	public void init() throws ServletException {
	    try {
	        Class.forName(DatabaseConfig.DRIVER_NAME);

	        con = DriverManager.getConnection(DatabaseConfig.CONNECTION_STRING, DatabaseConfig.DB_USER_NAME, DatabaseConfig.DB_PASSWORD);
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        throw new ServletException("Database connection initialization failed", e);
	    }
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		int age = Integer.parseInt(req.getParameter("age"));
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");

		try {	
			
			
			pstmt = con.prepareStatement(SQL);
			
			pstmt.setString(1, name);
			pstmt.setInt(2,age);
			pstmt.setString(3, email);
			pstmt.setString(4, password);
			pstmt.setLong(5, mobile);
			pstmt.setString(6, address);

			int i = pstmt.executeUpdate();
			
			if(i>0) {
				resp.sendRedirect("success.jsp");
			}
			
			else {
				resp.sendRedirect("failure.jsp");
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
