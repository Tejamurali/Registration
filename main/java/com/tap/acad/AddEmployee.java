package com.tap.acad;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.conf.DatabaseUrlContainer;

@WebServlet(urlPatterns = "/AddEmployee")
@SuppressWarnings("serial")
public class AddEmployee extends HttpServlet{
	
	private final String INSERT="INSERT INTO `data`(`name`,`age`,`email`,`password`,`mobile_number`,`Address`) VALUES(?,?,?,?,?,?)";
	private Connection con;
	private PreparedStatement pstmt;

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
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			 pstmt = con.prepareStatement(INSERT);
			 
			 pstmt.setString(1, req.getParameter("name"));
			 pstmt.setInt(2, Integer.parseInt(req.getParameter("age")));
			 pstmt.setString(3, req.getParameter("email"));
			 pstmt.setString(4, req.getParameter("password"));
			 pstmt.setLong(5, Long.parseLong(req.getParameter("number")));
			 pstmt.setString(6, req.getParameter("address"));
			 
			 int i = pstmt.executeUpdate();
			 
			 if(i>0) {
				 resp.sendRedirect("FetchAll");
			 }
			 else {
				 resp.sendRedirect("failure.jsp");
			 }
			 
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
