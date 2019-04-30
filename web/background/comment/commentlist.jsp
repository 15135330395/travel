<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/20 0020
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- css和js的引用封装在info.jsp -->
<%@ include file="../commons/info.jsp" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>新闻评论管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="#">首页</a>
        <a>
          <cite>新闻评论管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input type="text" name="username" placeholder="请输入××名称" autocomplete="off" class="layui-input">
            <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <table class="layui-hide" id="test" lay-filter="test"></table>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-danger" lay-event="delAll">
                <i class="layui-icon"></i>批量删除
            </button>
        </div>
    </script>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <script type="text/html" id="commentTime">
        {{ dateFormat(d.commentTime) }}
    </script>
    <script>
        layui.use('table', function () {
            var table = layui.table;
            table.render({
                elem: '#test'
                , url: '<%=request.getContextPath()%>/CommentServlet?action=findAllComment'
                , toolbar: '#toolbarDemo'
                , title: '新闻评论表'
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'commentId', title: '评论编号', width: '8%', fixed: 'left', unresize: true, sort: true}
                    , {field: 'newsId', title: '新闻编号', hide: true}
                    , {field: 'newsTitle', title: '新闻标题'}
                    , {field: 'ipAddress', title: 'IP', width: '13%', sort: true}
                    , {field: 'commentContent', title: '评论内容'}
                    , {field: 'commentTime', title: '评论时间', width: '15%', sort: true, templet: '#commentTime'}
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: '10%'}
                ]]
                , page: true
            });
            //监听行工具事件
            /*评论-删除*/
            table.on('tool(test)', function (obj) {
                var data = obj.data;
                if (obj.event === 'del') {
                    layer.confirm('确认要删除吗？', function () {
                        //发异步 删除数据
                        $.ajax({
                            type: "post",
                            url: "<%=request.getContextPath()%>/CommentServlet",
                            data: {
                                action: "deleteComment",
                                commentId: data.commentId
                            },
                            success: function (msg) {
                                if (msg == 1) {
                                    layer.alert("删除成功", {icon: 6});
                                } else {
                                    layer.msg('已被删除或不存在', {icon: 1, time: 2000});
                                }
                                obj.del();
                            },
                            error: function () {
                                layer.msg("删除异常")
                            }
                        });
                    });
                }
            });

            //头工具栏事件
            table.on('toolbar(test)', function (obj) {
                if (obj.event === 'delAll') {
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    if (data == "") {
                        layer.msg('请至少选择1条数据');
                        return;
                    }
                    var ids = "";
                    for (var i = 0; i < data.length; i++) {
                        ids += data[i].commentId
                        ids += ","
                    }
                    layer.confirm('确认要删除这些信息吗？', function () {
                        $.ajax({
                            type: "post",
                            url: "<%=request.getContextPath()%>/CommentServlet",
                            data: {
                                action: "deleteAll",
                                commentIds: "" + ids
                            },
                            success: function (msg) {
                                if (msg > 0) {
                                    layer.alert("成功删除" + msg + "条数据", {icon: 6});
                                } else {
                                    layer.msg('已删除或不存在', {icon: 1, time: 2000});
                                }
                                // 刷新本页面
                                setTimeout("location.reload()", 2500)
                            },
                            error: function () {
                                layer.msg("删除异常")
                            }
                        });
                    });
                }
            });
        });
    </script>
</div>
</body>
</html>
