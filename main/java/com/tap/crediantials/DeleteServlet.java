package com.tap.crediantials;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class DeleteServlet extends HttpServlet {
    private static final String DELETE_EMP = "DELETE FROM `data` WHERE `email`=?";
	private Connection con;
    
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
    	HttpSession session = req.getSession();
    	String email = (String) session.getAttribute("email");


        try {
           
            PreparedStatement pstmt = con.prepareStatement(DELETE_EMP);
            pstmt.setString(1, email);

            int rowsAffected = pstmt.executeUpdate();

            resp.setContentType("text/html");
            PrintWriter pw = resp.getWriter();

            if (rowsAffected > 0) {
                pw.println("<html><body style='background-color: #f0f8ff; text-align: center;'>");
                pw.println("<h1 style='color: green;'>Record Deleted Successfully</h1>");
                pw.println("<a href='login.html'><button style='padding: 10px 20px; border: none; background-color: #4caf50; color: white; cursor: pointer;'>Back to Login</button></a>");
                pw.println("</body></html>");
            } else {
                pw.println("<html><body style='background-color: #f0f8ff; text-align: center;'>");
                pw.println("<h1 style='color: red;'>Failed to Delete Record</h1>");
                pw.println("<a href='login.html'><button style='padding: 10px 20px; border: none; background-color: #4caf50; color: white; cursor: pointer;'>Back to Login</button></a>");
                pw.println("</body></html>");
            }

           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
