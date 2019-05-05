<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/20
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="static/info.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>景点列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>


<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="index.jsp"><cite>首页</cite></a>
        <a><cite>景点列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
        <span class="x-right" style="line-height:40px">共有数据：${pageBean.count} 条</span>
    <table class="layui-table">
        <thead>
        <tr>
            <th>景点名称</th>
            <th>图片</th>
            <th>路径</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${attractionList}" var="list">
            <tr>
                <td><a href="<%=request.getContextPath()%>/attraction/detail/${list.attractionId}">${list.attractionName}</a></td>
                <td><img src="<%=request.getContextPath()%>/background/image/${list.imageUrl}"></td>
                <td>${list.route}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <a class="prev" href="">&lt;&lt;</a>
            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${i==pageBean.pageIndex}">
                    <span class="current">${i}</span>
                </c:if>
                <c:if test="${i!=pageBean.pageIndex}">
                    <a class="num" href="<%=request.getContextPath()%>/controllr/method/${i}">${i}</a>
                </c:if>
            </c:forEach>
            <a class="next" href="">&gt;&gt;</a>
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

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/LinkServlet",
                data:"action=delete&kid="+id,
                success:function(msg){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    if(msg==1){
                        layer.msg('删除成功!',{icon:1,time:1000});
                    }else{
                        layer.msg('已删除或不存在!',{icon:1,time:1000});
                    }
                }
            })
        });
    }

    function delAll (argument) {

        var data = tableCheck.getData();
        if(data==""){
            layer.msg('请至少选择1条数据');
            return;
        }
        layer.confirm('确认要删除这些信息吗？',function(index){
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/LinkServlet",
                data:"action=deleteAll&ids="+data,
                success:function(msg){
                    if(msg>0){
                        //捉到所有被选中的，发异步进行删除
                        layer.msg('成功删除'+msg+'条数据', {icon: 1})
                    }else{
                        layer.msg('已删除或不存在!',{icon:1,time:1000});
                    }
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                }
            });

        });
    }
</script>
</body>

</html>