package com.example.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.util.DBUtil;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roleParam = request.getParameter("role");

        try {
            int roleId = Integer.parseInt(roleParam);

            try (Connection conn = DBUtil.getConnection()) {
                String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND role_id = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                pstmt.setInt(3, roleId);

                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    // Create a session and set user attributes
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("userId", rs.getInt("id"));
                    session.setAttribute("roleId", roleId);

                    // Also add email to session if needed
                    session.setAttribute("email", rs.getString("email"));

                    // Set login time in UTC
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                    session.setAttribute("loginTime", sdf.format(new Date()));

                    // Redirect based on role
                    if (roleId == 1) { // Admin
                        response.sendRedirect("Admindashboard.jsp");
                    } else { // User (HR)
                        response.sendRedirect("hr-dashboard.jsp");
                    }
                } else {
                    // Invalid credentials
                    request.setAttribute("error", "Invalid username or password for the selected role");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid role selection");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}