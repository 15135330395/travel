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
    <title>景点信息管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <![endif]-->
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="#">首页</a>
        <a>
          <cite>景点信息管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <button class="layui-btn"
                onclick="x_admin_show('添加','<%=request.getContextPath()%>/background/attraction/attractionAdd.jsp')">
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
            <th>路径</th>
            <th>价格</th>
            <th>图片路径</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${attractionList}" var="attractionList">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${attractionList.attractionId}'>
                        <i class="layui-icon">&#xe605;</i>
                    </div>
                </td>
                <td>${attractionList.attractionId}</td>
                <td>${attractionList.attractionName}</td>
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
                <td>${attractionList.imageUrl}</td>
                <td class="td-manage">
                    <a title="查看"
                       onclick="x_admin_show('编辑','<%=request.getContextPath()%>/attraction/update/${attractionList.attractionId}')"
                       href="javascript:;">
                        <i class="layui-icon">&#xe63c;</i>
                    </a>
                    <a title="删除" onclick="link_del(this,'${attractionList.attractionId}')" href="javascript:;">
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
                   href="<%=request.getContextPath()%>/attraction/all?index=${pageBean.pageIndex-1}">&lt;&lt;</a>
            </c:if>
            <c:if test="${pageBean.pageIndex<=1}">
                <a class="prev"
                   href="<%=request.getContextPath()%>/attraction/all?index=${pageBean.pageIndex}">&lt;&lt;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${i==pageBean.pageIndex}">
                    <span class="current">
                            ${i}
                    </span>
                </c:if>
                <c:if test="${i!=pageBean.pageIndex}">
                    <a class="num" href="<%=request.getContextPath()%>/attraction/all?index=${i}">
                            ${i}
                    </a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.pageIndex<pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/attraction/all?index=${pageBean.pageIndex+1}">&gt;&gt;</a>
            </c:if>
            <c:if test="${pageBean.pageIndex>=pageBean.pages}">
                <a class="next"
                   href="<%=request.getContextPath()%>/attraction/all?index=${pageBean.pageIndex}">&gt;&gt;</a>
            </c:if>
        </div>
    </div>
</div>
<script>
    /*友情链接-删除*/
    function link_del(obj, attractionId) {
        layer.confirm('确认要删除吗？', function () {
       /*alert(attractionId)*/
            //发异步 删除数据
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/attraction/delete",
                data: {
                    attractionId: attractionId
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
                url: "<%=request.getContextPath()%>/attraction/deleteList",
                data: {
                    ids: "" + data
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
