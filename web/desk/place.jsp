<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="info.jsp" %>
<html>
<head>
    <title>Magz旅行社</title>
</head>

<body>
<!-- 头部开始 -->
<jsp:include page="header.jsp"/>
<!-- 头部结束 -->

<section class="category">
    <div class="container">
        <div class="row">
            <div class="col-md-8 text-left">
                <div class="row">
                    <div class="col-md-12">
                        <ol class="breadcrumb">
                            <li>
                                <a href="<%=request.getContextPath()%>/attraction/changePlace">首页</a>
                            </li>
                            <li class="active">景点列表</li>
                        </ol>
                        <h1 class="page-title">景点列表</h1>
                    </div>
                </div>
                <div class="line"></div>
                <div class="row">
                    <c:forEach items="${attractionList}" var="attractionList">
                    <article class="col-md-12 article-list">
                        <div class="inner">
                            <figure>
                                <a href="<%=request.getContextPath()%>/attraction/detail/${attractionList.attractionId}">
                                    <img src="<%=request.getContextPath()%>/background/image/${attractionList.imageUrl}">
                                </a>
                            </figure>
                            <div class="details">
                                <div class="detail">
                                    <div class="category">
                                        <%--<a href="<%=request.getContextPath()%>/attraction/detail/${attractionList.attractionId}">${attractionList.attractionName}</a>--%>
                                    </div>
                                </div>
                                <h1><a href="<%=request.getContextPath()%>/attraction/detail/${attractionList.attractionId}">${attractionList.attractionName}</a></h1>
                                <p>
                                        ${attractionList.route}
                                </p>
                                <footer>
                                    <c:forEach items="${prices}" var="price">
                                        <c:if test="${price.attractionId == attractionList.attractionId}">
                                            <c:forEach items="${types}" var="type">
                                                <c:if test="${type.typeId == price.typeId}">
                                                    <option value="${price.price}">${type.typeName}:${price.price}</option>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                    <a class="btn btn-primary more" href="<%=request.getContextPath()%>/attraction/detail/${attractionList.attractionId}">
                                        <div>更多</div>
                                        <div><i class="ion-ios-arrow-thin-right"></i></div>
                                    </a>
                                </footer>
                            </div>
                        </div>
                    </article>
                    </c:forEach>

                    <!-- 分页开始 -->
                    <div class="col-md-12 text-center">
                        <ul class="pagination">

                            <c:if test="${pageBean.index>1}">
                                <li class="prev">
                                    <a href="<%=request.getContextPath()%>/attraction/placeList?index=${pageBean.index-1}"><i class="ion-ios-arrow-left"></i></a>
                                </li>
                            </c:if>
                            <c:if test="${pageBean.index<=1 || pageBean.index == 0}">
                            </c:if>

                            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                                <c:if test="${i==pageBean.index}">
                                    <li class="active">
                                        <a>${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${i!=pageBean.index}">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/attraction/placeList?index=${i}">
                                                ${i}
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${pageBean.index < pageBean.pages}">
                                <li class="next">
                                    <a href="<%=request.getContextPath()%>/attraction/placeList?index=${pageBean.index+1}"><i class="ion-ios-arrow-right"></i></a>
                                </li>
                            </c:if>
                            <c:if test="${pageBean.index >= pageBean.pages || pageBean.index == 0}">
                            </c:if>
                        </ul>
                        <div class="pagination-help-text">
                        </div>
                    </div>
                    <!-- 分页结束 -->

                </div>
            </div>
            <div class="col-md-4 sidebar">
                <aside>
                    <div class="aside-body">
                        <figure class="ads">
                            <a>
                                <img src="<%=request.getContextPath()%>/desk/images/ad.png">
                            </a>
                        </figure>
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
        </div>
    </div>
</section>

<!-- 底部开始 -->
<jsp:include page="../footer.jsp"/>
<!-- 底部结束 -->

</body>
</html>