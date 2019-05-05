<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <h4>登录</h4>
                    <form>
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input id="username" type="text" name="username" class="form-control" placeholder="请输入用户名"
                                   required="">
                        </div>
                        <div class="form-group">
                            <label for="password" class="fw">密码
                                <a href="forgot.jsp" class="pull-right">忘记密码?</a>
                            </label>
                            <input id="password" type="password" name="password" class="form-control"
                                   placeholder="请输入密码" required="">
                        </div>
                        <div class="form-group">
                            <label class="fw">验证码
                                <img class="pull-right" id="imgObj" alt="验证码" onclick="changeImg()"
                                     src="${pageContext.request.contextPath}/getCode">
                            </label>
                            <input type="text" id="code" class="form-control" placeholder="请输入验证码" required="">
                        </div>
                        <div class="form-group text-right">
                            <input type="button" id="login" class="btn btn-primary btn-block" value="登录">
                        </div>
                        <div class="form-group text-center">
                            <span class="text-muted">还没有帐号?</span>
                            <a href="register.jsp">创建帐号</a>
                        </div>
                        <div class="title-line">
                            或者
                        </div>
                        <a href="#" class="btn btn-social btn-block facebook"><i class="ion-social-facebook"></i>通过FackeBook登录</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 底部开始 -->
<jsp:include page="footer.jsp"/>
<!-- 底部结束 -->
</body>
<script>
    function changeImg() {
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        // 时间戳
        // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
        imgSrc.attr("src", "${pageContext.request.contextPath}/getCode?timestamp=" + (new Date()).valueOf());
    }

    $(document).ready(function () {
        //为输入框绑定事件
        $("#login").click(function () {
            //1.失去焦点获得输入框的内容
            var username = $("#username").val();
            var password = $("#password").val();
            //2.去服务器异步校验该用户名是否存在
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/LoginServlet",
                data: {
                    action: "login",
                    username: username,
                    password: password
                },
                dataType: "json",
                success: function (data) {
                    if (data == 1) {
                        alert("登陆成功")
                        window.location.replace("index.jsp")
                    } else if (data == 2) {
                        alert("密码错误")
                        $("#password").val("")
                    } else if (data == 3) {
                        alert("用户名不存在")
                        location.replace(location.href);
                    }
                }
            });
        });
    });

</script>
</html>