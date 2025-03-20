<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.dao.EmployeeDAO" %>
<%@ page import="com.example.model.Employee" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>HR Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
            position: fixed;
            left: 0;
        }
        .sidebar-sticky {
            position: relative;
            top: 0;
            height: calc(100vh - 48px);
            padding-top: .5rem;
            overflow-x: hidden;
            overflow-y: auto;
        }
        .nav-link {
            color: #fff;
            margin-bottom: 10px;
        }
        .nav-link:hover {
            color: #007bff;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        .profile-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-2 d-none d-md-block sidebar">
                <div class="sidebar-sticky">
                    <div class="text-center mb-4">
                        <img src="1.jpeg" class="rounded-circle" alt="Profile Picture" style="width: 100px; height: 100px;">
                        <h6 class="text-white mt-2">Welcome, <%= session.getAttribute("username") %></h6>
                    </div>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#"><i class="fas fa-tachometer-alt mr-2"></i> HR Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-users mr-2"></i> Employees</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-cog mr-2"></i> Settings</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt mr-2"></i> Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main content -->
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 main-content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">HR Dashboard</h1>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addEmployeeModal">
                        <i class="fas fa-plus"></i> Add Employee
                    </button>
                </div>

                <!-- Employee Table -->
                <div class="table-container">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Department</th>
                                <th>Role</th>
                                <th>Salary</th>
                                <th>Hire Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                EmployeeDAO dao = new EmployeeDAO();
                                List<Employee> employees = dao.getAllEmployees();
                                for(Employee emp : employees) {
                            %>
                            <tr>
                                <td><%= emp.getId() %></td>
                                <td><%= emp.getName() %></td>
                                <td><%= emp.getEmail() %></td>
                                <td><%= emp.getDepartment() %></td>
                                <td><%= emp.getRole() %></td>
                                <td>$<%= emp.getSalary() %></td>
                                <td><%= emp.getHire_date() %></td>
                                <td>
                                    <button class="btn btn-sm btn-primary" onclick="editEmployee(<%= emp.getId() %>)">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteEmployee(<%= emp.getId() %>)">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>

    <!-- Add Employee Modal -->
    <div class="modal fade" id="addEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addEmployeeModalLabel">Add New Employee</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="AddEmployeeServlet" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>
                        <div class="form-group">
                            <label>Department</label>
                            <input type="text" class="form-control" name="department" required>
                        </div>
                        <div class="form-group">
                            <label>Role</label>
                            <input type="text" class="form-control" name="role" required>
                        </div>
                        <div class="form-group">
                            <label>Salary</label>
                            <input type="number" class="form-control" name="salary" required>
                        </div>
                        <div class="form-group">
                            <label>Hire Date</label>
                            <input type="date" class="form-control" name="hire_date" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Employee</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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