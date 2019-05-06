<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript" src="/js/jquery.min.js"></script>


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



	<div></div>
	<table class="layui-table">
		<colgroup>
			<col width="130" align="center">
			<col width="160">
			<col width="120">
			<col width="130">
			<col width="120">
			<col width="130">
			<col width="120">
			<col width="130">
		</colgroup>

		<tr>
			<td><h2>订单编号</h2></td>
			<td><span id="orderId">${order.orderId}</span></td>
			<td><h2>用 户 名</h2></td>
			<td colspan="3"><span id="supplier">${order.user.email}</span></td>
			<td><h2>景点</h2></td>
			<td><span id="order_status">${order.attraction.attractionName}</span></td>
		</tr>
		<tr>
			<td><h2>导 游</h2></td>
			<td><span id="proposer">${order.staff.staffName}</span></td>
			<td><h2>订单类型</h2></td>
			<td><span id="inspector">${order.type.typeName}</span></td>
			<td><h2>下单时间</h2></td>
			<td><span id="buyer">${order.createTime}</span></td>
			<td><h2>出发时间</h2></td>
			<td><span id="warehouseKeeper">${order.departure}</span></td>
		</tr>
		<tr>
			<td><h2>集合地点</h2></td>
			<td><span id="creatDate">${order.place}</span></td>
			<td><h2>价  格</h2></td>
			<td><span id="checkDate">${order.total}</span></td>
			<td><h2>订单状态</h2></td>
			<td><span id="startDate">
			<c:if test="${order.state==0}">
						未支付
					</c:if> <c:if test="${order.state==1}">
						已支付
					</c:if> <c:if test="${order.state==2}">
						已退单
					</c:if>
			</span></td>

		</tr>

</table>
<div><h2>游客信息</h2></div>
	<table  id="table">

		<thead>
		<colgroup>
			<col width="60">
			<col width="100">
			<col width="120">
			<col width="130">

		</colgroup>
			<tr >
				<td>游客编号</td>
				<td>姓名</td>
				<td>身份证号</td>
				<td>手机号</td>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryVisitorByOrder}" var="map">
				<tr>
					<td>${map.visitorId }</td>
					<td>${map.visitorName }</td>
					<td >${map.cardId }</td>	
					<td>${map.phone }</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>




</body>
</html>