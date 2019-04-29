<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="info.jsp" %>
<html>
<head>
    <title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine Template</title>
</head>

<body>
<!-- 头部开始 -->
<jsp:include page="header.jsp"/>
<!-- 头部结束 -->

<section class="single">
    <div class="container">
        <div class="row">
            <div class="col-md-4 sidebar" id="sidebar">
                <aside>
                    <div class="aside-body">
                        <figure class="ads">
                            <img src="images/ad.png">
                            <figcaption>Advertisement</figcaption>
                        </figure>
                    </div>
                </aside>
                <aside>
                    <h1 class="aside-title">最新的消息</h1>
                    <div class="aside-body">
                        <article class="article-fw">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img16.jpg">
                                    </a>
                                </figure>
                                <div class="details">
                                    <h1><a href="single.jsp">新闻标题1</a></h1>
                                    <p>
                                        新闻内容1
                                    </p>
                                    <div class="detail">
                                        <div class="time">2019 年 04 月 06 日</div>
                                        <div class="category"><a href="category.jsp">类别1</a></div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <div class="line"></div>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img05.jpg">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">新闻标题2</a></h1>
                                    <div class="detail">
                                        <div class="category"><a href="category.jsp">类别2</a></div>
                                        <div class="time">2019 年 04 月 06 日</div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img02.jpg">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">新闻标题3</a></h1>
                                    <div class="detail">
                                        <div class="category"><a href="category.jsp">类别3</a></div>
                                        <div class="time">2019 年 04 月 06 日</div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="article-mini">
                            <div class="inner">
                                <figure>
                                    <a href="single.jsp">
                                        <img src="images/news/img13.jpg">
                                    </a>
                                </figure>
                                <div class="padding">
                                    <h1><a href="single.jsp">新闻标题4</a></h1>
                                    <div class="detail">
                                        <div class="category"><a href="category.jsp">类别4</a></div>
                                        <div class="time">2019 年 04 月 06 日</div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </aside>
                <aside>
                    <div class="aside-body">
                        <form class="newsletter">
                            <div class="icon">
                                <i class="ion-ios-email-outline"></i>
                                <h1>订阅我们</h1>
                            </div>
                            <div class="input-group">
                                <input type="email" class="form-control email" placeholder="Your mail">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary"><i class="ion-paper-airplane"></i></button>
                                </div>
                            </div>
                            <p>通过订阅，您将在电子邮件中收到最新消息。</p>
                        </form>
                    </div>
                </aside>
            </div>
            <div class="col-md-8">
                <ol class="breadcrumb">
                    <li><a href="#">首页</a></li>
                    <li class="active">类别1</li>
                </ol>
                <article class="article main-article">
                    <header>
                        <h1>新闻标题</h1>
                        <ul class="details">
                            <li>发表于 2019 年 04 月 06 日</li>
                            <li><a>Film</a></li>
                            <li>By <a href="#">作者</a></li>
                        </ul>
                    </header>
                    <div class="main">
                        <p>Pellentesque elementum tellus id mauris faucibus, id sagittis mauris rhoncus. Donec ac
                            iaculis dui, id convallis mauris. Fusce faucibus purus eu risus pulvinar, vel rutrum velit
                            hendrerit. Sed urna nunc, efficitur faucibus sollicitudin non.</p>
                        <div class="featured">
                            <figure>
                                <img src="images/news/img01.jpg">
                                <figcaption>Image by pexels.com</figcaption>
                            </figure>
                        </div>

                        <p>Nulla facilisi. Aenean pharetra fringilla nunc a finibus. Nulla vitae pretium nunc.
                            Pellentesque sagittis sollicitudin turpis id aliquam. Cras lobortis diam in nunc posuere, et
                            malesuada sem gravida. Curabitur ornare massa id orci faucibus elementum. Phasellus
                            pharetra, velit <a href="#">in egestas rutrum,</a> metus dolor maximus massa, feugiat
                            molestie eros mauris sit amet massa. Maecenas blandit diam lacus, in luctus nulla efficitur
                            nec. Sed sit amet quam sit amet odio scelerisque vestibulum vel sit amet ante. Cras
                            fringilla efficitur lacinia. Cras posuere, arcu id consequat ultrices, urna urna cursus
                            massa, at sollicitudin elit lacus quis dui. In laoreet nulla a turpis blandit sollicitudin.
                            Donec in risus eu lorem volutpat hendrerit quis non lorem. Nulla in metus ipsum.
                        <p>Etiam sit amet augue non velit aliquet consectetur. Proin gravida, odio in facilisis
                            pharetra, neque enim aliquam eros, vitae gravida orci elit vel magna. Integer viverra a
                            purus id gravida. Donec laoreet mi ac auctor ultricies. Pellentesque ullamcorper est et erat
                            ullamcorper gravida. In hac habitasse platea dictumst. Pellentesque justo mauris, mollis at
                            tortor ut, commodo venenatis elit. Curabitur suscipit pellentesque nunc, id tempus mi
                            facilisis sed. Curabitur molestie eu odio vitae condimentum. Donec placerat tristique neque
                            a blandit. Nullam commodo massa ut eros elementum, in suscipit libero aliquam.</p>

                        <h4>Sed id sodales sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla
                            facilisi.</h4>
                        <p>Nulla facilisi. Duis auctor fringilla sagittis. Fusce ornare, dui id consequat volutpat, nibh
                            metus viverra nibh, vitae bibendum diam velit in libero. Sed dignissim quam sit amet nibh
                            porttitor, non pellentesque metus tincidunt. Maecenas non velit sapien. </p>
                        <p>Maecenas vel dolor sit amet ligula interdum tempor id eu ipsum. Suspendisse pharetra risus ut
                            metus elementum pulvinar. Mauris eget varius tellus. Cras et lorem vel nunc gravida
                            porttitor.</p>
                        <blockquote>
                            Free Responsive HTML5 &amp; CSS3 Magazine Template
                        </blockquote>
                        <p>Ut est elit, vehicula tempus volutpat ut, sodales eget odio. Nunc placerat, orci ac iaculis
                            feugiat, sem tellus efficitur tortor, mollis iaculis lacus ante nec risus. Sed consequat
                            vehicula pretium.</p>
                    </div>
                    <footer>
                        <div class="col">
                            <ul class="tags">
                                <li><a href="#">Free Themes</a></li>
                                <li><a href="#">Bootstrap 3</a></li>
                                <li><a href="#">Responsive Web Design</a></li>
                                <li><a href="#">HTML5</a></li>
                                <li><a href="#">CSS3</a></li>
                                <li><a href="#">Web Design</a></li>
                            </ul>
                        </div>
                        <div class="col">
                            <a href="#" class="love"><i class="ion-android-favorite-outline"></i>
                                <div>1220</div>
                            </a>
                        </div>
                    </footer>
                </article>
                <div class="sharing">
                    <div class="title"><i class="ion-android-share-alt"></i> Sharing is caring</div>
                    <ul class="social">
                        <li>
                            <a href="#" class="facebook">
                                <i class="ion-social-facebook"></i> Facebook
                            </a>
                        </li>
                        <li>
                            <a href="#" class="twitter">
                                <i class="ion-social-twitter"></i> Twitter
                            </a>
                        </li>
                        <li>
                            <a href="#" class="googleplus">
                                <i class="ion-social-googleplus"></i> Google+
                            </a>
                        </li>
                        <li>
                            <a href="#" class="linkedin">
                                <i class="ion-social-linkedin"></i> Linkedin
                            </a>
                        </li>
                        <li>
                            <a href="#" class="skype">
                                <i class="ion-ios-email-outline"></i> Email
                            </a>
                        </li>
                        <li class="count">
                            20
                            <div>Shares</div>
                        </li>
                    </ul>
                </div>
                <div class="line">
                    <div>Author</div>
                </div>
                <div class="author">
                    <figure>
                        <img src="images/img01.jpg">
                    </figure>
                    <div class="details">
                        <div class="job">Web Developer</div>
                        <h3 class="name">John Doe</h3>
                        <p>Nulla sagittis rhoncus nisi, vel gravida ante. Nunc lobortis condimentum elit, quis porta
                            ipsum rhoncus vitae. Curabitur magna leo, porta vel fringilla gravida, consectetur in
                            libero. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.</p>
                        <ul class="social trp sm">
                            <li>
                                <a href="#" class="facebook">
                                    <svg>
                                        <rect/>
                                    </svg>
                                    <i class="ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="twitter">
                                    <svg>
                                        <rect/>
                                    </svg>
                                    <i class="ion-social-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="youtube">
                                    <svg>
                                        <rect/>
                                    </svg>
                                    <i class="ion-social-youtube"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="googleplus">
                                    <svg>
                                        <rect/>
                                    </svg>
                                    <i class="ion-social-googleplus"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="line">
                    <div>You May Also Like</div>
                </div>
                <div class="row">
                    <article class="article related col-md-6 col-sm-6 col-xs-12">
                        <div class="inner">
                            <figure>
                                <a href="#">
                                    <img src="images/news/img03.jpg">
                                </a>
                            </figure>
                            <div class="padding">
                                <h2><a href="#">Duis aute irure dolor in reprehenderit in voluptate</a></h2>
                                <div class="detail">
                                    <div class="category"><a href="category.jsp">Lifestyle</a></div>
                                    <div class="time">December 26, 2016</div>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article class="article related col-md-6 col-sm-6 col-xs-12">
                        <div class="inner">
                            <figure>
                                <a href="#">
                                    <img src="images/news/img08.jpg">
                                </a>
                            </figure>
                            <div class="padding">
                                <h2><a href="#">Duis aute irure dolor in reprehenderit in voluptate</a></h2>
                                <div class="detail">
                                    <div class="category"><a href="category.jsp">Lifestyle</a></div>
                                    <div class="time">December 26, 2016</div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="line thin"></div>
                <div class="comments">
                    <h2 class="title">3 Responses <a href="#">Write a Response</a></h2>
                    <div class="comment-list">
                        <div class="item">
                            <div class="user">
                                <figure>
                                    <img src="images/img01.jpg">
                                </figure>
                                <div class="details">
                                    <h5 class="name">Mark Otto</h5>
                                    <div class="time">24 Hours</div>
                                    <div class="description">
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore <a href="#">magna</a> aliqua. Ut enim ad
                                        minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.
                                    </div>
                                    <footer>
                                        <a href="#">Reply</a>
                                    </footer>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="user">
                                <figure>
                                    <img src="images/img01.jpg">
                                </figure>
                                <div class="details">
                                    <h5 class="name">Mark Otto</h5>
                                    <div class="time">24 Hours</div>
                                    <div class="description">
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore <a href="#">magna</a> aliqua. Ut enim ad
                                        minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.
                                    </div>
                                    <footer>
                                        <a href="#">Reply</a>
                                    </footer>
                                </div>
                            </div>
                            <div class="reply-list">
                                <div class="item">
                                    <div class="user">
                                        <figure>
                                            <img src="images/img01.jpg">
                                        </figure>
                                        <div class="details">
                                            <h5 class="name">Mark Otto</h5>
                                            <div class="time">24 Hours</div>
                                            <div class="description">
                                                Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit
                                                esse
                                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                                                cupidatat non
                                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                            </div>
                                            <footer>
                                                <a href="#">Reply</a>
                                            </footer>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="user">
                                <figure>
                                    <img src="images/img01.jpg">
                                </figure>
                                <div class="details">
                                    <h5 class="name">Mark Otto</h5>
                                    <div class="time">24 Hours</div>
                                    <div class="description">
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore <a href="#">magna</a> aliqua. Ut enim ad
                                        minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.
                                    </div>
                                    <footer>
                                        <a href="#">Reply</a>
                                    </footer>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form class="row">
                        <div class="col-md-12">
                            <h3 class="title">Leave Your Response</h3>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="name">Name <span class="required"></span></label>
                            <input type="text" id="name" name="" class="form-control">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="email">Email <span class="required"></span></label>
                            <input type="email" id="email" name="" class="form-control">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="website">Website</label>
                            <input type="url" id="website" name="" class="form-control">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="message">Response <span class="required"></span></label>
                            <textarea id="message" class="form-control" name="message"
                                      placeholder="Write your response ..."></textarea>
                        </div>
                        <div class="form-group col-md-12">
                            <button class="btn btn-primary">Send Response</button>
                        </div>
                    </form>
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