<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.studyw.model.User" %>
<%@ page import="com.example.studyw.service.UserService" %>
<%@ page import="com.example.studyw.service.UserServiceImpl" %>

<%
  String userIdParam = request.getParameter("id");

  // Check if the user ID parameter is missing or invalid
  if (userIdParam == null || userIdParam.isEmpty()) {
    // Redirect to an error page
    response.sendRedirect("../page/error.jsp");
  } else {
    int userId = Integer.parseInt(userIdParam);
    UserService userService = new UserServiceImpl();
    User editUser = userService.userById(userId);

    // Check if the user exists
    if (editUser == null) {
      // Redirect to an error page
      response.sendRedirect("../page/error.jsp");
    } else {
      // Retrieve user details
      String nameParam = editUser.getName();
      String passwordParam = editUser.getPassword();
      String emailParam = editUser.getEmail();
      String sexParam = editUser.getSex();
      String countryParam = editUser.getCountry();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit User</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    h2 {
      color: #333;
    }

    form {
      width: 40%;
      margin: 0 auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    select {
      width: 80%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 3px;
      box-sizing: border-box;
    }

    input[type="radio"] {
      margin-right: 10px;
    }

    input[type="submit"] {
      background-color: #007bff;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<h2>Edit User</h2>
<form action="../services/EditController.jsp" method="post">
  <input type="hidden" name="userId" value="<%= userId %>">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" value="<%= nameParam %>" required><br>

  <label for="password">Password:</label>
  <input type="password" id="password" name="password" value="<%= passwordParam %>" required><br>

  <label for="email">Email:</label>
  <input type="email" id="email" name="email" value="<%= emailParam %>" required><br>

  <label>Sex:</label>
  <input type="radio" id="male" name="sex" value="M" <%= "M".equals(sexParam) ? "checked" : "" %> required>
  <label for="male">Male</label>
  <input type="radio" id="female" name="sex" value="F" <%= "F".equals(sexParam) ? "checked" : "" %> required>
  <label for="female">Female</label><br>

  <label for="country">Country:</label>
  <select id="country" name="country" required>
    <option value="USA" <%= "USA".equals(countryParam) ? "selected" : "" %>>USA</option>
    <option value="UK" <%= "UK".equals(countryParam) ? "selected" : "" %>>UK</option>
    <option value="Canada" <%= "Canada".equals(countryParam) ? "selected" : "" %>>Canada</option>
    <!-- Add more options as needed -->
  </select><br>

  <input type="hidden" name="action" value="Save Changes">
  <input type="submit" value="Save Changes">
</form>
</body>
</html>
<%
    }
  }
%>
