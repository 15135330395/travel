<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/desk/info.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Magz旅行社</title>
</head>
<body class="skin-orange">
<!-- 头部开始 -->
<jsp:include page="/desk/header.jsp"/>
<!-- 头部结束 -->

<section class="home">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12 col-xs-12">

                    <!-- 轮播图开始 -->
                    <div class="owl-carousel owl-theme slide" id="featured">
                        <c:forEach begin="0" end="3" var="i">
                            <div class="item">
                                <article class="featured">
                                    <div class="overlay"></div>
                                    <figure>
                                        <img src="/uploadImage/${attractions[i].imageUrl}" alt="${attractions[i].attractionName}">
                                    </figure>
                                    <div class="details">
                                        <h1><a href="<%=request.getContextPath()%>/attraction/detail/${attractions[i].attractionId}">${attractions[i].attractionName}</a></h1>
                                    </div>
                                </article>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- 轮播图结束 -->


                    <div class="line">
                    <div>世界风光</div>
                </div>
                <div class="row">
                    <c:forEach begin="0" end="3" var="i">
                        <c:if test="${i%2!=1}">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                            <article class="article col-md-12">
                                <div class="inner">
                                    <figure>
                                        <a href="<%=request.getContextPath()%>/attraction/detail/${attractions[i].attractionId}">
                                            <img src="/uploadImage/${attractions[i].imageUrl}">
                                        </a>
                                    </figure>
                                    <div class="padding">
                                        <h2><a href="<%=request.getContextPath()%>/attraction/detail/${attractions[i].attractionId}">${attractions[i].attractionName}</a></h2>
                                        <footer>
                                                <c:forEach items="${prices}" var="price">
                                                    <c:if test="${price.attractionId == attractions[i].attractionId}">
                                                            <c:if test="${2 == price.typeId}">
                                                                <h6><option value="${price.price}">散客游:${price.price}</option></h6>
                                                            </c:if>
                                                    </c:if>
                                                </c:forEach>

                                            <a class="btn btn-primary more" href="<%=request.getContextPath()%>/attraction/detail/${attractions[i].attractionId}">
                                                <div>更多</div>
                                                <div><i class="ion-ios-arrow-thin-right"></i></div>
                                            </a>
                                        </footer>
                                    </div>
                                </div>
                            </article>
                        </c:if>
                        <c:if test="${i%2==1}">
                            <article class="article col-md-12">
                                <div class="inner">
                                    <figure>
                                        <a href="<%=request.getContextPath()%>/attraction/detail/${attractions[i].attractionId}">
                                            <img src="/uploadImage/${attractions[i].imageUrl}">
                                        </a>
                                    </figure>
                                    <div class="padding">
                                            <h2><a href="<%=request.getContextPath()%>/attraction/detail/${attractions[i].attractionId}">${attractions[i].attractionName}</a></h2>
                                        <footer>
                                                <c:forEach items="${prices}" var="price">
                                                    <c:if test="${price.attractionId == attractions[i].attractionId}">
                                                            <c:if test="${2 == price.typeId}">
                                                                <h6><option value="${price.price}">散客游:${price.price}</option></h6>
                                                            </c:if>
                                                    </c:if>
                                                </c:forEach>
                                           <a class="btn btn-primary more" href="<%=request.getContextPath()%>/attraction/detail/${attractions[i].attractionId}">
                                                <div>更多</div>
                                                <div><i class="ion-ios-arrow-thin-right"></i></div>
                                            </a>
                                        </footer>
                                    </div>
                                </div>
                            </article>
                            </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="banner">
                    <a href="#">
                        <img src="<%=request.getContextPath()%>/desk/images/ads.png" alt="广告">
                    </a>
                </div>

                    <div class="line transparent little"></div>
                <div class="row">
                </div>
                <div class="row">
                    <c:forEach items="${newsByTypeList}" var="newsList">
                        <article class="col-md-12 article-list">
                            <div class="inner">
                                <figure>
                                    <a href="<%=request.getContextPath()%>/${newsList.get(1).newsId}">
                                        <img src="<%=request.getContextPath()%>/${newsList.get(1).imageUrl}" alt="${newsList.get(1).newsTitle}">
                                    </a>
                                </figure>
                                <div class="details">
                                    <div class="detail">
                                        <div class="category">
                                            <a href="#">${newsList.get(1).newsType.typeName}</a>
                                        </div>
                                    </div>
                                    <h1><a href="<%=request.getContextPath()%>/desk/single.jsp">${newsList.get(1).newsTitle}</a></h1>
                                    <footer>
                                        <a class="btn btn-primary more" href="<%=request.getContextPath()%>/${newsList.get(1).newsId}">
                                            <div>更多</div>
                                            <div><i class="ion-ios-arrow-thin-right"></i></div>
                                        </a>
                                    </footer>
                                </div>
                            </div>
                        </article>
                    </c:forEach>
                </div>
            </div>

            <div class="col-xs-6 col-md-4 sidebar" id="sidebar">
                <div class="sidebar-title for-tablet">Sidebar</div>
                <!-- 用户界面开始 -->
                <aside>
                    <div class="aside-body">
                        <div class="featured-author">
                            <div class="featured-author-inner">
                                <div class="featured-author-cover"
                                     style="background-image: url('<%=request.getContextPath()%>/desk/images/news/img15.jpg');">
                                    <div class="badges">
                                        <div class="badge-item"><i
                                                class="ion-star"></i>${user==null?"您还没有登录":user.email}
                                        </div>
                                    </div>
                                    <div class="featured-author-center">
                                        <figure class="featured-author-picture">
                                            <img src="<%=request.getContextPath()%>/desk/images/img01.jpg" alt="Sample Article">
                                        </figure>
                                        <div class="featured-author-info">
                                            <h2 class="name">${user==null?"尚未登录":user.email}</h2>
                                            <div class="desc">${user.email}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
                <!-- 用户界面结束 -->

                <aside>
                    <h1 class="aside-title">活动
                    </h1>
                    <div class="aside-body">
                        <c:forEach begin="0" end="3" var="i">
                            <article class="article-mini">
                                <div class="inner">
                                    <figure>
                                        <a href="<%=request.getContextPath()%>/attraction/detail/${attractions[i].attractionId}">
                                            <img src="/uploadImage/${attractions[i].imageUrl}">
                                        </a>
                                    </figure>
                                    <div class="padding">
                                        <h1><a href="<%=request.getContextPath()%>/attraction/detail/${attractions[i].attractionId}">${attractions[i].attractionName}</a></h1>
                                        <c:forEach items="${prices}" var="price">
                                            <c:if test="${price.attractionId == attractions[i].attractionId}">
                                                <c:if test="${1 == price.typeId}">
                                                    <h6><option value="${price.price}">组团游:${price.price}</option></h6>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
                </aside>

                <!-- 友情链接开始 -->
                <aside id="sponsored">
                    <h1 class="aside-title">友情链接</h1>
                    <div class="aside-body">
                        <ul class="sponsored">
                            <li>
                                <a href="https://www.bilibili.com/">
                                    <img src="<%=request.getContextPath()%>/desk/images/link/timg.jpg" alt="${1}.jpg">
                                </a>
                            </li>
                            <li>
                                <a href="https://www.baidu.com/">
                                    <img src="<%=request.getContextPath()%>/desk/images/link/${2}.jpg" alt="${2}.jpg">
                                </a>
                            </li>
                            <li>
                                <a href="https://www.csdn.net/">
                                    <img src="<%=request.getContextPath()%>/desk/images/link/${3}.jpg" alt="${3}.jpg">
                                </a>
                            </li>
                            <li>
                                <a href="https://github.com/">
                                    <img src="<%=request.getContextPath()%>/desk/images/link/${4}.jpg" alt="${4}.jpg">
                                </a>
                            </li>
                            <li>
                                <a href="https://www.google.cn/">
                                    <img src="<%=request.getContextPath()%>/desk/images/link/${5}.jpg" alt="${5}.jpg">
                                </a>
                            </li>
                            <li>
                                <a href="https://im.qq.com/">
                                    <img src="<%=request.getContextPath()%>/desk/images/link/${6}.jpg" alt="${6}.jpg">
                                </a>
                            </li>
                        </ul>
                    </div>
                </aside>
                <!-- 友情链接结束 -->

            </div>
        </div>
    </div>
</section>
<!-- 底部开始 -->
<jsp:include page="../footer.jsp"/>
<!-- 底部结束 -->
</body>
</html>