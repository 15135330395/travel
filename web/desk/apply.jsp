<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-05-05
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="<%=request.getContextPath()%>/QueryOrderController/changeState/${order.orderId}">
    <table border="1px" cellspacing="0" style="margin:auto">
        <tr>
            <td colspan="2" align="center">伪支付</td>
        </tr>
        <tr>
            <td align="center">订单号:</td>
            <td align="center">${order.orderId}</td>
        </tr>
        <tr>
            <td align="center">订单总额:</td>
            <td align="center">${order.total}</td>
        </tr>
        <%--<tr>--%>
            <%--<td colspan="2">--%>
            <%--<select>--%>
                <%--<option>===请选择您的导游===</option>--%>
                <%--<option></option>--%>
            <%--</select>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="支付" name="apply"></td>
        </tr>
    </table>
</form>
</body>
</html>