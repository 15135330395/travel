<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/28
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>游客管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%@include file="../commons/info.jsp"%>
</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="userId" class="layui-form-label">

            </label>
            <div class="layui-input-inline">
                <input value="${user.userId}" type="hidden" id="userId" name="userId" required="" lay-verify=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="email" class="layui-form-label">

            </label>
            <div class="layui-input-inline">
                <input value="${user.email}" type="hidden" id="email" name="email"  required="" lay-verify="email"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="password" class="layui-form-label">
                <span class="x-red">*</span>用户密码
            </label>
            <div class="layui-input-inline">
                <input value="${user.password}" type="text" id="password" name="password" required="" lay-verify="text"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="code" class="layui-form-label">

            </label>
            <div class="layui-input-inline">
                <input  value="${user.code}" type="hidden" id="code" name="code" required="" lay-verify="text"
                        autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
        <label class="layui-form-label">
        <span class="x-red">*</span>激活状态
        </label>
        <div class="layui-input-inline">
        <select type="text" name="state" lay-verify="">
        <option value="${user.state}">${user.state}</option>
        <option value="0">0</option>
        <option value="1">1</option>
        </select>
        </div>
        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="update" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;
        //监听提交
        form.on('submit(update)', function(data){
            var userId=data.field.userId;
            var email=data.field.email;
            var password=data.field.password;
            var state=data.field.state;
            var code=data.field.code;
            console.log(data)
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/user/update",
                data:{
                    "userId":userId ,
                    "email":email,
                    "password":password,
                    "state":state,
                    "code":code
                },
                success:function(msg){
                    if(msg=="1"){
                        //发异步，把数据提交给java
                        layer.alert("修改成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            window.parent.location.reload();
                        });
                    }else{
                        layer.msg("信息不存在，修改失败")
                    }
                },
                error:function () {
                    layer.msg("修改异常")
                }
            })
            return false;
        });
    });
</script>
</body>

</html>