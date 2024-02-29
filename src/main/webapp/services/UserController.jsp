<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.studyw.model.User" %>
<%@ page import="com.example.studyw.service.UserService" %>
<%@ page import="com.example.studyw.service.UserServiceImpl" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.UUID" %>

<%
    UserService service = new UserServiceImpl();
    User user = new User();
    String stname = request.getParameter("name");
    String pswd = request.getParameter("password");
    String email = request.getParameter("email");
    String sex = request.getParameter("sex");
    String country = request.getParameter("country");

    boolean isValid = false;

//    if(stname.trim().isEmpty()){
    isValid = true;
//        System.out.println("All fields are required");
//    }else{
    user.setName(stname);
    user.setPassword(pswd);
    user.setEmail(email);
    user.setSex(sex);
    user.setCountry(country);

    boolean feedback = service.addUser(user);
    if(feedback) {
        request.getRequestDispatcher("../page/UserDisplay.jsp").forward(request, response);
        System.out.println("Inserted");
    }else {
        request.getRequestDispatcher("../page/error.jsp").forward(request, response);
        System.out.println("failed");

    }

%>

