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

<section class="not-found">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="code">
                    503
                </div>
                <h1>Service Unavailable</h1>
                <p class="lead">we're doing maintenance, come back later.</p>
                <div class="search-form">
                    <form>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" name="q" class="form-control" placeholder="Type something ...">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="link">
                        or <a href="page.jsp">back to home</a>.
                    </div>
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