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
    <title>数据库备份管理</title>
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
          <cite>备份管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <button class="layui-btn"
                onclick="file_backup()">
            <i class="layui-icon"></i>备份
        </button>
        <span class="x-right" style="line-height:40px">共有数据：<i>${pageBean.count}</i> 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>文件编号</th>
            <th>文件名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dbFileList}" var="file">
            <tr>
                <td>${file.recoverId}</td>
                <td>${file.fileName}</td>
                <td class="td-manage">
                    <a title="恢复" class="layui-btn layui-btn-normal layui-btn-xs"
                       onclick="file_restore(this,'${file.recoverId}')" href="javascript:;">恢复
                    </a>
                    <a title="删除" class="layui-btn layui-btn-danger layui-btn-xs"
                       onclick="file_del(this,'${file.recoverId}')" href="javascript:;">删除
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
                   href="<%=request.getContextPath()%>/db/all?index=${pageBean.index-1}">&lt;&lt;</a>
            </c:if>
            <c:if test="${pageBean.index<=1}">
                <a class="prev"
                   href="<%=request.getContextPath()%>/db/all?index=${pageBean.index}">&lt;&lt;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${i==pageBean.index}">
                    <span class="current">
                            ${i}
                    </span>
                </c:if>
                <c:if test="${i!=pageBean.index}">
                    <a class="num" href="<%=request.getContextPath()%>/db/all?index=${i}">
                            ${i}
                    </a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.index<pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/db/all?index=${pageBean.index+1}">&gt;&gt;</a>
            </c:if>
            <c:if test="${pageBean.index>=pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/db/all?index=${pageBean.index}">&gt;&gt;</a>
            </c:if>
        </div>
    </div>
</div>
<script>
    /*数据库-备份*/
    function file_backup() {
        layer.confirm('确认要备份吗？', function () {
            //发异步 删除数据
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/db/backup/",
                data: {},
                success: function (msg) {
                    if (msg != null) {
                        layer.alert("备份成功", {icon: 6});
                    } else {
                        layer.msg('备份失败', {icon: 1, time: 2000});
                    }
                    setTimeout(function () {
                        location.reload();
                    }, 3000);
                },
                error: function () {
                    layer.msg("备份异常")
                }
            });
        });
    }

    /*数据库-恢复*/
    function file_restore(obj, recoverId) {
        layer.confirm('确认要恢复吗？', function () {
            //发异步 删除数据
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/db/restore/" + recoverId,
                data: {},
                success: function (msg) {
                    if (msg == 1) {
                        layer.alert("恢复成功", {icon: 6});
                    } else {
                        layer.msg('恢复失败', {icon: 1, time: 2000});
                    }
                    setTimeout(function () {
                        location.reload();
                    }, 3000);
                },
                error: function () {
                    layer.msg("恢复异常")
                }
            });
        });
    }

    /*数据库-删除*/
    function file_del(obj, recoverId) {
        layer.confirm('确认要删除吗？（只删除表信息）', function () {
            //发异步 删除数据
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/db/delete/" + recoverId,
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