<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/22 0022
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../commons/info.jsp" %>
<html>
<head>
    <title>新闻添加</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="layui-container" style="padding: 20px">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">新闻标题：</label>
            <div class="layui-input-block">
                <input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">作者：</label>
            <div class="layui-input-inline">
                <input type="text" name="author" required lay-verify="required" placeholder="请输入作者" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新闻类型：</label>
            <div class="layui-input-block">
                <select name="typeId" lay-verify="required">
                    <option value=""></option>
                    <c:forEach items="${typeList}" var="type">
                        <option value="${type.typeId}">${type.typeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新闻标签：</label>
            <div class="layui-input-block">
                <div>
                    <input type="checkbox" name="isHot" lay-text="热点新闻|热点" lay-skin="switch">
                </div>
                <br>
                <div>
                    <input type="checkbox" name="isImage" lay-text="新闻轮播|轮播" lay-skin="switch">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发布日期：</label>
            <div class="layui-input-inline">
                <input type="text" name="publishDate" lay-verify="required" class="layui-input" id="test1">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">新闻内容：</label>
            <div class="layui-input-block">
                <textarea id="content" name="content" cols="20" rows="2" class="ckeditor"></textarea>
                <script>
                    CKEDITOR.replace('content');
                </script>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitSave">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script>
    layui.use(['laydate', 'form'], function () {
        var form = layui.form;
        var laydate = layui.laydate;
        //监听提交
        form.on('submit(submitSave)', function (data) {
            // layer.msg(JSON.stringify(data.field) + "===" + CKEDITOR.instances.content.getData());
            var title = data.field.title;
            var author = data.field.author;
            var typeId = data.field.typeId;
            var hot = data.field.isHot;
            var isImage = data.field.isImage;
            var publishDate = data.field.publishDate;
            var content = CKEDITOR.instances.content.getData();
            $.ajax({
                type: "post",
                url: "NewsServlet",
                data: {
                    action: "addNews",
                    title: title,
                    author: author,
                    typeId: typeId,
                    hot: hot,
                    isImage: isImage,
                    publishDate: publishDate,
                    content: content
                },
                success: function (msgData) {
                    layer.msg("添加成功", {icon: 1, time: 2000});
                    setTimeout("location.reload()", 2300)
                }
            })
            return false;
        });
        laydate.render({
            elem: '#test1', //指定元素
            type: 'datetime'
        });
    });

</script>

</body>
</html>
