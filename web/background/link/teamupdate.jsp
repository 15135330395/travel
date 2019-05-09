<%--
  Created by IntelliJ IDEA.
  User: 15087
  Date: 2019/3/20
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- css和js的引用封装在info.jsp -->
<%@ include file="../commons/info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>添加TEAM</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">

            <label for="attractionId" class="layui-form-label">
                <span class="x-red">*</span>景点名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="attractionName" name="attractionName" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${team2.attraction.attractionName}" readonly>
                <input type="text" id="attractionId" name="attractionId" value="${team2.attraction.attractionId}" hidden>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="staffId" class="layui-form-label">
                <span class="x-red">*</span>导游
            </label>
            <div class="layui-input-inline">
                <select id="staffId" name="staffId">
                    <c:forEach items="${staff}" var="map2">
                        <option value="${map2.staffId }" <c:if test="${map2.staffId==team2.staff.staffId }">selected</c:if>>${map2.staffName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="goTime" class="layui-form-label">
                <span class="x-red">*</span>出发时间
            </label>
            <div class="layui-input-inline">
                <input type="text" required class="layui-input" id="goTime" name="goTime" value="<fmt:formatDate value="${team2.departure}" pattern="yyyy-MM-dd HH:mm:ss" />">
            </div>
        </div>


        <div class="layui-form-item">
            <label for="place" class="layui-form-label">
                <span class="x-red">*</span>集合地点
            </label>
            <div class="layui-input-inline">
                <input type="text" id="place" name="place" required=""
                       autocomplete="off" class="layui-input" value="${team2.place}">
            </div>
        </div>


        <div class="layui-form-item">
            <label for="predict" class="layui-form-label">
                <span class="x-red">*</span>预计人数
            </label>
            <div class="layui-input-inline">

                <input type="text" id="predict" name="predict" required="" lay-verify="number"
                       autocomplete="off" class="layui-input" value="${team2.predict}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="">保存
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;
        //监听提交
        form.on('submit(add)', function (data) {
            //发异步，把数据提交给Servlet
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/team/updateteam?teamId="+${ team2.teamId},
                data: {
                    attractionId: data.field.attractionId,
                    staffId: data.field.staffId,
                    goTime: data.field.goTime,
                    place: data.field.place,
                    predict: data.field.predict
                },
                success: function (msg) {
                    if (msg == 1) {
                        layer.alert("修改成功", {icon: 6}, function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            // 关闭当前frame
                            parent.layer.close(index);
                            // 刷新父frame
                            window.parent.location.reload();
                        });
                    } else {
                        layer.msg("修改失败")
                    }
                },
                error: function () {
                    layer.msg("修改异常")
                }
            });
            return false;
        });
    });
</script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        laydate.render({
            elem: '#goTime' //指定元素
            ,min:0
            ,max:30
            ,type: 'datetime'
        });
    });
</script>
</body>
</html>

