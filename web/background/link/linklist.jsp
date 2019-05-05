<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/20 0020
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../commons/info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>友情链接管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <!-- css和js的引用封装在info.jsp -->
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="#">首页</a>
        <a>
          <cite>友情链接管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input type="text" name="username" placeholder="请输入链接名称" autocomplete="off" class="layui-input">
            <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button class="layui-btn"
                onclick="x_admin_show('添加友情链接','<%=request.getContextPath()%>/background/link/linkadd.jsp')">
            <i class="layui-icon"></i>添加
        </button>
        <button class="layui-btn layui-btn-danger" onclick="delAll()">
            <i class="layui-icon"></i>批量删除
        </button>
        <span class="x-right" style="line-height:40px">共有数据：${pageBean.count} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i
                        class="layui-icon">&#xe605;</i></div>
            </th>
            <th>编号</th>
            <th>名称</th>
            <th>地址</th>
            <th>联系方式</th>
            <th>排名</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${linkList}" var="link">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${link.linkId}'>
                        <i class="layui-icon">&#xe605;</i>
                    </div>
                </td>
                <td>${link.linkId}</td>
                <td>${link.linkName}</td>
                <td>${link.linkUrl}</td>
                <td>${link.email}</td>
                <td>${link.linkOrder}</td>
                <td class="td-manage">
                    <a title="查看"
                       onclick="x_admin_show('编辑','<%=request.getContextPath()%>/LinkServletBg?action=findLinkByLinkId&linkId=${link.linkId}')"
                       href="javascript:;">
                        <i class="layui-icon">&#xe63c;</i>
                    </a>
                    <a title="删除" onclick="link_del(this,'${link.linkId}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <c:if test="${pageBean.pageIndex>1}">
                <a class="prev"
                   href="<%=request.getContextPath()%>/LinkServletBg?action=getAllLink&pageIndex=${pageBean.pageIndex-1}">&lt;&lt;</a>
            </c:if>
            <c:if test="${pageBean.pageIndex<=1}">
                <a class="prev"
                   href="<%=request.getContextPath()%>/LinkServletBg?action=getAllLink&pageIndex=${pageBean.pageIndex}">&lt;&lt;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${i==pageBean.pageIndex}">
                    <span class="current">
                            ${i}
                    </span>
                </c:if>
                <c:if test="${i!=pageBean.pageIndex}">
                    <a class="num" href="<%=request.getContextPath()%>/LinkServletBg?action=getAllLink&pageIndex=${i}">
                            ${i}
                    </a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.pageIndex<pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/LinkServletBg?action=getAllLink&pageIndex=${pageBean.pageIndex+1}">&gt;&gt;</a>
            </c:if>
            <c:if test="${pageBean.pageIndex>=pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/LinkServletBg?action=getAllLink&pageIndex=${pageBean.pageIndex}">&gt;&gt;</a>
            </c:if>

        </div>
    </div>

</div>
<script>
    /*友情链接-删除*/
    function link_del(obj, linkId) {
        layer.confirm('确认要删除吗？', function () {
            //发异步 删除数据
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/LinkServletBg",
                data: {
                    action: "deleteLink",
                    linkId: linkId
                },
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

    function delAll() {
        var data = tableCheck.getData();
        if (data == "") {
            layer.msg('请至少选择1条数据');
            return;
        }
        layer.confirm('确认要删除这些信息吗？', function () {
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/LinkServletBg",
                data: {
                    action: "deleteAll",
                    links: "" + data
                },
                success: function (msg) {
                    if (msg > 0) {
                        layer.alert("成功删除" + msg + "条数据", {icon: 6});
                    } else {
                        layer.msg('已被删除或不存在', {icon: 1, time: 2000});
                    }
                    //捉到所有被选中的，发异步进行删除
                    $(".layui-form-checked").not('.header').parents('tr').remove();
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
