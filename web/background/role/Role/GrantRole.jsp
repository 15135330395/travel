<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/1 0001
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- css和js的引用封装在info.jsp -->
<%@ include file="/background/commons/info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>修改角色</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red"></span>编号
            </label>
            <div class="layui-input-block">
                <input type="text" name="roleId" class="layui-input" readonly="readonly" value="${role.roleId}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red"></span>角色名称
            </label>
            <div class="layui-input-inline">
                <input type="text" name="roleName" class="layui-input" readonly="readonly" value="${role.roleName}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>权限
            </label>
            <div class="layui-input-block">
                <table>
                    <c:forEach items="${menus}" var="root">
                        <c:if test="${root.parentId==-1}">
                            <tr>
                                <td>
                                    <h3>${root.menuName}</h3>
                                </td>
                                <td>
                                    <input type="checkbox" name="menu" lay-skin="switch" value="${root.menuId}"
                                           lay-text="ON|OFF" checked="">
                                </td>
                            </tr>
                            <c:forEach items="${menus}" var="menu">
                                <c:if test="${menu.parentId ==root.menuId}">
                                    <tr align="center">
                                        <td>
                                                ${menu.menuName}
                                        </td>
                                        <td>
                                            <input type="checkbox" name="menu" lay-skin="switch"
                                                   value="${menu.menuId}" lay-text="ON|OFF">
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="update" lay-submit="">
                保存
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer
        //监听提交
        form.on('submit(update)', function (data) {

            //获取checkbox[name='menu']的值
            var arr = new Array();
            $("input:checkbox[name='menu']:checked").each(function (i) {
                arr[i] = $(this).val();
            });
            data.field.menu = arr.join(",");//将数组合并成字符串
            alert(data.field.menu);

            //发异步，把数据提交给Servlet
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/role/grant/" + data.field.roleId,
                data: {
                    menuIds: data.field.menu
                },
                success: function (msg) {
                    if (msg > 0) {
                        layer.alert("修改成功", {icon: 6}, function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            // 关闭当前frame
                            parent.layer.close(index);
                            // 刷新父frame
                            window.parent.location.reload();
                        });
                    } else {
                        layer.msg("修改失败")
                    }
                },
                error: function () {
                    layer.msg("修改异常")
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
