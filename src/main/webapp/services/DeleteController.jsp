<%@ page import="com.example.studyw.model.User" %>
<%@ page import="com.example.studyw.service.UserService" %>
<%@ page import="com.example.studyw.service.UserServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete User</title>
</head>
<body>
<%
    UserService service = new UserServiceImpl();
    String action = request.getParameter("action");

    if ("ConfirmDelete".equals(action)) {
        String userId = request.getParameter("userId");

        // Delete the user
        boolean deleted = service.deleteUser(Integer.parseInt(userId));

        if (deleted) {
            response.sendRedirect("../page/UserDisplay.jsp");
        } else {
%>
<h3>Error: Failed to delete user.</h3>
<%
    }
} else {
%>
<h3>Error: Invalid action.</h3>
<%
    }
%>
</body>
</html>
