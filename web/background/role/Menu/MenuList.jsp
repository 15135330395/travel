<%--
  Created by IntelliJ IDEA.
  User: 15087
  Date: 2019/3/31
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/background/commons/info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>权限管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <!-- css和js的引用封装在info.jsp -->
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="#">首页</a>
        <a>
          <cite>权限管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <button class="layui-btn"
                onclick="layer.open({
                        title: '添加权限',
                        type: 2,
                        closeBtn: 1,
                        skin: 'layui-layer-rim', // 加上边框
                        area: ['451px', '405px'], // 宽高
                        content: '<%=request.getContextPath()%>/background/role/Menu/AddMenu.jsp'
                        });">
            <i class="layui-icon"></i>添加
        </button>
        <span class="x-right" style="line-height:40px">共有数据：<i>${pageBean.count}</i> 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>编号</th>
            <th>权限名称</th>
            <th>父节点编号</th>
            <th>图标</th>
            <th>访问路径</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${menuList}" var="menu">
            <tr>
                <td>${menu.menuId}</td>
                <td>${menu.menuName}</td>
                <td>${menu.parentId}</td>
                <td>${menu.img}</td>
                <td>${menu.url}</td>
                <td class="td-manage">
                    <a title="修改" class="layui-btn layui-btn-xs" onclick="layer.open({
                            title: '修改权限',
                            type: 2,
                            closeBtn: 1,
                            skin: 'layui-layer-rim', // 加上边框
                            area: ['451px', '405px'], // 宽高
                            content: '<%=request.getContextPath()%>/menu/${menu.menuId}'
                            });">修改</a>
                    <a title="删除" class="layui-btn layui-btn-danger layui-btn-xs"
                       onclick="menu_del(this,'${menu.menuId}')" href="javascript:;">删除
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <c:if test="${pageBean.index>1}">
                <a class="prev"
                   href="<%=request.getContextPath()%>/menu/all?index=${pageBean.index-1}">&lt;&lt;</a>
            </c:if>
            <c:if test="${pageBean.index<=1}">
                <a class="prev"
                   href="<%=request.getContextPath()%>/menu/all?index=${pageBean.index}">&lt;&lt;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${i==pageBean.index}">
                    <span class="current">
                            ${i}
                    </span>
                </c:if>
                <c:if test="${i!=pageBean.index}">
                    <a class="num" href="<%=request.getContextPath()%>/menu/all?index=${i}">
                            ${i}
                    </a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.index<pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/menu/all?index=${pageBean.index+1}">&gt;&gt;</a>
            </c:if>
            <c:if test="${pageBean.index>=pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/menu/all?index=${pageBean.index}">&gt;&gt;</a>
            </c:if>
        </div>
    </div>
</div>
<script>
    /*权限-删除*/
    function menu_del(obj, menuId) {
        layer.confirm('确认要删除吗？', function () {
            //发异步 删除数据
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/menu/delete/" + menuId,
                data: {},
                success: function (msg) {
                    if (msg == 1) {
                        layer.alert("删除成功", {icon: 6});
                    } else {
                        layer.msg('已被删除或不存在', {icon: 1, time: 2000});
                    }
                    $(obj).parents("tr").remove();
                },
                error: function () {
                    layer.msg("删除异常")
                }
            });
        });
    }
</script>
</body>
</html>