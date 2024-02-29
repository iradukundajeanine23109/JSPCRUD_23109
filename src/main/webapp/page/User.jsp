<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.studyw.service.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/style.css">
    <title>User</title>
    <style>
        /* style.css */

        /* Header styles */
        .header {
            background-color: #333;
            padding: 10px;
        }

        .information h1 {
            margin: 0;
        }

        /* Content styles */
        .content {
            margin-left: 455px;
        }

        /* Form styles */
        form {
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Footer styles */
        .footer {
            text-align: center;
            margin-top: 20px;
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

    </style>
</head>
<body>
<div class="header">
    <div class="information">
        <h1>JSP CRUD HIBERNATE USER</h1>
    </div>
</div>

<ul>
    <li>
        <a href="UserDisplay.jsp">View Users</a>
    </li>
</ul>

<div class="content">
    <form action="../services/UserController.jsp" method="post">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label>Sex:</label>
        <input type="radio" id="male" name="sex" value="M" required>
        <label for="male">Male</label>
        <input type="radio" id="female" name="sex" value="F" required>
        <label for="female">Female</label><br>

        <label for="country">Country:</label>
        <select id="country" name="country" required>
            <option value="">Select Country</option>
            <option value="USA">USA</option>
            <option value="UK">UK</option>
            <option value="Canada">Canada</option>
        </select><br>

        <input type="submit" value="Submit">
    </form>
</div>

<div class="footer">
    <div class="me">IRADUKUNDA.rw123@gmail.com</div>
</div>
</body>
</html>
