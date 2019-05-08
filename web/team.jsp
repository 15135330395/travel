<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/background/commons/info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>组团列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="<%=request.getContextPath()%>/index.jsp">首页</a>
        <a>
          <cite>组团信息管理</cite></a>
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
            <th>景点名称</th>
            <th>导游姓名</th>
            <th>导游性别</th>
            <th>导游联系方式</th>
            <th>出发时间</th>
            <th>预计人数</th>
            <th>当前人数</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${teamList}" var="teamList">
            <tr>
                <td>${teamList.attraction.attractionName}</td>
                <td>${teamList.staff.staffName}</td>
                <td>${teamList.staff.staffSex}</td>
                <td>${teamList.staff.phone}</td>
                <td>${teamList.departure}</td>
                <td>${teamList.predict}</td>
                <c:if test="${teamList.current!=null}">
                    <td>${teamList.current}</td>
                    <td class="td-manage">
                        <c:if test="${teamList.current < teamList.predict}" >
                            <a title="参团" href="<%=request.getContextPath()%>/foreground/teamOrder/${teamList.teamId}">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </c:if>
                        <c:if test="${teamList.current == teamList.predict}" >
                            <a title="已满"  >
                                <i class="layui-icon">&#xe63c;</i>
                            </a>
                        </c:if>
                    </td>
                </c:if>
                <c:if test="${teamList.current==null}">
                    <td>0</td>
                    <td class="td-manage">
                        <a title="参团" href="<%=request.getContextPath()%>/foreground/teamOrder/${teamList.teamId}">
                            <i class="layui-icon">&#xe63c;</i>
                        </a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>