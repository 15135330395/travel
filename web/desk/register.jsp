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
                        <label for="name">昵称</label>
                        <input id="name" type="text" name="name" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label for="email" class="fw">电子邮箱
                            <span id="emailInfo" class="pull-right"></span>
                        </label>
                        <input id="email" type="email" name="email" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label for="username" class="fw">用户名
                            <span id="usernameInfo" class="pull-right"></span>
                        </label>
                        <input id="username" type="text" name="username" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label for="password" class="fw">密码</label>
                        <input id="password" type="password" name="password" class="form-control" required="">
                    </div>
                    <div class="form-group text-right">
                        <input id="login" type="button" disabled value="注册" class="btn btn-primary btn-block">
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

   <%--异步检测是否有该邮箱--%>
    $(document).ready(function () {
        //为输入框绑定事件
        $("#email").blur(function () {
            //1.失去焦点获得输入框的内容
            var emailInput = $(this).val();
            //2.去服务器异步校验该邮箱是否存在
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/test/queryEmail/",
                data: {
                    email: emailInput
                },
                dataType: "json",
                success: function (data) {

                    alert(data.msg);
                    //接收到LoginServlet返回的值
                    var isExist = data;
                    // alert(isExist);
                    //3.根据返回的isExist动态显示
                    var emailInfo = "";
                    if (isExist) {//对返回的值进行判断
                        emailInfo = "该邮箱已被使用";
                        $("#emailInfo").css("color", "red");//设置提示文本的显示颜色
                        $("#login").css()
                        $('#login').parent().css("form-group has-error");
                    } else {
                        emailInfo = "该邮箱可以使用";
                        $("#emailInfo").css("color", "green");
                        $('#login').parent().css("form-group has-success");
                    }
                    //将提示信息写到邮箱输入框后面
                    $("#emailInfo").html(emailInfo);
                }
            });
        });

        //异步检测用户的用户名是否存在
        $("#username").blur(function () {
            //1.失去焦点获得输入框的内容
            var usernameInput = $(this).val();
            //2.去服务器异步校验该用户名是否存在
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/test/queryUsername/",
                data: {
                    username: usernameInput
                },
                dataType: "json",
                success: function (data) {
alert(data);
                    // alert(data.msg);
                    //接收到LoginServlet返回的值
                    var isExist = data;
                    // alert(isExist);
                    //3.根据返回的isExist动态显示
                    var usernameInfo = "";
                    if (isExist==1) {//对返回的值进行判断
                        usernameInfo = "该用户名已经存在";
                        $("#usernameInfo").css("color", "red");//设置提示文本的显示颜色
                    } else {
                        usernameInfo = "该用户名可以使用";
                        $("#usernameInfo").css("color", "green");
                    }
                    //将提示信息写到用户名输入框后面
                    $("#usernameInfo").html(usernameInfo);
                    $().check();
                }
            });
        });

        //判断输入格式是否符合规范
        $.fn.check = (function () {
            var name = $("#name").val();
            var email = $("#email").val();
            var username = $("#username").val();
            var password = $("#password").val();
            if (email == "" || name == "" || username == "" || password == "") {
                $("#login").attr("disabled", true);
            }
            if (username && username.length >= 2 &&
                password && password.length >= 6)
                $("#login").attr("disabled", false);
            else
                $("#login").attr("disabled", true);
        });
        $("#login").click(function () {
            var name = $("#name").val();
            var username = $("#username").val();
            var email = $("#email").val();
            var password = $("#password").val();
            alert(name)
            alert(username)
            alert(email)
            alert(password)
            if (email == "" || name == "" || username == "" || password == "") {
                alert("请正确输入信息");
                return;
            }
            $("#login").attr("disabled", true);
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/test/r",
                data: {
                    email: email,
                    name: name,
                    username: username,
                    password: password
                },
                dataType: "json",
                success: function (data) {
                    alert(data.msg);
                    if (data == 1) {
                        alert("注册成功！");
                        window.location.replace("login.jsp")
                    } else if (data == 2) {
                        // alert("邮箱已被使用！");
                        $("#emailInfo").css("color", "red");
                        $("#emailInfo").html("该邮箱已被使用");
                    } else if (data == 3) {
                        // alert("用户名已被使用！");
                        $("#usernameInfo").css("color", "red");
                        $("#usernameInfo").html("该用户名已经存在");
                    }
                    $().check();
                }
            });

        });
    });

</script>
</html>