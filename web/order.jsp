<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/background/commons/info.jsp"%>
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
    <div class="col-md-12">
        <h2 style="padding: 20px">下订单</h2>
    </div>
    <form class="layui-form" action="<%=request.getContextPath()%>/foreground/toOrder" id="signupForm">
        <input type="hidden" name="attraction.attractionId" value="${attraction.attractionId}">
        <div class="layui-form-item">
            <label class="layui-form-label">出发时间：</label>
            <div class="layui-input-inline">
                <input type="text" name="goTime"  placeholder="请输入出发时间" lay-verify="required" class="layui-input" id="test1">
            </div>
            <label class="layui-form-label">集合地点：</label>
            <div class="layui-input-inline">
                <select id="place" name="place" lay-verify="required">
                    <option value=""></option>
                    <option value="东门">东门</option>
                    <option value="西门">西门</option>
                    <option value="南门">南门</option>
                    <option value="北门">北门</option>
                    <option value="中门">中门</option>
                </select>
            </div>
            <label class="layui-form-label">旅行类型：</label>
            <div class="layui-input-inline">
                <select id="type" name="type.typeId" lay-verify="required">
                    <option value="1">个人游</option>
                    <%--<option value="2">组团游</option>--%>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">游客信息：</label>
            <div role="group1" id="tb" class="layui-input-block">
                姓名:
                <input type="text" id="name1"
                       placeholder="请输入姓名" style="height: 34px;padding: 6px 12px" name="visitorName" lay-verify="required">
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
    layui.use(['laydate','form'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test1', //指定元素
            type:'datetime'
        });
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