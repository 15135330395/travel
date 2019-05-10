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
    <title>景点添加</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/background/ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="layui-container" style="padding: 20px">
    <form class="layui-form" action="" enctype="multipart/form-data">
        <div class="layui-form-item">
            <label class="layui-form-label">景点名称：</label>
            <div class="layui-input-block">
                <input type="text" name="attractionName" required lay-verify="required" placeholder="请输入标题" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">景点路线：</label>
            <div class="layui-input-block">
                <input type="text" name="route" required lay-verify="required" placeholder="请输入路线" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">景点价格：</label>
            <div class="layui-input-block">
                组团游<input type="number" name="price1" required lay-verify="required" placeholder="请输入景点价格" autocomplete="off"
                          class="layui-input">
                散客游<input type="number" name="price2" required lay-verify="required" placeholder="请输入景点价格" autocomplete="off"
                          class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图片路径：</label>
            <div class="layui-input-block">
                <input type="text" name="imageUrl" required lay-verify="required" placeholder="图片路径" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">景点详情</label>
            <div class="layui-input-block">
                <textarea id="attractionDesc" name="attractionDesc" cols="20" rows="2" class="ckeditor"></textarea>
                <script>
                    CKEDITOR.replace('context');
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

            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/attraction/add",
                data: {
                    attractionName : data.field.attractionName,
                    route : data.field.route,
                    price1 : data.field.price1,
                    price2 : data.field.price2,
                    imageUrl : data.field.imageUrl,
                    attractionDesc : CKEDITOR.instances.attractionDesc.getData()
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
