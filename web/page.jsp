<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="info.jsp" %>
<html>
<head>
    <title>MAGZ旅行社</title>
</head>

<body>
<!-- 头部开始 -->
<jsp:include page="desk/header.jsp"/>
<!-- 头部结束 -->

<section class="page">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <ol class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/desk/index.jsp">首页</a></li>
                    <li class="active">关于我们</li>
                </ol>
                <h1 class="page-title">关于我们</h1>
                <p class="page-subtitle">We will tell you who we are</p>
                <div class="line thin"></div>
                <div class="page-description">
                    <h4>MAGZ旅行社简介:</h4>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MAGZ旅行社是经国家旅游主管部门批准，并在太原市工商 主管部门申请注册的具有独立法人资格的旅行社。旅行社主要经营国内旅游业务、代办机票及酒店预订，拥有一支敬业、专业、高水准的 导游及工作人员队伍，实力雄厚，经验丰富。
                    </p>

                    <h4>服务宗旨：</h4>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“求真、求实、求义” 求真：就是诚心诚意地为民众服务；求实：就是实实在在地为顾客做事；求义：就是待人以礼，取费以义，坚持正道，合理双赢。
                    </p>
                    <h4>联系我们:</h4>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAGZ旅行社有限责任公司<br>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 联系人：王经理<br>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 旅游咨询: 13947664650<br>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 旅游预订: 0476-8188867<br>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 客服QQ：1534559562<br>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地  址：太原市迎泽区振兴大街东段港湾世纪酒店商务中心一楼
                    </p>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- 底部开始 -->
<jsp:include page="footer.jsp"/>
<!-- 底部结束 -->
</body>
</html>