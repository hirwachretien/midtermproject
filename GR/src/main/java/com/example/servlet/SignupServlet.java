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

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // "1" for admin, "2" for user

        try (Connection conn = DBUtil.getConnection()) {
            // Check if username already exists
            String checkUser = "SELECT * FROM users WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkUser);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("error", "Username already exists!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            }

            // Check if email already exists
            String checkEmail = "SELECT * FROM users WHERE email = ?";
            checkStmt = conn.prepareStatement(checkEmail);
            checkStmt.setString(1, email);
            rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("error", "Email already exists!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            }

            // Insert new user
            String sql = "INSERT INTO users (username, email, password, role_id) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            int roleId = Integer.parseInt(role);
            pstmt.setInt(4, roleId);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                // Registration successful
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "Failed to register user!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}