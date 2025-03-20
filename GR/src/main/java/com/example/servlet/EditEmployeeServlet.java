package com.example.servlet;

import com.example.dao.EmployeeDAO;
import com.example.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO = new EmployeeDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeDAO.getEmployeeById(id);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("edit-employee.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String department = request.getParameter("department");
            String role = request.getParameter("role");
            double salary = Double.parseDouble(request.getParameter("salary"));
            String hireDate = request.getParameter("hire_date");

            Employee employee = new Employee();
            employee.setId(id);
            employee.setName(name);
            employee.setEmail(email);
            employee.setDepartment(department);
            employee.setRole(role);
            employee.setSalary(salary);
            employee.setHire_date(hireDate);

            if (employeeDAO.updateEmployee(employee)) {
                response.sendRedirect("hr-dashboard.jsp?success=updated");
            } else {
                response.sendRedirect("hr-dashboard.jsp?error=update");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("hr-dashboard.jsp?error=update");
        }
    }
}