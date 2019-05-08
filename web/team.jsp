<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/background/commons/info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>景点列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <![endif]-->
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="<%=request.getContextPath()%>/index.jsp">首页</a>
        <a>
          <cite>景点信息管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <span class="x-right" style="line-height:40px">共有数据：${pageBean.count} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>名称</th>
            <th>路径</th>
            <th>价格</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${attractionList}" var="attractionList">
            <tr>
                <td>
                    <a href="<%=request.getContextPath()%>/attraction/detail/${attractionList.attractionId}">${attractionList.attractionName}</a>
                </td>
                <td>${attractionList.route}</td>
                <td>
                    <c:forEach items="${prices}" var="price">
                        <c:if test="${price.attractionId == attractionList.attractionId}">
                            <c:forEach items="${types}" var="type">
                                <c:if test="${type.typeId == price.typeId}">
                                    <option value="${price.price}">${type.typeName}:${price.price}</option>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <c:if test="${pageBean.index>1}">
                <a class="上一页"
                   href="<%=request.getContextPath()%>/attraction/placeList?index=${pageBean.index-1}">上一页</a>
            </c:if>
            <c:if test="${pageBean.index<=1 || pageBean.index == 0}">
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${i==pageBean.index}">
                    <span class="current">
                            ${i}
                    </span>
                </c:if>
                <c:if test="${i!=pageBean.index}">
                    <a class="num" href="<%=request.getContextPath()%>/attraction/placeList?index=${i}">
                            ${i}
                    </a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.index < pageBean.pages}">
                <a class="下一页"
                   href="<%=request.getContextPath()%>/attraction/placeList?index=${pageBean.index+1}">下一页</a>
            </c:if>
            <c:if test="${pageBean.index >= pageBean.pages || pageBean.index == 0}">
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
