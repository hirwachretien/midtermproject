package com.example.servlet;

import com.example.dao.EmployeeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO = new EmployeeDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            if (employeeDAO.deleteEmployee(id)) {
                response.sendRedirect("hr-dashboard.jsp?success=deleted");
            } else {
                response.sendRedirect("hr-dashboard.jsp?error=delete");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("hr-dashboard.jsp?error=delete");
        }
    }
}