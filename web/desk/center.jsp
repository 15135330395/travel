<%@ page import="com.chinasofti.user.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    response.sendRedirect(request.getContextPath()+"/QueryOrderController/queryOrder/"+user.getUserId());
%>
</body>
</html>
