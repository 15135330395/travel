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
    <title>用户管理</title>
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
          <cite>用户管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <%--<xblock>--%>
        <%--<button class="layui-btn"--%>
                <%--onclick="layer.open({--%>
                        <%--title: '添加用户',--%>
                        <%--type: 2,--%>
                        <%--closeBtn: 1,--%>
                        <%--skin: 'layui-layer-rim', // 加上边框--%>
                        <%--area: ['348px', '221px'], // 宽高--%>
                        <%--content: '<%=request.getContextPath()%>/background/admin/adminadd.jsp'--%>
                        <%--});">--%>
            <%--<i class="layui-icon"></i>添加--%>
        <%--</button>--%>
        <%--<span class="x-right" style="line-height:40px">共有数据：<i>${pageBean.count}</i> 条</span>--%>
    <%--</xblock>--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>编号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>员工姓名</th>
            <th>角色名</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${adminList}" var="admin">
            <tr>
                <td>${admin.adminId}</td>
                <td>${admin.adminName}</td>
                <td>${admin.password}</td>
                <td>${admin.staff.staffName}</td>
                <td>${admin.role.roleName}</td>
                <td class="td-manage">
                    <a title="修改" class="layui-btn layui-btn-xs" onclick="layer.open({
                            title: '修改用户',
                            type: 2,
                            closeBtn: 1,
                            skin: 'layui-layer-rim', // 加上边框
                            area: ['451px', '405px'], // 宽高
                            content: '<%=request.getContextPath()%>/admin/queryOne/${admin.adminId}'
                            });">修改</a>
                    <a title="删除" class="layui-btn layui-btn-danger layui-btn-xs"
                       onclick="admin_del(this,'${admin.adminId}')" href="javascript:;">删除
                    </a>
                    <a title="赋予角色" class="layui-btn layui-btn-normal layui-btn-xs"
                       onclick="layer.open({
                               title: '赋予角色',
                               type: 2,
                               skin: 'layui-layer-rim', // 加上边框
                               area: [$(window).width() * 0.9 + 'px', $(window).height() * 0.9 + '620px'], // 宽高
                               content: '<%=request.getContextPath()%>/admin/to/${admin.adminId}'
                               });">赋予角色
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
                   href="<%=request.getContextPath()%>/admin/list?index=${pageBean.index-1}">&lt;&lt;</a>
            </c:if>
            <c:if test="${pageBean.index<=1}">
                <a class="prev"
                   href="<%=request.getContextPath()%>/admin/list?index=${pageBean.index}">&lt;&lt;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${i==pageBean.index}">
                    <span class="current">
                            ${i}
                    </span>
                </c:if>
                <c:if test="${i!=pageBean.index}">
                    <a class="num" href="<%=request.getContextPath()%>/admin/list?index=${i}">
                            ${i}
                    </a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.index<pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/admin/list?index=${pageBean.index+1}">&gt;&gt;</a>
            </c:if>
            <c:if test="${pageBean.index>=pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/admin/list?index=${pageBean.index}">&gt;&gt;</a>
            </c:if>
        </div>
    </div>
</div>
<script>
    /*用户-删除*/
    function admin_del(obj, adminId) {
        layer.confirm('确认要删除吗？', function () {
            //发异步 删除数据
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/admin/delete/" + adminId,
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