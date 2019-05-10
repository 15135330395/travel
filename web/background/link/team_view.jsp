<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>


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
			<td><h2>TEAM编号</h2></td>
			<td><span id="orderId">${team1.teamId}</span></td>
			<td><h2>景点</h2></td>
			<td colspan="3"><span id="supplier">${team1.attraction.attractionName}</span></td>
			<td><h2>导游</h2></td>
			<td><span id="order_status">${team1.staff.staffName}</span></td>
		</tr>
		<tr>
			<td><h2>出发时间</h2></td>
			<td><span id="proposer">${team1.departure}</span></td>
			<td><h2>集合地点</h2></td>
			<td><span id="inspector">${team1.place}</span></td>
			<td><h2>预计人数</h2></td>
			<td><span id="buyer">${team1.predict}</span></td>
			<td><h2>实际人数</h2></td>
			<td><span id="warehouseKeeper">${team1.current}</span></td>
		</tr>

</table>
<div><h2>游客信息</h2></div>
	<table  id="table">

		<thead>
		<colgroup>
			<col width="20%">
			<col width="20%">
			<col width="20%">


		</colgroup>
			<tr >
				<td>游客编号</td>
				<td>姓名</td>
				<td>订单状态</td>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${team1.ordersList}" var="map1">

				<tr>
					<td>${map1.orderId }</td>
					<td>${map1.user.email}</td>
					<c:if test="${map1.state==0}">
						<td>未支付</td>
					</c:if>
					<c:if test="${map1.state==1}">
						<td>已支付</td>
					</c:if>
					<c:if test="${map1.state==2}">
						<td>已退单</td>
					</c:if>
				</tr>
			</c:forEach>

		</tbody>
	</table>




</body>
</html>