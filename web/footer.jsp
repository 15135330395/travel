<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="block">
                    <h1 class="block-title">公司信息</h1>
                    <div class="block-body">
                        <figure class="foot-logo">
                            <img src="<%=request.getContextPath()%>/images/logo-light.png" class="img-responsive" alt="Logo">
                        </figure>
                        <p class="brand-description">
                            MAGZ旅行社 - 响应式的旅行社
                        </p>
                        <a href="<%=request.getContextPath()%>/page.jsp" class="btn btn-magz white">关于我们<i class="ion-ios-arrow-thin-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="block">
                    <h1 class="block-title">更多人喜欢
                        <div class="right"><a href="<%=request.getContextPath()%>/attraction/placeList">查看全部<i class="ion-ios-arrow-thin-right"></i></a></div>
                    </h1>
                </div>
                <div class="line"></div>
                <div class="block">
                    <h1 class="block-title">订阅我们</h1>
                    <div class="block-body">
                        <p>通过订阅，您将在电子邮件中收到最新消息。</p>
                        <form class="newsletter">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="ion-ios-email-outline"></i>
                                </div>
                                <input type="email" class="form-control email" placeholder="你的邮箱">
                            </div>
                            <button class="btn btn-primary btn-block white">订阅</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-6">
                <div class="block">
                    <h1 class="block-title">关注我们</h1>
                    <div class="block-body">
                        <p>关注我们并保持联系以获取最新消息</p>
                        <ul class="social trp">
                            <li>
                                <a href="#" class="facebook">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="twitter">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-twitter-outline"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="youtube">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-youtube-outline"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="googleplus">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-googleplus"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="instagram">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-instagram-outline"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tumblr">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-tumblr"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="dribbble">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-dribbble"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="linkedin">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="skype">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-skype"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="rss">
                                    <svg>
                                        <rect width="0" height="0"/>
                                    </svg>
                                    <i class="ion-social-rss"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="line"></div>
                <div class="block">
                    <div class="block-body no-margin">
                        <ul class="footer-nav-horizontal">
                            <li>
                                <a href="<%=request.getContextPath()%>/attraction/changePlace">首页</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/page.jsp">关于我们</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="copyright">
                    版权所有 &copy; 2019 123 保留所有权利
                    <div>
                        与 <i class="ion-heart"></i> 123 制作
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- JS -->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.migrate.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap/bootstrap.min.js"></script>
<script>
    var $target_end = $(".best-of-the-week");
</script>
<script src="<%=request.getContextPath()%>/scripts/jquery-number/jquery.number.min.js"></script>
<script src="<%=request.getContextPath()%>/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
<script src="<%=request.getContextPath()%>/scripts/easescroll/jquery.easeScroll.js"></script>
<script src="<%=request.getContextPath()%>/scripts/sweetalert/dist/sweetalert.min.js"></script>
<script src="<%=request.getContextPath()%>/scripts/toast/jquery.toast.min.js"></script>
<script src="<%=request.getContextPath()%>/js/demo.js"></script>
<script src="<%=request.getContextPath()%>/js/e-magz.js"></script>