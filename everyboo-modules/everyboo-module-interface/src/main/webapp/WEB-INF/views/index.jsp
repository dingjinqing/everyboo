<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="en">
    
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>艾瑞堡-在线商城首页</title>
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
</head>
<body>


    <div id="content" class="canvas-wrapper">
        <%@include file="master/left-account.jsp"%>
        
        <div class="content-wrap">
            <div class="content">
                <%@include file="master/header.jsp"%>
                <!-- slider start -->
                <section class="hero-slider-container">
                    <div class="hero-slider owl-carousel">
                        <div v-for="item in banners" class="hero-slider-item" :style="{backgroundImage:'url(' + item.coverImageUrl + ')'}">
                            <!--
                            <div class="hero-slider-contents">
                                <div class="container">
                                    <h1 class="title1" v-text="item.title"></h1>
                                    <p class="title2" v-text="item.summary"></p>
                                    <a :href="item.href" class="button-hover">查看</a>
                                </div>
                            </div>
                            -->
                        </div>
                    </div>

                    <a href="#" class="hero-slider-nav prev"><i class="fa fa-angle-left"></i></a>
                    <a href="#" class="hero-slider-nav next"><i class="fa fa-angle-right"></i></a>
                </section>
                <!-- slider end -->

                <!-- shop area start -->
                <div class="portfolio-area pt-100 pb-70">
                    <div class="container">
                        <div class="section-title text-center mb-50">
                            <h2>会员大礼包<i class="fa fa-shopping-cart"></i></h2>
                        </div>		
                        <div class="row portfolio-style-2">
                            <div class="grid">
                                <div v-for="item in giftProducts" class="col-md-3 col-sm-6 col-xs-12 mb-30">
                                    <div class="single-shop">
                                        <div class="shop-img">
                                            <a :href="'<%=path%>/product?id=' + item.id"><img :src="item.proLogoImgFull" alt="" /></a>
                                            <div class="shop-quick-view">
                                                <a :href="'<%=path%>/product?id=' + item.id">
                                                    <i class="pe-7s-look"></i>
                                                </a>
                                            </div>
                                            <div class="price-up-down">
                                                <span class="sale-new">sale</span>
                                            </div>
                                        </div>
                                        <div class="shop-text-all">
                                            <div class="title-color fix">
                                                <div class="shop-title f-left">
                                                    <h3><a :href="'<%=path%>/product?id=' + item.id" v-text="item.proName"></a></h3>
                                                </div>
                                                <span class="price f-right">
                                                    <span class="new" v-text="'￥' + item.price"></span>
                                                </span>
                                            </div>
                                            <div class="fix">
                                                <span class="f-left" v-text="item.introduction"></span>
                                            </div>
                                        </div>									
                                    </div>
                                </div>
                            </div>		
                        </div>
                    </div>
                </div>
                <!-- shop area end -->
                <!-- blog area start -->
                <div class="blog-area gray-bg pt-100 pb-70">
                    <div class="container">
                        <div class="section-title text-center mb-50">
                            <h2>最新资讯<i class="fa fa-pencil"></i></h2>
                        </div>
                        <div class="row">
                            <div v-for="item in latestArticles" class="col-md-4 col-sm-6">
                                <div class="blog-details mb-30">
                                    <div class="blog-img">
                                        <a :href="'<%=path%>/blog-detail?id=' + item.id"><img :src="item.coverImageUrl" alt=""></a>
                                        <div class="blog-quick-view">
                                            <a :href="'<%=path%>/blog-detail?id=' + item.id">
                                                <i class="pe-7s-link"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="blog-meta">
                                        <h4><a :href="'<%=path%>/blog-detail?id=' + item.id" v-text="item.title"></a></h4>
                                        <ul class="meta">
                                            <li v-text="item.publisher"></li>
                                            <li v-text="item.createDate"></li>
                                            <li>{{item.viewCount}}次查看</li>
                                        </ul>
                                        <p v-text="item.summary"></p>
                                        <a :href="'<%=path%>/blog-detail?id=' + item.id">查看</a>
                                    </div>
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
    <script src="<%=path%>/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="<%=path%>/assets/js/snap.svg-min.js"></script>
    <script src="<%=path%>/assets/js/bootstrap.min.js"></script>
    <script src="<%=path%>/assets/js/jquery.meanmenu.js"></script>
    <script src="<%=path%>/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=path%>/assets/js/isotope.pkgd.min.js"></script>
    <script src="<%=path%>/assets/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=path%>/assets/js/owl.carousel.min.js"></script>
    <script src="<%=path%>/assets/js/jquery.validate.min.js"></script>
    <script src="<%=path%>/lib/js/jquery.nivo.slider.js"></script>
    <script src="<%=path%>/assets/js/plugins.js"></script>
    <script src="<%=path%>/assets/js/main.js"></script>
    <script src="<%=path%>/assets/js/classie.js"></script>

    <script src="<%=path%>/assets/js/vue.min.js"></script>
    <script src="<%=path%>/assets/js/everyboo.js?v=1.1"></script>
    <script>
        var view = new Vue({
            el: '#content',
            data: {
                banners: [],
                giftProducts: [],
                latestArticles: []
            },
            created: function() {

            },
            mounted: function() {
                this.meanMenu()
                this.showBanners()
                this.showGiftProducts()
                this.showLatestArticles()
            },
            methods: {
                logout: function () {
                  $.post(
                      LOGOUT_URL,
                      function(data) {
                          if (data.success === true) {
                              window.location.href = '<%=path%>/index'
                              window.localStorage.removeItem(USER_INFO)
                          }
                      }
                  )
                },
                showBanners: function () {
                    var self = this
                    $.post(
                        ARTICLE_URL,
                        {
                            pageSize: 10,
                            currentPage: 1,
                            columnId: BANNER_COLUMN_ID
                        },
                        function (data) {
                            if (data.success === true) {
                                view.banners = data.data.list
                                if (view.banners.length > 0) {
                                    view.banners.forEach(function(item, index) {
                                        item.coverImageUrl = BASE_URL + MODULE_ADMIN + item.coverImageUrl
                                    })
                                    self.showBannersJquery()
                                }
                            }
                        }
                    )
                },
                showBannersJquery: function () {
                    this.$nextTick(function() {
                        var $heroSlider = $('.hero-slider').owlCarousel({
                            animateIn: 'lightSpeedIn',
                            animateOut: 'lightSpeedOut',
                            autoplay: true,
                            autoplayTimeout: 5000,
                            dots: false,
                            loop: true,
                            mouseDrag: false,
                            nav: false,
                            responsive: {
                                0: {
                                    items: 1
                                }
                            }
                        });

                        $('.hero-slider-nav').on('click', function (e) {
                            e.preventDefault();

                            if ($(this).hasClass('prev')) {
                                $heroSlider.trigger('prev.owl.carousel');
                            } else {
                                $heroSlider.trigger('next.owl.carousel');
                            }
                        });
                    })
                },
                showGiftProducts: function () {
                    $.post(
                        PRODUCT_URL,
                        {
                            pageSize: 50,
                            currentPage: 1,
                            type: 1
                        },
                        function (data) {
                            if (data.success === true) {
                                view.giftProducts = data.data.list
                                if (view.giftProducts.length > 0) {
                                    view.giftProducts.forEach(function(item, index) {
                                        item.proLogoImgFull = BASE_URL + MODULE_ADMIN + item.proLogoImg
                                        item.price = item.price1
                                    })
                                }
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
