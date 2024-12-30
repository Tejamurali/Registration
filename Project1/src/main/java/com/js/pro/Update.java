package com.js.pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/updt")
public class Update extends HttpServlet {

	private static final String UPDATE_SQL = "Update data SET name=?, age=?, password=?, mobile_number=?, Address=? Where email=?";
	private Connection con;
	private PreparedStatement pstmt;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String email = req.getParameter("email");  
		String password = req.getParameter("password");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		String address = req.getParameter("address");

		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/httpdb", "root", "Teja@1250");
			pstmt = con.prepareStatement(UPDATE_SQL);
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, password);
			pstmt.setLong(4, mobile);
			pstmt.setString(5, address);
			pstmt.setString(6, email);

			int x = pstmt.executeUpdate();

			if (x > 0) {
				out.println("<html><body>");
				out.println("<h1 style='color:green; text-align:center; font-weight:bolder; font-size-600px; text-transform:uppercase;'>Details  updated  successfully!</h1>");
				out.println("</body></html>");
			} else {
				out.println("<html><body><h1 style='color:red; text-align:center; font-weight:bolder; font-size-600px; text-transform:uppercase;'>Failed to update details. </h1></body></html>");
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			out.println("<html><body><h1 style='color:red; text-align:center; font-weight:bolder; font-size-600px; text-transform:uppercase;'>An error occurred. </h1></body></html>");
		}
	}
}
