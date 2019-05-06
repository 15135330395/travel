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
            <label for="visitorId" class="layui-form-label">
                <span class="x-red"></span>
            </label>
            <div class="layui-input-inline">
                <input value="${visitor.visitorId}" type="hidden" id="visitorId" name="visitorId" required="" lay-verify=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="visitorName" class="layui-form-label">
                <span class="x-red">*</span>游客姓名
            </label>
            <div class="layui-input-inline">
                <input value="${visitor.visitorName}" type="text" id="visitorName" name="visitorName" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="cardId" class="layui-form-label">
                <span class="x-red">*</span>身份证号
            </label>
            <div class="layui-input-inline">
                <input value="${visitor.cardId}" type="number" id="cardId" name="cardId" required="" lay-verify="number"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>手机号码
            </label>
            <div class="layui-input-inline">
                <input  value="${visitor.phone}" type="number" id="phone" name="phone" required="" lay-verify="number"
                        autocomplete="off" class="layui-input">
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
            var visitorId=data.field.visitorId;
            var visitorName=data.field.visitorName;
            var cardId=data.field.cardId;
            var phone=data.field.phone;
            console.log(data)
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/visitor/updateVisitor",
                data:{
                    "visitorId":visitorId,
                    "visitorName":visitorName,
                    "cardId":cardId,
                    "phone":phone
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