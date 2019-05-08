<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="static/info.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/desk/js/jquery.min.js"></script>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的订单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="<%=request.getContextPath()%>/index.jsp"><cite>首页</cite></a>
        <a><cite>我的订单</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <table class="layui-table">
        <thead>
        <tr>
            <th>类型</th>
            <th>目的地</th>
            <th>导游姓名</th>
            <th>导游性别</th>
            <th>导游联系方式</th>
            <th>组团信息</th>
            <th>旅游路线</th>
            <th>出发时间</th>
            <th>集合地点</th>
            <th>订单金额总计</th>
            <th>订单状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderList}" var="link">
            <tr>
                <td>${link.type.typeName}</td>
                <td>${link.attraction.attractionName}</td>
                <td>${link.staff.staffName}</td>
                <td>${link.staff.staffSex}</td>
                <td>${link.staff.phone}</td>
                <td width="240px">
                    <c:forEach items="${link.visitorList}" var="visitor">
                        姓名：${visitor.visitorName}<br>
                        身份证号：${visitor.cardId}<br>
                        联系方式：${visitor.phone} <hr>
                    </c:forEach>
                </td>

                <td>${link.attraction.route}</td>
                <td>${link.departure}</td>
                <td>${link.place}</td>
                <td>${link.total}</td>

                <c:if test="${link.state==1}">
                    <td>已支付</td>
                </c:if>
                <c:if test="${link.state==0}">
                    <td>未支付</td>
                </c:if>
                <c:if test="${link.state==2}">
                    <td>退单</td>
                </c:if>

                <td class="td-manage">
                    <c:if test="${link.state == 0}" >
                    <a title="退订单" onclick="member_del(this,'${link.orderId}')">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                    </c:if>
                    <c:if test="${link.state == 0}" >
                        <a title="去支付"  href="<%=request.getContextPath()%>/QueryOrderController/toApply/${link.orderId}">
                            <i class="layui-icon">&#xe63c;</i>
                        </a>
                    </c:if>
                    <c:if test="${link.state != 0}" >
                        <a title="去支付">
                            <i class="layui-icon">&#xe63c;</i>
                        </a>
                    </c:if>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>

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
        layer.confirm('确认要取消订单吗？',function(index){
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/QueryOrderController/deleteOrder/"+id,
                data:{
                },
                success:function(data){

                    var obj = eval("("+data+")");
                    alert(obj.name)

                    window.location.reload(true);
                }
            })
        });
    }
</script>
</body>

</html>