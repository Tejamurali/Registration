package com.tap.acad;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditEmployee
 */
@SuppressWarnings("serial")
public class EditEmployee extends HttpServlet {
	private Connection con;
	private final String FETCH_ON_ID="SELECT * FROM `data` WHERE `id`=?";
	private ResultSet res;
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
		int id = Integer.parseInt(req.getParameter("id"));

		try {
			pstmt = con.prepareStatement(FETCH_ON_ID);
			pstmt.setInt(1, id);
			res = pstmt.executeQuery();
			if(res.next()) {
				Employee emp = new Employee(res.getString("name"),res.getInt("age"),res.getString("email"),
						res.getString("password"),res.getLong("mobile_number"),res.getString("Address"));

				req.getSession().setAttribute("emp", emp);

				resp.sendRedirect("editpage.jsp");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
