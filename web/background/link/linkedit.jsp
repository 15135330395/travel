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
            <label for="linkId" class="layui-form-label">
                <span class="x-red"></span>
            </label>
            <div class="layui-input-inline">
                <input value="${link.linkId}" type="hidden" id="linkId" name="linkId" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="linkName" class="layui-form-label">
                <span class="x-red">*</span>名称
            </label>
            <div class="layui-input-inline">
                <input value="${link.linkName}" type="text" id="linkName" name="linkName" required=""
                       lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="linkUrl" class="layui-form-label">
                <span class="x-red">*</span>链接地址
            </label>
            <div class="layui-input-inline">
                <input value="${link.linkUrl}" type="text" id="linkUrl" name="linkUrl" required="" lay-verify="url"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="email" class="layui-form-label">
                <span class="x-red">*</span>email
            </label>
            <div class="layui-input-inline">
                <input value="${link.email}" type="text" id="email" name="email" required="" lay-verify="email"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="linkOrder" class="layui-form-label">
                <span class="x-red">*</span>排名
            </label>
            <div class="layui-input-inline">
                <input value="${link.linkOrder}" type="number" id="linkOrder" name="linkOrder" required=""
                       lay-verify="number"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

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
            //发异步，把数据提交给Servlet
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/LinkServletBg",
                data: {
                    action: "updateLink",
                    linkId: data.field.linkId,
                    linkName: data.field.linkName,
                    linkUrl: data.field.linkUrl,
                    email: data.field.email,
                    linkOrder: data.field.linkOrder
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

