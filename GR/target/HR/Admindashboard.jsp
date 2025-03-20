<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.dao.EmployeeDAO" %>
<%@ page import="com.example.dao.DepartmentDAO" %>
<%@ page import="com.example.dao.UserDAO" %>
<%@ page import="com.example.model.Employee" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR System - Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/Admindashboard.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 col-lg-2 px-0 sidebar">
                <div class="d-flex flex-column align-items-center align-items-sm-start pt-2 text-white min-vh-100">
                    <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                        <span class="fs-5 d-none d-sm-inline">HR System</span>
                    </a>
                    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start w-100" id="menu">
                        <li class="nav-item w-100">
                            <a href="#" class="active">
                                <i class="fa fa-tachometer-alt me-2"></i> <span class="d-none d-sm-inline">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item w-100">
                            <a href="employees">
                                <i class="fa fa-users me-2"></i> <span class="d-none d-sm-inline">Employees</span>
                            </a>
                        </li>
                        <li class="nav-item w-100">
                            <a href="#" class="align-middle">
                                <i class="fa fa-building me-2"></i> <span class="d-none d-sm-inline">Departments</span>
                            </a>
                        </li>
                        <li class="nav-item w-100">
                            <a href="#" class="align-middle">
                                <i class="fa fa-chart-bar me-2"></i> <span class="d-none d-sm-inline">Reports</span>
                            </a>
                        </li>
                        <li class="nav-item w-100">
                            <a href="#" class="align-middle">
                                <i class="fa fa-user-shield me-2"></i> <span class="d-none d-sm-inline">Users</span>
                            </a>
                        </li>
                        <li class="nav-item w-100">
                            <a href="#" class="align-middle">
                                <i class="fa fa-cog me-2"></i> <span class="d-none d-sm-inline">Settings</span>
                            </a>
                        </li>
                    </ul>
                    <hr>
                    <div class="dropdown pb-4">
                        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://via.placeholder.com/50" alt="profile" width="30" height="30" class="rounded-circle">
                            <span class="d-none d-sm-inline mx-1">Admin</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                            <li><a class="dropdown-item" href="#">Profile</a></li>
                            <li><a class="dropdown-item" href="#">Settings</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="logout">Sign out</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 col-lg-10 p-4">
                <h2>Admin Dashboard</h2>
                <p>Welcome to the HR System Admin Dashboard</p>

                <!-- Statistics Cards -->
                <div class="row mt-4">
                    <!-- Employees Card -->
                    <div class="col-xl-3 col-md-6">
                        <div class="card stats-card employees">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h5 class="card-title">Total Employees</h5>
                                        <%
                                            EmployeeDAO empDAO = new EmployeeDAO();
                                            int employeeCount = empDAO.getEmployeeCount();
                                        %>
                                        <h2><%= employeeCount %></h2>
                                    </div>
                                    <div>
                                        <i class="fa fa-users fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- New Hires Card -->
                    <div class="col-xl-3 col-md-6">
                        <div class="card stats-card new-hires">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h5 class="card-title">New Hires</h5>
                                        <%
                                            // Assuming you have a method to get the count of new hires (e.g., hired in the last 30 days)
                                            int newHires = empDAO.getNewHiresCount(30);
                                        %>
                                        <h2><%= newHires %></h2>
                                    </div>
                                    <div>
                                        <i class="fa fa-user-plus fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Employee Management -->
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Employee Management</h5>
                                <button type="button" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#addEmployeeModal">
                                    <i class="fa fa-plus me-1"></i> Add Employee
                                </button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Department</th>
                                                <th>Role</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Employee> employees = empDAO.getAllEmployees();
                                                for(Employee employee : employees) {
                                            %>
                                            <tr>
                                                <td><%= employee.getId() %></td>
                                                <td><%= employee.getName() %></td>
                                                <td><%= employee.getEmail() %></td>
                                                <td><%= employee.getDepartment() %></td>
                                                <td><%= employee.getRole() %></td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary" onclick="editEmployee(<%= employee.getId() %>)">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-danger" onclick="deleteEmployee(<%= employee.getId() %>)">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Employee Modal -->
    <div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="addEmployeeModalLabel">Add New Employee</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="AddEmployeeServlet" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="department" class="form-label">Department</label>
                                <input type="text" class="form-control" id="department" name="department" required>
                            </div>
                            <div class="col-md-6">
                                <label for="role" class="form-label">Role</label>
                                <input type="text" class="form-control" id="role" name="role" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="salary" class="form-label">Salary</label>
                                <input type="number" step="0.01" class="form-control" id="salary" name="salary" required>
                            </div>
                            <div class="col-md-6">
                                <label for="hire_date" class="form-label">Hire Date</label>
                                <input type="date" class="form-control" id="hire_date" name="hire_date" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Add Employee</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Employee Modals -->
    <% for(Employee employee : employees) { %>
    <div class="modal fade" id="editEmployeeModal<%= employee.getId() %>" tabindex="-1" aria-labelledby="editEmployeeModalLabel<%= employee.getId() %>" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="editEmployeeModalLabel<%= employee.getId() %>">Edit Employee</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="EmployeeServlet" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="<%= employee.getId() %>">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="edit_name<%= employee.getId() %>" class="form-label">Name</label>
                                <input type="text" class="form-control" id="edit_name<%= employee.getId() %>" name="name" value="<%= employee.getName() %>" required>
                            </div>
                            <div class="col-md-6">
                                <label for="edit_email<%= employee.getId() %>" class="form-label">Email</label>
                                <input type="email" class="form-control" id="edit_email<%= employee.getId() %>" name="email" value="<%= employee.getEmail() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="edit_department<%= employee.getId() %>" class="form-label">Department</label>
                                <input type="text" class="form-control" id="edit_department<%= employee.getId() %>" name="department" value="<%= employee.getDepartment() %>" required>
                            </div>
                            <div class="col-md-6">
                                <label for="edit_role<%= employee.getId() %>" class="form-label">Role</label>
                                <input type="text" class="form-control" id="edit_role<%= employee.getId() %>" name="role" value="<%= employee.getRole() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="edit_salary<%= employee.getId() %>" class="form-label">Salary</label>
                                <input type="number" step="0.01" class="form-control" id="edit_salary<%= employee.getId() %>" name="salary" value="<%= employee.getSalary() %>" required>
                            </div>
                            <div class="col-md-6">
                                <label for="edit_hire_date<%= employee.getId() %>" class="form-label">Hire Date</label>
                                <input type="date" class="form-control" id="edit_hire_date<%= employee.getId() %>" name="hire_date" value="<%= employee.getHireDate() %>" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Update Employee</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <% } %>

    <!-- Delete Employee Modals -->
    <% for(Employee employee : employees) { %>
    <div class="modal fade" id="deleteEmployeeModal<%= employee.getId() %>" tabindex="-1" aria-labelledby="deleteEmployeeModalLabel<%= employee.getId() %>" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="deleteEmployeeModalLabel<%= employee.getId() %>">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete employee: <strong><%= employee.getName() %></strong>?</p>
                    <p class="text-danger"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <form action="EmployeeServlet" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= employee.getId() %>">
                        <button type="submit" class="btn btn-danger">Delete Employee</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <% } %>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function editEmployee(id) {
            // Implement edit functionality
            window.location.href = 'EditEmployeeServlet?id=' + id;
        }

        function deleteEmployee(id) {
            if(confirm('Are you sure you want to delete this employee?')) {
                window.location.href = 'DeleteEmployeeServlet?id=' + id;
            }
        }
    </script>
</body>
</html>