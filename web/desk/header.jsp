<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/desk/js/jquery.min.js"></script>
<header class="primary">
    <div class="firstbar">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="brand">
                        <a href="page.jsp">
                            <img src="images/logo.png" alt="Magz Logo">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <form class="search" autocomplete="off">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" id="sousuo" class="form-control" placeholder="搜景点">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary" onclick="queryPlace()" style="line-height: 1;"><i class="ion-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="help-block">
                            <%--<div>热搜:</div>--%>
                            <ul>
                                <c:forEach begin="0" end="4" var="i">
                                    <li>
                                        <a href="#${visitedNewsList[i].newsId}">${visitedNewsList[i].newsTitle}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </form>
                </div>
                <div class="col-md-3 col-sm-12 text-right">
                    <ul class="nav-icons">
                        <c:if test="${user==null}">
                            <li>
                                <a href="register.jsp"><i class="ion-person-add"></i>
                                    <div>注册</div>
                                </a>
                            </li>
                            <li>
                                <a href="login.jsp"><i class="ion-person"></i>
                                    <div>登陆</div>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${user!=null}">
                            <li>
                                <a><i class="ion-person"></i>
                                    欢迎您，<span>${user.name}</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 导航开始 -->
    <nav class="menu">
        <div class="container">
            <div class="brand">
                <a href="#">
                    <img src="images/logo.png" alt="logo">
                </a>
            </div>
            <div class="mobile-toggle">
                <a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
            </div>
            <div class="mobile-toggle">
                <a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
            </div>
            <div id="menu-list">
                <ul class="nav-list">
                    <li class="for-tablet nav-title">
                        <a>Menu</a>
                    </li>
                    <li class="for-tablet">
                        <a href="login.jsp">Login</a>
                    </li>
                    <li class="for-tablet">
                        <a href="register.jsp">Register</a>
                    </li>
                    <li class="dropdown magz-dropdown">
                        <a href="category.jsp">菜单 <i class="ion-ios-arrow-right"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="index.jsp">首页</a>
                            </li>
                            <%--<li>--%>
                                <%--<a href="category.jsp">类别 </a>--%>
                            <%--</li>--%>
                            <c:if test="${user==null}">
                                <li class="dropdown magz-dropdown">
                                    <a href="#">认证<i class="ion-ios-arrow-right"></i></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="login.jsp">登陆</a>
                                        </li>
                                        <li>
                                            <a href="register.jsp">注册</a>
                                        </li>
                                        <li>
                                            <a href="forgot.jsp">忘记密码</a>
                                        </li>
                                        <li>
                                            <a href="reset.jsp">重置密码</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                            <%--<li>--%>
                                <%--<a href="single.jsp">景点</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="search.jsp">搜索</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="page.jsp">关于我们</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="contact.jsp">联系我们</a>--%>
                            <%--</li>--%>
                            <li class="dropdown magz-dropdown">
                                <a href="#">错误页面<i class="ion-ios-arrow-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="403.jsp">403</a>
                                    </li>
                                    <li>
                                        <a href="404.jsp">404</a>
                                    </li>
                                    <li>
                                        <a href="500.jsp">500</a>
                                    </li>
                                    <li>
                                        <a href="503.jsp">503</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/desk/place.jsp">景点 </a>
                    </li>
                    <%--<li class="dropdown magz-dropdown magz-dropdown-megamenu">--%>
                        <%--<a href="#">景点 <i class="ion-ios-arrow-right"></i>--%>
                            <%--<div class="badge">热</div>--%>
                        <%--</a>--%>
                        <%--<div class="dropdown-menu megamenu">--%>
                            <%--<div class="megamenu-inner">--%>
                                <%--<div class="row">--%>
                                    <%--<div class="col-md-3">--%>
                                        <%--<div class="row">--%>
                                            <%--<div class="col-md-12">--%>
                                                <%--<h2 class="megamenu-title">${newsByTypeList[1].get(0).newsType.typeName}</h2>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<ul class="vertical-menu">--%>
                                            <%--<c:forEach items="${newsByTypeList[1]}" var="news">--%>
                                                <%--<li>--%>
                                                    <%--<a href="#${news.newsId}">--%>
                                                        <%--<i class="ion-ios-circle-outline"></i>${news.newsTitle}--%>
                                                    <%--</a>--%>
                                                <%--</li>--%>
                                            <%--</c:forEach>--%>
                                        <%--</ul>--%>
                                    <%--</div>--%>
                                    <%--<div class="col-md-9">--%>
                                        <%--<div class="row">--%>
                                            <%--<div class="col-md-12">--%>
                                                <%--<h2 class="megamenu-title">精选</h2>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="row">--%>
                                            <%--<c:forEach begin="0" end="2" var="i">--%>
                                                <%--<article class="article col-md-4 mini">--%>
                                                    <%--<div class="inner">--%>
                                                        <%--<figure>--%>
                                                            <%--<a href="#${newNewsList[i].newsId}">--%>
                                                                <%--<img src="${newNewsList[i].imageUrl}"--%>
                                                                     <%--alt="${newNewsList[i].newsTitle}">--%>
                                                            <%--</a>--%>
                                                        <%--</figure>--%>
                                                        <%--<div class="padding">--%>
                                                            <%--<div class="detail">--%>
                                                                <%--<div class="time">2019 年 03 月 31--%>
                                                                    <%--日${newNewsList[i].publishTime}</div>--%>
                                                                <%--<div class="category">--%>
                                                                    <%--<a href="category.jsp#${newNewsList[i].newsType.typeId}">${newNewsList[i].newsType.typeName}</a>--%>
                                                                <%--</div>--%>
                                                            <%--</div>--%>
                                                            <%--<h2><a href="single.jsp">${newNewsList[i].newsTitle}</a>--%>
                                                            <%--</h2>--%>
                                                        <%--</div>--%>
                                                    <%--</div>--%>
                                                <%--</article>--%>
                                            <%--</c:forEach>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                    <%--<li class="dropdown magz-dropdown magz-dropdown-megamenu">--%>
                        <%--<a href="#">详细 <i class="ion-ios-arrow-right"></i></a>--%>
                        <%--<div class="dropdown-menu megamenu">--%>
                            <%--<div class="megamenu-inner">--%>
                                <%--<div class="row">--%>
                                    <%--<c:forEach begin="6" end="9" var="i">--%>
                                        <%--<div class="col-md-3">--%>
                                            <%--<h2 class="megamenu-title">${newsByTypeList[i].get(0).newsType.typeName}</h2>--%>
                                            <%--<ul class="vertical-menu">--%>
                                                <%--<c:forEach items="${newsByTypeList[i]}" var="news">--%>
                                                    <%--<li>--%>
                                                        <%--<a href="#${news.newsId}">${news.newsTitle}</a>--%>
                                                    <%--</li>--%>
                                                <%--</c:forEach>--%>
                                            <%--</ul>--%>
                                        <%--</div>--%>
                                    <%--</c:forEach>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                    <c:if test="${user!=null}">
                        <li class="dropdown magz-dropdown">
                            <a href="#">${user.name} <i class="ion-ios-arrow-right"></i></a>
                            <ul class="dropdown-menu">
                                <%--<li>--%>
                                    <%--<a href="#"><i class="icon ion-person"></i>我的账号</a>--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--<a href="#"><i class="icon ion-key"></i>更改密码</a>--%>
                                <%--</li>--%>
                                <li>
                                    <a href="order.jsp"><i class="icon ion-settings"></i>我的订单</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#"><i class="icon ion-log-out"></i>退出登录</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 导航结束 -->

    <script>

        <%--搜索按钮--%>
        function queryPlace() {

          var place = document.getElementById("sousuo").value;

            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/test/queryPlace/"+place,
                data: {

                },
                success: function (msg) {

                    if (msg == "1") {
                        alert("修改成功", function () {
                            window.location.reload();
                        });
                    } else {
                        alert("申请失败")
                    }
                },
                error: function () {
                    alert("服务器忙")
                }
            })
        }

    </script>
</header>