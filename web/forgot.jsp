<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="info.jsp" %>
<html>
<head>
    <title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine Template</title>
</head>

<body>
<!-- 头部开始 -->
<jsp:include page="desk/header.jsp"/>
<!-- 头部结束 -->

<section class="login first grey">
    <div class="container">
        <div class="box-wrapper">
            <div class="box box-border">
                <div class="box-body">
                    <h4>忘记密码</h4>
                    <form>
                        <div class="form-group">
                            <label>电子邮箱</label>
                            <input type="email" name="email" class="form-control">
                        </div>
                        <div class="form-group text-right">
                            <button class="btn btn-primary btn-block">重置密码</button>
                        </div>
                        <div class="form-group text-center">
                            <span class="text-muted">直接登录?</span> <a href="login.jsp">登录</a>
                        </div>
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
</html>