<%@ page import="models.UserModel" %><%--
  Created by IntelliJ IDEA.
  User: deepu
  Date: 4/24/2021
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home</title>
</head>
<body>
<%
    if (request.getSession() != null) {
        if(session.getAttribute("user") != null) {
            UserModel user = (UserModel) session.getAttribute("user");
%>
<p>Hello, <%= user.getName() %></p>
<p> <a href="LogoutServlet">Logout</a> </p>
<%
    }
    }
%>
</body>
</html>
