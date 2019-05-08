<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../background/commons/info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>Magz旅行社</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!-- css和js的引用封装在info.jsp -->

    <style>

        .nihao {
            /*background: #eeeeee 0 0 no-repeat;*/
            background: url(/background/static/img/.......jpg) no-repeat center;
            background-size: cover;
            overflow: hidden;
        }

    </style>
</head>
<body class="nihao">

<div class="login layui-anim layui-anim-up">
    <div class="message">伪支付</div>
    <div id="darkbannerwrap"></div>

    <form class="layui-form" action="<%=request.getContextPath()%>/QueryOrderController/changeState">
        订单号：<input name="orderId" readonly="readonly" type="text" class="layui-input" value="${order.orderId}">
        <hr class="hr15">
        类型：<input name="typeName" readonly="readonly" type="text" class="layui-input" value="${order.type.typeName}">
        <hr class="hr15">
        订单总额：<input name="total" readonly="readonly" type="text" class="layui-input" value="${order.total}">
        <hr class="hr15">
        <input value="支付" style="width:100%;" name="apply" type="submit" onclick="n()">
        <hr class="hr20">
    </form>
</div>

<script>
    function n() {
        alert("支付成功");
    }
</script>
</body>
</html>