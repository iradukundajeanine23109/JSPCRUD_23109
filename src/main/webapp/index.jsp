<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<%
  response.sendRedirect("page/User.jsp");
%>
</body>
</html>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
<%--  <title>JSP CRUD Example</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>JSP CRUD Example</h1>--%>
<%--<a href="/StudyW_war_exploded/pages/User.jsp">Add User</a>--%>
<%--<a href="/StudyW_war_exploded/pages/UserDisplay.jsp">View Users</a>--%>


<%--</body>--%>
<%--</html>--%>