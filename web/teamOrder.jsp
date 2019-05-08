<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/background/commons/info.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="info.jsp" %>
<html>
<head>
    <title>Magz旅行社</title>
    <style>
        .icon {
            font-size: 23px;
        }
    </style>
</head>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/desk/login.jsp");
    }
%>
<body>

<div class="layui-container" style="padding: 20px">
    <div class="col-md-12" style="padding: 20px">
        <span class="layui-breadcrumb">
        <a href="<%=request.getContextPath()%>/index.jsp" style="font: caption">首页</a>
        <a>
          <cite style="font: caption">订单</cite></a>
      </span>
    </div>
    <form class="layui-form" id="order-form">
        <input type="hidden" name="attraction.attractionId" value="${team.attraction.attractionId}">
        <input type="hidden" name="teamId" value="${team.teamId}">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 111px;">出发时间：</label>
            <div class="layui-input-inline">
                <input type="text" name="goTime" readonly
                       value="<fmt:formatDate value="${team.departure}" pattern="yyyy-MM-dd HH:mm:ss" />"
                       lay-verify="required"
                       class="layui-input">
            </div>
            <label class="layui-form-label" style="width: 111px;">集合地点：</label>
            <div class="layui-input-inline">
                <input type="text" name="place" readonly value="${team.place}" lay-verify="required"
                       class="layui-input">

            </div>
            <label class="layui-form-label" style="width: 111px;">旅行类型：</label>
            <div class="layui-input-inline">
                <select id="type" name="typeId" lay-verify="required">
                    <option value="1">组团游</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 111px;">游客信息：</label>
            <div role="group1" id="tb" class="layui-input-block">
                姓名:
                <input type="text" id="name1"
                       placeholder="请输入姓名" style="height: 34px;padding: 6px 12px" name="visitorName"
                       lay-verify="required">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;身份证号:
                <input type="text"
                       placeholder="请输入身份证号" style="height: 34px;padding: 6px 12px" name="cardId" lay-verify="identity">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式:
                <input type="tel"
                       placeholder="请输入联系方式" style="height: 34px;padding: 6px 12px" name="phone" lay-verify="phone">
                <i class="icon ion-plus-circled" onclick="add()" style="padding: 5px auto"></i>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitSave">提交订单</button>
            </div>
        </div>
    </form>
</div>
</div>

<script>
    $("#order-form").submit(function () {
        var $this = $(this);
        $.ajax({
            url: '<%=request.getContextPath()%>/foreground/toTeamOrder',
            type: "post",
            data: $this.serialize(),
            dataType: 'json',
            success: function (msg) {
                if (msg == 0) {
                    layer.msg("提交失败，参团人数已超", {icon: 2, time: 1000});
                    setTimeout(location.replace(location.href), 1000);
                } else if (msg == 1) {
                    layer.msg("提交订单成功", {icon: 1, time: 1000});
                    window.location.replace("<%=request.getContextPath()%>/desk/center.jsp")
                }
            }
        });
        return false;
    });

    function add() {
        var form = document.createElement("group1");
        form.id = new Date().getTime();
        form.innerHTML = "<div role='group1' >" +
            "姓名: " + "<input type=\"text\"\n" +
            "      style=\"height: 34px;padding: 6px 12px\"  lay-verify=\"required\" placeholder=\"请输入姓名\" name=\"visitorName\">" +
            " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;身份证号: <input type=\"text\"\n" +
            "     style=\"height: 34px;padding: 6px 12px\"  lay-verify=\"identity\" placeholder=\"请输入身份证号\" name=\"cardId\">" +
            " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式: <input type=\"tel\"\n" +
            "  style=\"height: 34px;padding: 6px 12px\" lay-verify=\"phone\"  placeholder=\"请输入联系方式\" name=\"phone\">" +
            "  <i class=\"icon ion-minus-circled\" onclick='del(this)'></i></div>";
        document.getElementById("tb").appendChild(form);
    }

    function del(obj) {
        var formID = obj.parentNode.parentNode.id;
        var form = document.getElementById(formID);
        document.getElementById("tb").removeChild(form);
    }

    $(document).ready(function () {
        console.log($("#tb").serialize()); // FirstName=Bill&LastName=Gates
    });

</script>

</body>
</html>