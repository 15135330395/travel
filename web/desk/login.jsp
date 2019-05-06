<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="info.jsp" %>
<html>
<head>
    <title>Magz &mdash; 旅行社</title>
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
                            <input type="button" id="login" class="btn btn-primary btn-block" value="登录">
                        </div>
                        <div class="form-group text-center">
                            <span class="text-muted">还没有帐号?</span>
                            <a href="register.jsp">创建帐号</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 底部开始 -->
<jsp:include page="../footer.jsp"/>
<!-- 底部结束 -->
</body>
<script>

    $(document).ready(function () {
        //为输入框绑定事件
        $("#login").click(function () {
            //1.失去焦点获得输入框的内容
            var email = $("#email").val();
            var password = $("#password").val();
            //2.去服务器异步校验该用户名是否存在
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/userLogin/login/" + email + "/" + password,
                data: {},
                dataType: "json",
                success: function (data) {
                    if (data == 0){
                        alert("账户没有激活")
                        location.replace(location.href);
                    }else if(data == 1) {
                        alert("登陆成功")
                        window.location.replace("<%=request.getContextPath()%>/index.jsp")
                    } else if (data == 2) {
                        alert("密码错误")
                        $("#password").val("")
                    } else if (data == 3) {
                        alert("邮箱不存在")
                        location.replace(location.href);
                    }
                }
            });
        });
    });

</script>
</html>