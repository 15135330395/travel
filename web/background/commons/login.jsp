<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!-- css和js的引用封装在info.jsp -->
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">管理登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form">
        <input name="username" placeholder="用户名" type="text" lay-verify="username" class="layui-input">
        <hr class="hr15">
        <input name="password" placeholder="密码" type="password" lay-verify="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20">
    </form>
</div>

<script>
    $(function () {
        layui.use('form', function () {
            var form = layui.form;
            form.verify({
                /* https://blog.csdn.net/huangbaokang/article/details/78280585?utm_source=blogxgwz2 */
                username: function (value, item) { //value：表单的值、item：表单的DOM对象
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                        return '用户名不能有特殊字符';
                    }
                    if (/^\d+\d+\d$/.test(value)) {
                        return '用户名不能全为数字';
                    }
                }
                //我们既支持上述函数式的方式，也支持下述数组的形式
                //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
                , password: [
                    /^[a-zA-Z]\w{5,17}$/, '密码必须以字母开头，长度在6~18之间，只能包含字母、数字和下划线'
                ]
            });
            //监听提交
            form.on('submit(login)', function (data) {
                $.ajax({
                    type: "post",
                    url: "<%=request.getContextPath()%>/admin/login",
                    data: "adminName=" + data.field.username + "&password=" + data.field.password,
                    success: function (msg) {
                        if (msg == 2) {
                            layer.msg("登录成功", function () {
                                location.href = "<%=request.getContextPath()%>/background/commons/backgroundindex.jsp"
                            });
                            if (${admin!=null}) {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                // 关闭当前frame
                                parent.layer.close(index);
                                // 刷新父frame
                                window.parent.location.reload();
                                location.href = "<%=request.getContextPath()%>/background/commons/backgroundindex.jsp"
                            }
                        } else if (msg == 1) {
                            layer.msg("密码错误")
                        } else if (msg == 0) {
                            layer.msg("用户名不存在")
                        }
                    }
                });
                return false;
            });
        });
    })
</script>
<!-- 底部结束 -->
</body>
</html>