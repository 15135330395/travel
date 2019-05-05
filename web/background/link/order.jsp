<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/background/commons/info.jsp"%>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>角色管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<!-- css和js的引用封装在info.jsp -->
<style type="text/css">
	table {
		border-collapse: collapse;
		text-align: center;
		table-layout: fixed;
		width: 700px;
	}
	table td, table th {
		border: 1px solid #cad9ea;
		color: #666;
		height: 30px;
	}
	table thead th {
		background-color: #CCE8EB;
		width: 100px;
	}
	table tr:nth-child(odd) {
		background: #fff;
	}
	table tr:nth-child(even) {
		background: #F5FAFA;
	}
</style>
</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="#">首页</a> <a> <cite>订单管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<xblock>
		<button class="layui-btn">
			
			&ensp;&ensp;
		</button>
		<span class="x-right" style="line-height: 40px">共有数据：<i>${pageBean.count}</i>
			条
		</span> </xblock>
		<div style="height: 50%">
			<table class="layui-table">
				<colgroup>
					<col width="10%" align="center">
					<col width="10%">
					<col width="10%">
					<col width="6%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="5%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th>订单编号</th>
						<th>用户名</th>
						<th>景点</th>
						<th>导游</th>
						<th>订单类型</th>
						<th>下单时间</th>
						<th>出发时间</th>
						<th>集合地点</th>
						<th>价格</th>
						<th>订单状态</th>
						<th>操作</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderList}" var="list">
						<tr>
							<td>${list.orderId}</td>
							<td>${list.user.email}</td>
							<td>${list.attraction.attractionName}</td>
							<td>${list.staff.staffName}</td>
							<td>${list.type.typeName}</td>
							<td>${list.createTime}</td>
							<td>${list.departure}</td>
							<td>${list.place}</td>
							<td>${list.total}</td>
							<c:if test="${list.state==0}">
								<td>未支付</td>
							</c:if>
							<c:if test="${list.state==1}">
								<td>已支付</td>
							</c:if>
							<c:if test="${list.state==2}">
								<td>已退单</td>
							</c:if>

							<td class="td-manage"><a title="修改"
								class="layui-btn layui-btn-xs"
								onclick="layer.open({
                            title: '<h2>订单详情</h2s>',
                            type: 2,
                            closeBtn: 1,
                            skin: 'layui-layer-rim', // 加上边框
                            area: ['55%', '60%'], // 宽高
                            content: '<%=request.getContextPath()%>/QueryOrderController/queryOne?order_id='+${list.orderId}
                            });">查看</a>
<!--								<a title="删除" class="layui-btn layui-btn-danger layui-btn-xs"
								onclick="role_del(this,'${list.orderId}')" href="javascript:;">删除
							</a>                 
							<a title="赋予权限" class="layui-btn layui-btn-normal layui-btn-xs"
                       			onclick="layer.open({
                               title: '赋予权限',
                               type: 2,
                               skin: 'layui-layer-rim', // 加上边框
                               area: [$(window).width() * 0.9 + 'px', $(window).height() * 0.9 + '620px'], // 宽高
                               content: '<%=request.getContextPath()%>/role/to/${list.orderId}'
                               });">赋予权限
                    </a>
--></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="page">
			<div>
				<c:if test="${pageBean.index>1}">
					<a class="prev"
						href="<%=request.getContextPath()%>/QueryOrderController/query?index=${pageBean.index-1}">&lt;&lt;</a>
				</c:if>
				<c:if test="${pageBean.index<=1}">
					<a class="prev"
						href="<%=request.getContextPath()%>/QueryOrderController/query?index=${pageBean.index}">&lt;&lt;</a>
				</c:if>
				<c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
					<c:if test="${i==pageBean.index}">
						<span class="current"> ${i} </span>
					</c:if>
					<c:if test="${i!=pageBean.index}">
						<a class="num"
							href="<%=request.getContextPath()%>/QueryOrderController/query?index=${i}">
							${i} </a>
					</c:if>
				</c:forEach>
				<c:if test="${pageBean.index<pageBean.pages}">
					<a class="next"
						href="<%=request.getContextPath()%>/QueryOrderController/query?index=${pageBean.index+1}">&gt;&gt;</a>
				</c:if>
				<c:if test="${pageBean.index>=pageBean.pages}">
					<a class="next"
						href="<%=request.getContextPath()%>/QueryOrderController/query?index=${pageBean.index}">&gt;&gt;</a>
				</c:if>
			</div>
		</div>
	</div>
	<script>
    /*角色-删除*/
    function role_del(obj, roleId) {
        layer.confirm('确认要删除吗？', function () {
            //发异步 删除数据
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/role/delete/" + roleId,
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