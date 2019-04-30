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

<section class="search">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <aside>
                    <h2 class="aside-title">查询</h2>
                    <div class="aside-body">
                        <p>使用其他关键字搜索或使用过滤器可以获得更准确的结果。</p>
                        <form>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" name="q" class="form-control" placeholder="Type something ..."
                                           value="hello">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary">
                                            <i class="ion-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </aside>
                <aside>
                    <h2 class="aside-title">筛选</h2>
                    <div class="aside-body">
                        <form class="checkbox-group">
                            <div class="group-title">日期</div>
                            <div class="form-group">
                                <label><input type="radio" name="date" checked> 所有</label>
                            </div>
                            <div class="form-group">
                                <label><input type="radio" name="date"> 今天</label>
                            </div>
                            <div class="form-group">
                                <label><input type="radio" name="date"> 上周</label>
                            </div>
                            <div class="form-group">
                                <label><input type="radio" name="date"> 上月</label>
                            </div>
                            <br>
                            <div class="group-title">类别</div>
                            <div class="form-group">
                                <label><input type="checkbox" name="category" checked> 分类</label>
                            </div>
                            <div class="form-group">
                                <label><input type="checkbox" name="category"> 类别1</label>
                            </div>
                            <div class="form-group">
                                <label><input type="checkbox" name="category"> 类别2</label>
                            </div>
                            <div class="form-group">
                                <label><input type="checkbox" name="category"> 类别3</label>
                            </div>
                            <div class="form-group">
                                <label><input type="checkbox" name="category"> 类别4</label>
                            </div>
                            <div class="form-group">
                                <label><input type="checkbox" name="category"> 类别5</label>
                            </div>
                        </form>
                    </div>
                </aside>
            </div>
            <div class="col-md-9">
                <div class="nav-tabs-group">
                    <ul class="nav-tabs-list">
                        <li class="active">
                            <a href="#">所有</a>
                        </li>
                        <li>
                            <a href="#">最新</a>
                        </li>
                        <li>
                            <a href="#">热门</a>
                        </li>
                        <li>
                            <a href="#">预测</a>
                        </li>
                        <li>
                            <a href="#">视频</a>
                        </li>
                    </ul>
                    <div class="nav-tabs-right">
                        <select class="form-control">
                            <option>分页</option>
                            <option>10</option>
                            <option>20</option>
                            <option>50</option>
                            <option>100</option>
                        </select>
                    </div>
                </div>
                <div class="search-result">
                    在5,200个帖子中找到关键字“hello”的搜索结果。
                </div>
                <div class="row">
                    <article class="col-md-12 article-list">
                        <div class="inner">
                            <figure>
                                <a href="single.jsp">
                                    <img src="images/news/img11.jpg">
                                </a>
                            </figure>
                            <div class="details">
                                <div class="detail">
                                    <div class="category">
                                        <a href="#">Film</a>
                                    </div>
                                    <time>December 19, 2016</time>
                                </div>
                                <h1><a href="single.jsp">Donec consequat arcu at ultrices sodales quam erat aliquet
                                    diam</a></h1>
                                <p>
                                    Donec consequat, arcu at ultrices sodales, quam erat aliquet diam, sit amet interdum
                                    libero nunc accumsan nisi.
                                </p>
                                <footer>
                                    <a href="#" class="love"><i class="ion-android-favorite-outline"></i>
                                        <div>273</div>
                                    </a>
                                    <a class="btn btn-primary more" href="single.jsp">
                                        <div>More</div>
                                        <div><i class="ion-ios-arrow-thin-right"></i></div>
                                    </a>
                                </footer>
                            </div>
                        </div>
                    </article>
                    <article class="col-md-12 article-list">
                        <div class="inner">
                            <div class="badge">
                                Sponsored
                            </div>
                            <figure>
                                <a href="single.jsp">
                                    <img src="images/news/img02.jpg">
                                </a>
                            </figure>
                            <div class="details">
                                <div class="detail">
                                    <div class="category">
                                        <a href="#">类别1</a>
                                    </div>
                                    <time>2019 年 04 月 06 日</time>
                                </div>
                                <h1><a href="single.jsp">新闻标题1</a></h1>
                                <p>
                                    新闻内容1
                                </p>
                                <footer>
                                    <a href="#" class="love"><i class="ion-android-favorite-outline"></i>
                                        <div>点赞量</div>
                                    </a>
                                    <a class="btn btn-primary more" href="single.jsp">
                                        <div>更多</div>
                                        <div><i class="ion-ios-arrow-thin-right"></i></div>
                                    </a>
                                </footer>
                            </div>
                        </div>
                    </article>
                    <article class="col-md-12 article-list">
                        <div class="inner">
                            <figure>
                                <a href="single.jsp">
                                    <img src="images/news/img03.jpg">
                                </a>
                            </figure>
                            <div class="details">
                                <div class="detail">
                                    <div class="category">
                                        <a href="#">类别2</a>
                                    </div>
                                    <time>2019 年 04 月 06 日</time>
                                </div>
                                <h1><a href="single.jsp">新闻标题2</a></h1>
                                <p>
                                    新闻内容2
                                </p>
                                <footer>
                                    <a href="#" class="love active"><i class="ion-android-favorite"></i>
                                        <div>点赞量</div>
                                    </a>
                                    <a class="btn btn-primary more" href="single.jsp">
                                        <div>更多</div>
                                        <div><i class="ion-ios-arrow-thin-right"></i></div>
                                    </a>
                                </footer>
                            </div>
                        </div>
                    </article>
                    <article class="col-md-12 article-list">
                        <div class="inner">
                            <figure>
                                <a href="single.jsp">
                                    <img src="images/news/img09.jpg">
                                </a>
                            </figure>
                            <div class="details">
                                <div class="detail">
                                    <div class="category">
                                        <a href="#">类别3</a>
                                    </div>
                                    <time>2019 年 04 月 06 日</time>
                                </div>
                                <h1><a href="single.jsp">新闻标题3</a></h1>
                                <p>
                                    新闻内容3
                                </p>
                                <footer>
                                    <a href="#" class="love active"><i class="ion-android-favorite"></i>
                                        <div>点赞量</div>
                                    </a>
                                    <a class="btn btn-primary more" href="single.jsp">
                                        <div>更多</div>
                                        <div><i class="ion-ios-arrow-thin-right"></i></div>
                                    </a>
                                </footer>
                            </div>
                        </div>
                    </article>
                    <div class="col-md-12 text-center">
                        <ul class="pagination">
                            <li class="prev">
                                <a href="#"><i class="ion-ios-arrow-left"></i></a>
                            </li>
                            <li class="active">
                                <a href="#">1</a>
                            </li>
                            <li>
                                <a href="#">2</a>
                            </li>
                            <li>
                                <a href="#">3</a>
                            </li>
                            <li>
                                <a href="#">...</a>
                            </li>
                            <li>
                                <a href="#">97</a>
                            </li>
                            <li class="next">
                                <a href="#"><i class="ion-ios-arrow-right"></i></a>
                            </li>
                        </ul>
                        <div class="pagination-help-text">
                            展示 123 个结果中的 8 个 &mdash; 第 1 页
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 底部开始 -->
<jsp:include page="footer.jsp"/>
<!-- 底部结束 -->

<script>
    $("input").iCheck({
        checkboxClass: 'icheckbox_square-red',
        radioClass: 'iradio_square-red',
        cursor: true
    });
</script>
</body>

</html>