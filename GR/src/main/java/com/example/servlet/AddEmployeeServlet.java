package com.example.servlet;

import com.example.dao.EmployeeDAO;
import com.example.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO = new EmployeeDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String department = request.getParameter("department");
            String role = request.getParameter("role");
            double salary = Double.parseDouble(request.getParameter("salary"));
            String hireDate = request.getParameter("hire_date");

            Employee employee = new Employee();
            employee.setName(name);
            employee.setEmail(email);
            employee.setDepartment(department);
            employee.setRole(role);
            employee.setSalary(salary);
            employee.setHire_date(hireDate);

            if (employeeDAO.addEmployee(employee)) {
                response.sendRedirect("hr-dashboard.jsp?success=added");
            } else {
                response.sendRedirect("hr-dashboard.jsp?error=add");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Admindashboard.jsp?error=add");
        }
    }
}