<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link rel="stylesheet" href="css/index.css"> <!-- Link to external CSS -->
</head>

<body>
    <div class="container">
        <header>
            <h1>Student Management System</h1>
            <nav>
                <a href="add-student.jsp" class="btn">Add Student</a>
            </nav>
        </header>

        <section class="student-list">
            <h2>All Students</h2>
            <table class="student-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Course</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.name}</td>
                            <td>${student.email}</td>
                            <td>${student.course}</td>
                            <td>
                                <a href="update-student.jsp?id=${student.id}" class="btn btn-update">Update</a>
                                <form action="delete-student" method="post" class="inline-form">
                                    <input type="hidden" name="id" value="${student.id}" />
                                    <button type="submit" class="btn btn-delete">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </body>
            </table>
        </section>
    </div>
</body>

</html>
