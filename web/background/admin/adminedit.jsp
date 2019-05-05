<%--
  Created by IntelliJ IDEA.
  User: 15087
  Date: 2019/3/20
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- css和js的引用封装在info.jsp -->
<%@ include file="../commons/info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>修改友情链接</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="adminId" class="layui-form-label">
                <span class="x-red"></span>
            </label>
            <div class="layui-input-inline">
                <input value="${admin.adminId}" type="hidden" id="adminId" name="adminId" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="adminName" class="layui-form-label">
                <span class="x-red">*</span>用户名
            </label>
            <div class="layui-input-inline">
                <input value="${admin.adminName}" type="text" id="adminName" name="adminName" required=""
                       lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="password" class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-inline">
                <input value="${admin.password}" type="text" id="password" name="password"  required=""
                       lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--<div class="layui-form-item">--%>
            <%--<label for="password" class="layui-form-label">--%>
                <%--<span class="x-red">*</span>员工姓名--%>
            <%--</label>--%>
            <%--<div class="layui-input-inline">--%>
                <%--<input value="${admin.password}" type="text" id="password" name="password"  required=""--%>
                       <%--lay-verify="required"--%>
                       <%--autocomplete="off" class="layui-input">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <%--<label for="password" class="layui-form-label">--%>
                <%--<span class="x-red">*</span>角色名--%>
            <%--</label>--%>
            <%--<div class="layui-input-inline">--%>
                <%--<input value="${admin.password}" type="text" id="password" name="password"  required=""--%>
                       <%--lay-verify="required"--%>
                       <%--autocomplete="off" class="layui-input">--%>
            <%--</div>--%>
        <%--</div>--%>

        <div class="layui-form-item">
            <label class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="update" lay-submit="">
                保存
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
        form.on('submit(update)', function (data) {

            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/admin/update",
                data: {
                    adminId: data.field.adminId,
                    adminName: data.field.adminName,
                    password: data.field.password,
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
                        layer.msg("修改失败，该信息不存在")
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
</body>
</html>

