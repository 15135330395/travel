<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/desk/js/jquery.min.js"></script>
<%@ include file="info.jsp" %>
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
        <tr>
            <td colspan="2" align="center"><input type="submit" value="支付" name="apply" onclick="n()"></td>
        </tr>
    </table>
</form>

</body>

<script>

    function n() {
        alert("支付成功");
    }

</script>
</html>
