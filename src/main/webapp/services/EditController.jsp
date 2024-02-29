<%@ page import="com.example.studyw.model.User" %>
<%@ page import="com.example.studyw.service.UserService" %>
<%@ page import="com.example.studyw.service.UserServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<%
    UserService service = new UserServiceImpl();
    String action = request.getParameter("action");

    if ("Save Changes".equals(action)) {
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String sex = request.getParameter("sex");
        String country = request.getParameter("country");

        User existingUser = service.userById(Integer.parseInt(userId));
        if (existingUser != null) {
            existingUser.setName(name);
            existingUser.setPassword(password);
            existingUser.setEmail(email);
            existingUser.setSex(sex);
            existingUser.setCountry(country);

            boolean updated = service.updateUser(existingUser, Integer.parseInt(userId));
            if (updated) {
                response.sendRedirect("../page/UserDisplay.jsp");
            } else {
                response.sendRedirect("../page/error.jsp");
            }
        } else {
            // Handle user not found
            response.sendRedirect("../page/error.jsp");
        }
    }
%>
</body>
</html>
