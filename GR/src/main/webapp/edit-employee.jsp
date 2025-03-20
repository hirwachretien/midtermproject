<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.model.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .edit-form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="edit-form">
                    <h2 class="text-center mb-4">Edit Employee</h2>
                    <%
                        Employee employee = (Employee) request.getAttribute("employee");
                    %>
                    <form action="EditEmployeeServlet" method="post">
                        <input type="hidden" name="id" value="<%= employee.getId() %>">

                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" value="<%= employee.getName() %>" required>
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" value="<%= employee.getEmail() %>" required>
                        </div>

                        <div class="form-group">
                            <label>Department</label>
                            <input type="text" class="form-control" name="department" value="<%= employee.getDepartment() %>" required>
                        </div>

                        <div class="form-group">
                            <label>Role</label>
                            <input type="text" class="form-control" name="role" value="<%= employee.getRole() %>" required>
                        </div>

                        <div class="form-group">
                            <label>Salary</label>
                            <input type="number" class="form-control" name="salary" value="<%= employee.getSalary() %>" required>
                        </div>

                        <div class="form-group">
                            <label>Hire Date</label>
                            <input type="date" class="form-control" name="hire_date" value="<%= employee.getHire_date() %>" required>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Update Employee</button>
                            <a href="hr-dashboard.jsp" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>