package com.tap.acad;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class FetchAll extends HttpServlet {

	private Connection con;
	private final String FETCH_ALL="SELECT * FROM `DATA`";
	private Statement stmt;
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
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			stmt = con.createStatement();

			res = stmt.executeQuery(FETCH_ALL);

			List<Employee> arrayList = new ArrayList<Employee>();
			
			arrayList.clear();
			
			while(res.next()) {
				arrayList.add(new Employee(res.getInt("id"),res.getString("name"),res.getInt("age"),res.getString("email"),
						res.getString("password"),res.getLong("mobile_number"),res.getString("Address")));
				
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("arrayList", arrayList);
			
			resp.sendRedirect("displayEmployee.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
