package com.js.pro;

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

@SuppressWarnings("serial")
public class Insert_Servlet extends HttpServlet{
	private Connection con;
	private PreparedStatement pstmt;
	private static String SQL="insert into data values(?,?,?,?,?,?)";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		int age = Integer.parseInt(req.getParameter("age"));
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");

		try {	
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/httpdb", "root", "Teja@1250");
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setInt(2,age);
			pstmt.setString(3, email);
			pstmt.setString(4, password);
			pstmt.setLong(5, mobile);
			pstmt.setString(6, address);

			pstmt.executeUpdate();
			PrintWriter pw1 = resp.getWriter();
			pw1.println("Your responce was recorded");


		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
