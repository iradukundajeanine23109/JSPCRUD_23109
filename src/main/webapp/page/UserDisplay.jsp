<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.studyw.service.UserService" %>
<%@ page import="com.example.studyw.service.UserServiceImpl" %>
<%@ page import="com.example.studyw.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<link href="../page/style.css" rel="stylesheet" type="text/css"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <style>
        /* Define CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            color: blue;
            text-decoration: none;
        }

        button a {
            color: #fff;
            text-decoration: none;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
        }

        button a:hover {
            background-color: #0056b3;
        }

        .delete-form {
            display: inline-block;
        }

        .delete-form input[type="submit"] {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }

        .delete-form input[type="submit"]:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<h2>User List</h2>
<button><a href="../page/User.jsp">New User</a></button>
<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Password</th>
        <th>Email</th>
        <th>Sex</th>
        <th>Country</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <% List<User> users = new ArrayList<User>();
        UserService userService = new UserServiceImpl();
        users = userService.getUser();

        for (User user : users) { %>
    <tr>
        <td><%= user.getId() %></td>
        <td><%= user.getName() %></td>
        <td><%= user.getPassword() %></td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getSex() %></td>
        <td><%= user.getCountry() %></td>
        <td>
            <a href="../page/EditUser.jsp?id=<%= user.getId() %>&name=<%= user.getName() %>&password=<%= user.getPassword() %>&email=<%= user.getEmail() %>&sex=<%= user.getSex() %>&country=<%= user.getCountry() %>">Edit</a>
        </td>
        <td class="delete-form">
            <form id="deleteForm<%= user.getId() %>" action="../services/DeleteController.jsp" method="post" onsubmit="return confirmDelete('<%= user.getName() %>');">
                <input type="hidden" name="userId" value="<%= user.getId() %>">
                <input type="hidden" name="action" value="ConfirmDelete"> <!-- Change value to "ConfirmDelete" -->
                <input type="submit" value="Delete">
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<script>
    function confirmDelete(userName) {
        return confirm("Are you sure you want to delete the user: " + userName + "?");
    }
</script>
</body>
</html>
