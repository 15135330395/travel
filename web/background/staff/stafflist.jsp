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
          <cite>员工管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">

    <xblock>
        <button class="layui-btn"
                onclick="x_admin_show('添加员工','<%=request.getContextPath()%>/background/staff/staffadd.jsp')">
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
            <th>员工姓名</th>
            <th>性别</th>
            <th>身份证号</th>
            <th>电话号</th>
            <th>职位</th>
            <th>工作地点</th>
            <th>用户设置</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${staffList}" var="link">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${link.staffId}'>
                        <i class="layui-icon">&#xe605;</i>
                    </div>
                </td>
                <td>${link.staffId}</td>
                <td>${link.staffName}</td>
                <td>${link.staffSex}</td>
                <td>${link.cardId}</td>
                <td>${link.phone}</td>
                <td>${link.job}</td>
                <td>${link.workplace}</td>
                <td class="td-manage">
                    <c:if test="${link.admin==null}">
                        <a title="添加用户" class="layui-btn layui-btn-normal layui-btn-xs"
                           onclick="layer.open({
                                   title: '设置用户名',
                                   type: 2,
                                   skin: 'layui-layer-rim', // 加上边框
                                   area: [$(window).width() * 0.9 + 'px', $(window).height() * 0.9 + '420px'], // 宽高
                                   content: '<%=request.getContextPath()%>/staff/to/${link.staffId}'
                                   });">添加用户
                        </a>
                    </c:if>
                    <c:if test="${link.admin!=null}">
                        <a class="layui-btn layui-btn-normal layui-btn-xs">已添加用户</a>
                    </c:if>
                </td>
                <td class="td-manage">
                    <a title="查看"
                       onclick="x_admin_show('编辑','<%=request.getContextPath()%>/staff/queryOne/${link.staffId}')"
                       href="javascript:;">
                        <i class="layui-icon">&#xe63c;</i>
                    </a>
                    <a title="删除" onclick="link_del(this,'${link.staffId}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
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
                   href="<%=request.getContextPath()%>/staff/list?index=${pageBean.index-1}">&lt;&lt;</a>
            </c:if>
            <c:if test="${pageBean.index<=1}">
                <a class="prev"
                   href="<%=request.getContextPath()%>/staff/list?index=${pageBean.index}">&lt;&lt;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${i==pageBean.index}">
                    <span class="current">
                            ${i}
                    </span>
                </c:if>
                <c:if test="${i!=pageBean.index}">
                    <a class="num" href="<%=request.getContextPath()%>/staff/list?index=${i}">
                            ${i}
                    </a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.index<pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/staff/list?index=${pageBean.index+1}">&gt;&gt;</a>
            </c:if>
            <c:if test="${pageBean.index>=pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/staff/list?index=${pageBean.index}">&gt;&gt;</a>
            </c:if>
        </div>
    </div>
</div>
<script>
    /*友情链接-删除*/
    function link_del(obj, staffId) {
        layer.confirm('确认要删除吗？', function () {
            //发异步 删除数据
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/staff/delete/" + staffId,
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

    function delAll() {
        var data = tableCheck.getData();
        if (data == "") {
            layer.msg('请至少选择1条数据');
            return;
        }
        layer.confirm('确认要删除这些信息吗？', function () {
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/staff/deleteAll/+ data",
                data: {},
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
