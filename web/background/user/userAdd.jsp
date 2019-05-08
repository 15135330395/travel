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
            <label   class="layui-form-label">
            </label>
            <div class="layui-input-inline">
                <input type="hidden"  name="userId" required=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="email" class="layui-form-label">
                <span class="x-red">*</span>用户邮箱
            </label>
            <div class="layui-input-inline">
                <input type="email" id="email" name="email"  lay-verify="required|email" placeholder="请输入邮箱"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="password" class="layui-form-label">
                <span class="x-red">*</span>用户密码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="password" name="password" lay-verify="required|pass" placeholder="由6到12位字母、数字组成"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="add" lay-submit="">
                添加
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        form.verify({
            pass:[
                /*/^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'*/
                /^[A-Za-z0-9]{6,16}$/
                ,'密码必须由6到12位字母、数字组成'
            ]
        });




        //监听提交
        form.on('submit(add)', function(data){
            var userId=data.field.userId;
            var email=data.field.email;
            var password=data.field.password;
            var state=data.field.state;
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/user/addUser",
                data:{
                    "email":email,
                    "password":password,

                },
                success:function(msg){
                    if(msg=="1"){
                        //发异步，把数据提交给java
                        layer.alert("添加成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            window.parent.location.reload();
                        });
                    }else{
                        layer.msg("添加失败")
                    }
                },
                error:function () {
                    layer.msg("添加异常")
                }
            })
            return false;
        });
    });
</script>
</body>

</html>