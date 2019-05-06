<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="info.jsp" %>
<html>
<head>
    <title>世界风光详情介绍</title>
</head>
<body>
<!-- 头部开始 -->
<jsp:include page="desk/header.jsp"/>
<!-- 头部结束 -->
<section class="single">
    <div class="container">
        <div class="row">
            <div class="col-md-4 sidebar" id="sidebar">
                <%--<aside>--%>
                    <%--<div class="aside-body">--%>
                        <%--<figure class="ads">--%>
                            <%--<img src="<%=request.getContextPath()%>/images/ad.png">--%>
                            <%--<figcaption>Advertisement</figcaption>--%>
                        <%--</figure>--%>
                    <%--</div>--%>
                <%--</aside>--%>
                <aside>
                    <h1 class="aside-title">世界时光</h1>
                    <div class="aside-body">
                        <article class="article-fw">
                            <c:forEach items="${list}" var="list">
                            <div class="inner">
                                <figure>
                                    <a href="<%=request.getContextPath()%>/attraction/detail/${list.attractionId}">
                                        <img src="<%=request.getContextPath()%>/background/image/${list.imageUrl}">
                                    </a>
                                </figure>
                                <div class="details">
                                    <h6><a href="<%=request.getContextPath()%>/attraction/detail/${list.attractionId}">${list.attractionName}</a></h6>
                                    <p>
                                            ${fn:length(list.attractionDesc)>20?fn:substring(list.attractionDesc, 0, 20).concat("..."):list.attractionDesc}
                                    </p>
                                </div>
                            </div>
                            </c:forEach>
                        </article>
                    </div>
                </aside>
                <aside>
                    <div class="aside-body">
                        <form class="newsletter">
                            <div class="icon">
                                <i class="ion-ios-email-outline"></i>
                                <h1>订阅我们</h1>
                            </div>
                            <div class="input-group">
                                <input type="email" class="form-control email" placeholder="Your mail">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary"><i class="ion-paper-airplane"></i></button>
                                </div>
                            </div>
                            <p>通过订阅，您将在电子邮件中收到最新消息。</p>
                        </form>
                    </div>
                </aside>
            </div>
            <div class="col-md-8">
                <ol class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/attraction/changePlace">首页</a></li>
                    <li class="active">详情介绍</li>
                </ol>

                <article class="article main-article">
                    <header>
                        <h1>${attraction.attractionName}</h1>
                    </header>
                    <div class="main">
                        <h5>旅行路线</h5>
                        <p>${attraction.route}</p>
                        <div class="featured">
                            <figure>
                                <img src="<%=request.getContextPath()%>/background/image/${attraction.imageUrl}">
                                <figcaption>Image by pexels.com</figcaption>
                            </figure>
                        </div>
                        <p>${attraction.attractionDesc} </p>
                    </div>
                    <footer>
                        <%--<div class="col">--%>
                            <%--<a href="#" class="love"><i class="ion-android-favorite-outline"></i>--%>
                                <%--<div>1220</div>--%>
                            <%--</a>--%>
                        <%--</div>--%>
                    <c:forEach items="${prices}" var="price">
                        <c:if test="${price.attractionId == attraction.attractionId}">
                            <c:forEach items="${types}" var="type">
                                <c:if test="${type.typeId == price.typeId}">
                                    <h5><option value="${price.price}">${type.typeName}:${price.price}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option></h5>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                    </footer>
                </article>
                    <div class="col-md-12">
                        <a href="<%=request.getContextPath()%>/foreground/order/${attraction.attractionId}"><h3>想要亲身体验么，就赶快下单吧，不要错过哦！！！</h3></a>
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