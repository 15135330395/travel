<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/desk/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/desk/layui/layui.js" charset="utf-8"></script>
<header class="primary">
    <div class="firstbar">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="brand">
                        <a href="">
                            <img src="<%=request.getContextPath()%>/desk/images/logo.png" alt="Magz Logo">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <form class="search" autocomplete="off" action="<%=request.getContextPath()%>/attraction/queryOneByName/">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" name="place" id="sousuo" class="form-control" placeholder="搜景点">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary"  type="submit" style="line-height: 1;"><i class="ion-search"></i>
                                    </button>
                                </div>

                            </div>
                        </div>
                        <div class="help-block">
                            <%--<div>热搜:</div>--%>
                            <ul>
                                <c:forEach begin="0" end="4" var="i">
                                    <li>
                                        <a href="">${visitedNewsList[i].newsTitle}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </form>
                </div>
                <div class="col-md-3 col-sm-12 text-right">
                    <ul class="nav-icons">
                        <c:if test="${user==null}">
                            <li>
                                <a href="<%=request.getContextPath()%>/desk/register.jsp"><i class="ion-person-add"></i>
                                    <div>注册</div>
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/desk/login.jsp"><i class="ion-person"></i>
                                    <div>登陆</div>
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/attraction/all"><i class="ion-person"></i>
                                    <div>后台登陆</div>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${user!=null}">
                            <li>
                                <a><i class="ion-person"></i>
                                    欢迎您，<span>${user.email}</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 导航开始 -->
    <nav class="menu">
        <div class="container">
            <div class="brand">
                <a href="">
                    <img src="<%=request.getContextPath()%>/desk/images/logo.png" alt="logo">
                </a>
            </div>
            <div class="mobile-toggle">
                <a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
            </div>
            <div class="mobile-toggle">
                <a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
            </div>
            <div id="menu-list">
                <ul class="nav-list">
                    <li class="for-tablet nav-title">
                        <a>Menu</a>
                    </li>
                    <li class="for-tablet">
                        <a href="<%=request.getContextPath()%>/desk/login.jsp">Login</a>
                    </li>
                    <li class="for-tablet">
                        <a href="<%=request.getContextPath()%>/desk/register.jsp">Register</a>
                    </li>
                    <li class="dropdown magz-dropdown">
                        <a href="#">菜单 <i class="ion-ios-arrow-right"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="<%=request.getContextPath()%>/attraction/changePlace">首页</a>
                            </li>
                            <c:if test="${user==null}">
                                <li class="dropdown magz-dropdown">
                                    <a href="#">认证<i class="ion-ios-arrow-right"></i></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="<%=request.getContextPath()%>/desk/login.jsp">登陆</a>
                                        </li>
                                        <li>
                                            <a href="<%=request.getContextPath()%>/desk/register.jsp">注册</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                            <li class="dropdown magz-dropdown">
                                <a href="#">错误页面<i class="ion-ios-arrow-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/desk/403.jsp">403</a>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/desk/404.jsp">404</a>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/desk/500.jsp">500</a>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/desk/503.jsp">503</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/attraction/placeList">景点 </a>
                    </li>
                    <c:if test="${user!=null}">
                        <li class="dropdown magz-dropdown">
                            <a href="#">${user.email} <i class="ion-ios-arrow-right"></i></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="<%=request.getContextPath()%>/QueryOrderController/queryOrder/${user.userId}"><i class="icon ion-settings"></i>我的订单</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/userLogout/logout"><i class="icon ion-log-out"></i>退出登录</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 导航结束 -->
</header>