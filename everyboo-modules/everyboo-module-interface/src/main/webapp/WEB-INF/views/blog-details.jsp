<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>艾瑞堡-资讯详情</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/assets/img/favicon.ico">
		
		<!-- all css here -->
        <link rel="stylesheet" href="<%=path%>/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=path%>/assets/css/magnific-popup.css">
        <link rel="stylesheet" href="<%=path%>/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="<%=path%>/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=path%>/assets/css/pe-icon-7-stroke.css">
		<link rel="stylesheet" href="<%=path%>/lib/css/nivo-slider.css" type="text/css" />
		<link rel="stylesheet" href="<%=path%>/lib/css/preview.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="<%=path%>/assets/css/animate.css">
        <link rel="stylesheet" href="<%=path%>/assets/css/jquery-ui.css">
        <link rel="stylesheet" href="<%=path%>/assets/css/meanmenu.min.css">
        <link rel="stylesheet" href="<%=path%>/assets/css/bundle.css">
        <link rel="stylesheet" href="<%=path%>/assets/css/style.css">
        <link rel="stylesheet" href="<%=path%>/assets/css/responsive.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/assets/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/assets/css/menu_elastic.css" />
        <script src="<%=path%>/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>



        <div id="content" class="canvas-wrapper">
            <%@include file="master/left-account.jsp"%>

            <div class="content-wrap">
                <div class="content">
                    <%@include file="master/header.jsp"%>

                    <!-- blog sidebar area start -->
                    <div class="blog-sidebar-area ptb-100">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8 col-lg-9">
                                    <div class="blog-wrapper">
                                        <div class="single-blog">

                                            <div class="blog-details-text mt-30">
                                                <h3 v-text="article.title"></h3>
                                                <div class="post-info">
                                                    <ul>
                                                        <li>
                                                            <i class="fa fa-user"></i>
                                                            <span v-text="article.publisher"></span>
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-calendar"></i>
                                                            <span v-text="article.createDate"></span>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <!--
                                                <a href="#"><img :src="article.coverImageUrl" alt=""></a>
                                                -->
                                                <div v-html="article.content"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-lg-3">
                                    <div class="blog-sidebar mrg-for-sm-top">
                                        <div class="single-sidebar">
                                            <h3 class="sidebar-title">最新资讯</h3>
                                            <div class="recent-all">
                                                <div v-if="latestArticles.length === 0">暂无最新资讯</div>
                                                <div v-else v-for="item in latestArticles" class="recent-img-text mb-20">
                                                    <div class="recent-img">
                                                        <a :href="'blog-details.jsp?id=' + item.id"><img :src="item.coverImageUrl" alt=""></a>
                                                    </div>
                                                    <div class="recent-text">
                                                        <h4>
                                                            <a :href="'blog-details.jsp?id=' + item.id" v-text="item.title"></a>
                                                        </h4>
                                                        <div class="post-info">
                                                            <ul>
                                                                <li>
                                                                    <i class="fa fa-calendar"></i>
                                                                    <span v-text="item.createDate"></span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- blog sidebar area end -->
                    <%@include file="master/footer.jsp"%>
                </div>
                <!-- content end -->
            </div>
            <!-- content-wrap end -->
        </div>
		
		

		<!-- all js here -->
        <!--[if lt IE 9]>
        <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="<%=path%>/assets/js/vendor/jquery-1.12.0.min.js"></script>
        <script src="<%=path%>/assets/js/snap.svg-min.js"></script>
        <script src="<%=path%>/assets/js/bootstrap.min.js"></script>
        <script src="<%=path%>/assets/js/jquery.meanmenu.js"></script>
        <script src="<%=path%>/assets/js/jquery.magnific-popup.min.js"></script>
        <script src="<%=path%>/assets/js/isotope.pkgd.min.js"></script>
        <script src="<%=path%>/assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="<%=path%>/assets/js/jquery.validate.min.js"></script>
        <script src="<%=path%>/assets/js/owl.carousel.min.js"></script>
		<script src="<%=path%>/lib/js/jquery.nivo.slider.js"></script>
		<script src="<%=path%>/lib/home.js"></script>
        <script src="<%=path%>/assets/js/plugins.js"></script>
        <script src="<%=path%>/assets/js/main.js"></script>
        <script src="<%=path%>/assets/js/classie.js"></script>
        <script src="<%=path%>/assets/js/vue.min.js"></script>
        <script src="<%=path%>/assets/js/everyboo.js?v=1.1"></script>
        <script>
            var articleId = '${requestScope.id}'
            var view = new Vue({
                el: '#content',
                data: {
                    article: {},
                    latestArticles: []
                },
                created: function() {

                },
                mounted: function() {
                    this.meanMenu()
                    this.showArticle()
                    this.showLatestArticles()
                },
                methods: {
                    logout: function () {
                        $.post(
                            LOGOUT_URL,
                            function(data) {
                                if (data.success === true) {
                                    window.location.href = '<%=path%>/index'
                                }
                            }
                        )
                    },
                    showArticle: function () {
                        $.post(
                            ARTICLE_DETAIL_URL,
                            {
                                articleId: articleId
                            },
                            function (data) {
                                if (data.success === true) {
                                    view.article = data.data
                                    view.article.coverImageUrl = BASE_URL + MODULE_ADMIN + view.article.coverImageUrl
                                    view.article.createDate = timestampToDatetime(view.article.createDate)
                                }
                            }
                        )
                    },
                    showLatestArticles: function () {
                        $.post(
                            ARTICLE_URL,
                            {
                                pageSize: 3,
                                currentPage: 1,
                                rootColumnId: ARTICLE_ROOT_COLUMN_ID
                            },
                            function (data) {
                                if (data.success === true) {
                                    view.latestArticles = data.data.list
                                    if (view.latestArticles.length > 0) {
                                        view.latestArticles.forEach(function(item, index) {
                                            item.coverImageUrl = BASE_URL + MODULE_ADMIN + item.coverImageUrl
                                            item.createDate = timestampToDatetime(item.createDate)
                                        })
                                    }
                                }
                            }
                        )
                    },
                    meanMenu: function () {
                        this.$nextTick(function() {
                            $('#my-mobile-menu').meanmenu()
                        })
                    }
                }
            });
        </script>
		<script src="<%=path%>/assets/js/main3.js"></script>
    </body>
</html>
