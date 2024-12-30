package com.js.pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(urlPatterns ="/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final String DELETE_SQL = "DELETE FROM `data` WHERE `email`=?";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/httpdb", "root", "Teja@1250");
            PreparedStatement pstmt = con.prepareStatement(DELETE_SQL);
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

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
