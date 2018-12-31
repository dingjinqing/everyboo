<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>艾瑞堡-健康管理</title>
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

            <!-- blog area start -->
            <div class="blog-fullwidth-area ptb-100">
                <div class="container">
                    <div class="row">
                        <div v-if="articles.length === 0" class="col-md-12 text-center" style="margin-bottom: 20px;">暂无健康管理资讯</div>
                        <div v-for="item in articles" class="col-md-4 col-sm-6">
                            <div class="blog-details mb-30">
                                <div class="blog-img">
                                    <a :href="'<%=path%>/health-detail?id=' + item.id"><img :src="item.coverImageUrl" alt=""></a>
                                    <div class="blog-quick-view">
                                        <a :href="'<%=path%>/health-detail?id=' + item.id">
                                            <i class="pe-7s-link"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="blog-meta">
                                    <h4><a :href="'<%=path%>/health-detail?id=' + item.id" v-text="item.title"></a></h4>
                                    <ul class="meta">
                                        <li v-text="item.publisher"></li>
                                        <li v-text="item.createDate"></li>
                                        <li>{{item.viewCount}}次查看</li>
                                    </ul>
                                    <p v-text="item.summary"></p>
                                    <a :href="'<%=path%>/health-detail?id=' + item.id">查看</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="page-pagination text-center">
                                <ul>
                                    <li><a href="javascript:;" @click="previousPage"><i class="fa fa-angle-double-left"></i></a></li>
                                    <li v-for="page in pageNumbers">
                                        <a href="javascript:;" :class="currentPage == page ? 'active' : ''" @click="goPage(page)" v-text="page"></a>
                                    </li>
                                    <li><a href="javascript:;" @click="nextPage"><i class="fa fa-angle-double-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- blog area end -->
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
    var view = new Vue({
        el: '#content',
        data: {
            articles: [],
            totalPage: 0,
            currentPage: 1,
            pageNumbers: []
        },
        created: function() {

        },
        mounted: function() {
            this.meanMenu()
            this.showArticles(true, 1)
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
            showArticles: function (init, pageNo) {
                var self = this
                $.post(
                    ARTICLE_URL,
                    {
                        pageSize: 9,
                        currentPage: pageNo,
                        rootColumnId: HEALTH_ROOT_COLUMN_ID
                    },
                    function (data) {
                        if (data.success === true) {
                            view.articles = data.data.list
                            view.totalPage = data.data.totalPage
                            if (view.articles.length > 0) {
                                view.articles.forEach(function(item, index) {
                                    item.coverImageUrl = BASE_URL + MODULE_ADMIN + item.coverImageUrl
                                    item.createDate = timestampToDatetime(item.createDate)
                                })
                            }
                            if (init) {
                                self.initPageNumbers()
                            }
                        }
                    }
                )
            },
            initPageNumbers: function () {
                if (view.totalPage <= 5) {
                    for (var i = 1; i <= view.totalPage; i++) {
                        view.pageNumbers.push(i)
                    }
                } else {
                    view.pageNumbers = [1, 2, 3, 4, 5]
                }
            },
            getPageNumbers: function () {
                if (view.totalPage <= 5) {

                } else {
                    if (view.currentPage >= 3 && (view.currentPage + 2) <= view.totalPage) {
                        view.pageNumbers = [view.currentPage - 2, view.currentPage - 1, view.currentPage, view.currentPage + 1, view.currentPage + 2]
                    } else if (view.currentPage + 1 === view.totalPage) {
                        view.pageNumbers = [view.currentPage - 3, view.currentPage - 2, view.currentPage - 1, view.currentPage, view.currentPage + 1]
                    }
                }
            },
            previousPage: function () {
                if (view.currentPage === 1) {
                    return
                }
                view.currentPage -= 1
                this.getPageNumbers()
                this.showArticles(false, view.currentPage)
            },
            nextPage: function () {
                if (view.currentPage === view.totalPage) {
                    return
                }
                view.currentPage += 1
                this.getPageNumbers()
                this.showArticles(false, view.currentPage)
            },
            goPage: function (pageNo) {
                view.currentPage = pageNo
                this.getPageNumbers()
                this.showArticles(false, view.currentPage)
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
