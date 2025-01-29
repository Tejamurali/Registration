package com.tap.crediantials;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Project_1 extends HttpServlet {
    private static final String SQL1 = "SELECT * FROM `data` WHERE `email`=? AND `password`=?";
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet res;
    
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        
        try (PrintWriter pw = resp.getWriter()) {
           
        	
            pstmt = con.prepareStatement(SQL1);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            res = pstmt.executeQuery();

            if (res.next()) {
            	 req.setAttribute("name", res.getString("name"));
                 req.setAttribute("age", res.getInt("age"));
                 req.setAttribute("email", res.getString("email"));
                 req.setAttribute("password", res.getString("password"));
                 req.setAttribute("mobile", res.getLong("mobile_number"));
                 req.setAttribute("address", res.getString("Address"));

                 RequestDispatcher rd = req.getRequestDispatcher("/update.jsp");
                 rd.forward(req, resp);
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("/login.html");
                rd.include(req, resp);
                pw.println("<html><body><h1 style='color:red;'>Invalid Email or Password</h1></body></html>");
            }
        } catch (  SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (res != null) res.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
