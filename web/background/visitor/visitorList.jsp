<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/28
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/info.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>游客管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />

</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="#"><cite>首页</cite></a>
        <a><cite>游客管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <%--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>--%>
        <button class="layui-btn" onclick="x_admin_show('添加游客','<%=request.getContextPath()%>/background/visitor/visitorAdd.jsp')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${pageBean.count} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>游客编号</th>
            <th>游客姓名</th>
            <th>身份证号</th>
            <th>手机号码</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${visitorList}" var="visitor">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${visitor.visitorId}'><i class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${visitor.visitorId}</td>
                <td>${visitor.visitorName}</td>
                <td>${visitor.cardId}</td>
                <td>${visitor.phone}</td>
                <td class="td-manage">
                    <a title="查看"  onclick="x_admin_show('编辑','<%=request.getContextPath()%>/visitor/toupdate/${visitor.visitorId}')" href="javascript:;">
                        <i class="layui-icon">&#xe63c;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${visitor.visitorId}')" href="javascript:;">
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
                <a class="prev" href="<%=request.getContextPath()%>/visitor/visitorByPageBean?index=${pageBean.index-1}">&lt;&lt;</a>
            </c:if>

            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${i==pageBean.index}">
                    <span class="current">${i}</span>
                </c:if>
                <c:if test="${i!=pageBean.index}">
                    <a class="num" href="<%=request.getContextPath()%>/visitor/visitorByPageBean?index=${i}">${i}</a>
                </c:if>
            </c:forEach>

            <c:if test="${pageBean.index < pageBean.pages}">
                <a class="next" href="<%=request.getContextPath()%>/visitor/visitorByPageBean?index=${pageBean.index+1}">&gt;&gt;</a>
            </c:if>

        </div>
    </div>

</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*游客-删除*/
    function member_del(obj,visitorId){
        layer.confirm('确认要删除吗？',function(){
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/visitor/deleteVisitor",
                data:{
                    visitorId:visitorId
                },
                success:function(msg){
                    if(msg==1){
                        layer.msg('删除成功!',{icon:1,time:1000});
                    }else{
                        layer.msg('已删除或不存在!',{icon:1,time:1000});
                    }
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                }
            })
        });
    }

    <%--function delAll (argument) {--%>

        <%--var data = tableCheck.getData();--%>
        <%--if(data==""){--%>
            <%--layer.msg('请至少选择1条数据');--%>
            <%--return;--%>
        <%--}--%>
        <%--layer.confirm('确认要删除这些信息吗？',function(index){--%>
            <%--$.ajax({--%>
                <%--type:"post",--%>
                <%--url:"<%=request.getContextPath()%>/BuildingServlet",--%>
                <%--data:"action=deleteAll&ids="+data,--%>
                <%--success:function(msg){--%>
                    <%--if(msg>0){--%>
                        <%--//捉到所有被选中的，发异步进行删除--%>
                        <%--layer.msg('成功删除'+msg+'条数据', {icon: 1})--%>
                    <%--}else{--%>
                        <%--layer.msg('已删除或不存在!',{icon:1,time:1000});--%>
                    <%--}--%>
                    <%--$(".layui-form-checked").not('.header').parents('tr').remove();--%>
                <%--}--%>
            <%--});--%>

        <%--});--%>
    <%--}--%>
</script>
</body>

</html>
