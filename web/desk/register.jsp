<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/desk/js/jquery.min.js"></script>
<%@ include file="info.jsp" %>
<html>
<head>
    <title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine Template</title>
</head>

<body>
<!-- 头部开始 -->
<jsp:include page="header.jsp"/>
<!-- 头部结束 -->

<section class="login first grey">
    <div class="container">
        <div class="box-wrapper">
            <div class="box box-border">
                <div class="box-body">
                    <h4>注册</h4>

                    <div class="form-group">
                        <label for="email">电子邮箱</label>
                        <input id="email" type="email" name="email" class="form-control" placeholder="请输入邮箱"
                               required="">
                    </div>

                    <div class="form-group">
                        <label for="password" class="fw">密码</label>
                        <input id="password" type="password" name="password" class="form-control"
                               placeholder="请输入密码" required="">
                    </div>
                    <div class="form-group text-right">
                        <input id="login" type="button" value="注册" class="btn btn-primary btn-block">
                    </div>
                    <div class="form-group text-center">
                        <span class="text-muted">已经有账号了?</span>
                        <a href="login.jsp">Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 底部开始 -->
<jsp:include page="/footer.jsp"/>
<!-- 底部结束 -->

</body>
<script type="text/javascript">

    $(document).ready(function () {
        //为输入框绑定事件
        $("#login").click(function () {
            //1.失去焦点获得输入框的内容
            var email = $("#email").val();
            var password = $("#password").val();
            if (email == "" || password == "") {
                alert("请正确输入信息");
                return;
            }
            //2.去服务器异步校验该邮箱是否存在
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/userRegister/register/",
                data: {
                    email:email,
                    password:password
                },
                dataType: "json",
                success: function (data) {
                    if (data == 1) {
                        alert("注册失败，邮箱已存在")
                        location.replace(location.href);
                    } else if (data == 2) {
                        alert("注册成功，请接收邮件前往激活")
                        window.location.replace("/desk/login.jsp")
                    }
                }
            });
        });
    });

</script>
</html>