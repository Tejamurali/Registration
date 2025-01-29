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

import com.tap.crediantials.DatabaseConfig;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/delete")
public class DeleteEmployee extends HttpServlet {
	private static final String DELETE_EMP = "DELETE FROM `data` WHERE `id`=?";
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
    		int id = Integer.parseInt(req.getParameter("id"));
    		 pstmt = con.prepareStatement(DELETE_EMP);
    		 pstmt.setInt(1, id);
    		 int i = pstmt.executeUpdate();
    		 
    		 if(i>0) {
    			 resp.sendRedirect("success.jsp");
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
