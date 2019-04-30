<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26 0026
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<%
    // 系统管理员
    // 角色管理
    response.sendRedirect(request.getContextPath() + "/background/role/Role/RoleList.jsp");
    // 用户管理
//    response.sendRedirect(request.getContextPath() + "/background/role/User/UserList.jsp");
    // 菜单管理
    // response.sendRedirect(request.getContextPath() + "/background/role/Menu/MenuList.jsp");

%>
</body>
</html>
