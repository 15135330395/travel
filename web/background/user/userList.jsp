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
    <title>用户列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />

</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="#"><cite>首页</cite></a>
        <a><cite>用户列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()">
            <i class="layui-icon"></i>批量删除
        </button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','<%=request.getContextPath()%>/background/user/userAdd.jsp')">
            <i class="layui-icon"></i>添加
        </button>
        <span class="x-right" style="line-height:40px">共有数据：${pageBean.count} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>用户编号</th>
            <th>用户邮箱</th>
            <th>用户密码</th>
            <th>激活状态</th>
            <th>激活码</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="user">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${user.userId}'><i class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${user.userId}</td>
                <td>${user.email}</td>
                <td>${user.password}</td>
                <c:if test="${user.state==0}">
                    <td><button class="layui-btn layui-btn-danger layui-btn-sm">未激活</button></td>
                </c:if>
                <c:if test="${user.state==1}">
                    <td><button class="layui-btn layui-btn-normal layui-btn-sm">已激活</button></td>
                </c:if>
                <td>${user.code}</td>
                <td class="td-manage">
                    <a title="修改"  onclick="x_admin_show('编辑','<%=request.getContextPath()%>/user/toupdate/${user.userId}')" href="javascript:;">
                        <i class="layui-icon">&#xe63c;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${user.userId}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <c:if test="${pageBean.index==1}">
                <a class="prev">&lt;&lt;</a>
            </c:if>
            <c:if test="${pageBean.index>1}">
                <a class="prev" href="<%=request.getContextPath()%>/user/userByPageBean?index=${pageBean.index-1}">&lt;&lt;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.pages}" step="1">
                <c:if test="${pageBean.index==i}">
                     ${i}
                </c:if>
                <c:if test="${pageBean.index!=i}">
                    <a class="num" href="<%=request.getContextPath()%>/user/userByPageBean?index=${i}">${i}</a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.index < pageBean.pages}">
                <a class="next" href="<%=request.getContextPath()%>/user/userByPageBean?index=${pageBean.index+1}">&gt;&gt;</a>
            </c:if>
            <c:if test="${pageBean.index==pageBean.pages}">
               <a class="next">&gt;&gt;</a>
            </c:if>
        </div>
    </div>

</div>
<script>
    /*用户-删除*/
    function member_del(obj,userId){
        layer.confirm('确认要删除吗？',function(){
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/user/deleteUser",
                data:{
                    userId:userId
                },
                success:function(msg){
                    //发异步删除数据

                    if(msg==1){
                        layer.msg('删除成功!',{icon:1,time:1000});
                    }else{
                        layer.msg('已删除或不存在!',{icon:1,time:1000});
                    }
                    location.replace(location.href);
                    $(obj).parents("tr").remove();
                }
            })
        });
    }
/*    批量删除*/
    function delAll () {
        var data = tableCheck.getData();
        if(data==""){
            layer.msg('请至少选择1条数据');
            return;
        }
        layer.confirm('确认要删除这些信息吗？',function(){
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/user/deleteAll",
                data:{
                    ids : "" + data
                },
                success:function(msg){
                    if(msg>0){
                        //捉到所有被选中的，发异步进行删除
                        layer.msg('成功删除'+msg+'条数据', {icon: 6})
                    }else{
                        layer.msg('已删除或不存在!',{icon:1,time:1000});
                    }
                     // window.location.reload();
                    setTimeout(function(){
                         //刷新当前页面
                         window.location.reload();
                         //刷新父页面，上一个页面
                         // window.parent.location.reload()
                    },1000);
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                }
            });

        });
    }
</script>
</body>

</html>
