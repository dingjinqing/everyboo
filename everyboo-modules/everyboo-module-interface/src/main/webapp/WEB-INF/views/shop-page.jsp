<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>艾瑞堡-商城</title>
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

                    <div class="shop-page-area ptb-100">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="blog-sidebar">
                                        <div class="single-sidebar">
                                            <h3 class="sidebar-title">爆款热门</h3>
                                            <div v-if="hotProducts.length == 0">
                                            暂无
                                            </div>
                                            <div v-else>
                                                <div v-for="item in hotProducts" class="single-shop mb-40">
                                                    <div class="shop-img">
                                                        <a :href="'<%=path%>/product?id=' + item.id"><img :src="item.proLogoImgFull" alt="" /></a>
                                                        <div class="shop-quick-view">
                                                            <a :href="'<%=path%>/product?id=' + item.id">
                                                                <i class="pe-7s-look"></i>
                                                            </a>
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
                                <div class="col-md-9">
                                    <div class="blog-wrapper shop-page-mrg">
                                        <div class="tab-menu-product">
                                            <div class="tab-menu-sort">
                                                <div class="tab-sort">
                                                    <label>排序: </label>
                                                    <select style="width: 60px;">
                                                        <option value="1">综合</option>
                                                        <option value="2">价格</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="tab-product">
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="grid"> 
                                                        <div class="row">
                                                            <div v-if="products.length === 0" class="col-md-12 text-center" style="margin-bottom: 20px;">暂无商品</div>
                                                            <div v-else v-for="item in products" class="col-md-6 col-lg-4 col-sm-6">
                                                                <div class="single-shop mb-40">
                                                                    <div class="shop-img">
                                                                        <a :href="'<%=path%>/product?id=' + item.id"><img :src="item.proLogoImgFull" alt="" /></a>
                                                                        <div class="shop-quick-view">
                                                                            <a :href="'<%=path%>/product?id=' + item.id">
                                                                                <i class="pe-7s-look"></i>
                                                                            </a>
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- login area end -->
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
                    products: [],
                    totalPage: 0,
                    currentPage: 1,
                    pageNumbers: [],
                    hotProducts: []
                },
                created: function() {

                },
                mounted: function() {
                    this.meanMenu()
                    this.showProducts(true, 1)
                    this.showHotProducts()
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
                    showProducts: function (init, pageNo) {
                        var self = this
                        var userLevel = '${sessionScope.userInfo.vipLevel}'
                        $.post(
                            PRODUCT_URL,
                            {
                                pageSize: 15,
                                currentPage: pageNo,
                                type: 2
                            },
                            function (data) {
                                if (data.success === true) {
                                    view.products = data.data.list
                                    view.totalPage = data.data.totalPage
                                    if (view.products.length > 0) {
                                        view.products.forEach(function(item, index) {
                                            item.proLogoImgFull = BASE_URL + MODULE_ADMIN + item.proLogoImg
                                            // 如果不是会员大礼包
                                            if (item.type !== '1') {
                                                if (userLevel != null && userLevel !== undefined && userLevel !== '') {
                                                    item.price = item[USER_PRICE[userLevel]]
                                                } else {
                                                    item.price = item.price1
                                                }
                                            } else {
                                                item.price = item.price1
                                            }
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
                        this.showProducts(false, view.currentPage)
                    },
                    nextPage: function () {
                        if (view.currentPage === view.totalPage) {
                            return
                        }
                        view.currentPage += 1
                        this.getPageNumbers()
                        this.showProducts(false, view.currentPage)
                    },
                    goPage: function (pageNo) {
                        view.currentPage = pageNo
                        this.getPageNumbers()
                        this.showProducts(false, view.currentPage)
                    },
                    meanMenu: function () {
                        this.$nextTick(function() {
                            $('#my-mobile-menu').meanmenu()
                        })
                    },
                    showHotProducts: function () {
                        var userLevel = '${sessionScope.userInfo.vipLevel}'
                        $.post(
                            PRODUCT_URL,
                            {
                                pageSize: 15,
                                currentPage: 1,
                                type: 2,
                                hot: 1
                            },
                            function (data) {
                                if (data.success === true) {
                                    view.hotProducts = data.data.list
                                    if (view.hotProducts.length > 0) {
                                        view.hotProducts.forEach(function(item, index) {
                                            item.proLogoImgFull = BASE_URL + MODULE_ADMIN + item.proLogoImg
                                            // 如果不是会员大礼包
                                            if (item.type !== '1') {
                                                if (userLevel != null && userLevel !== undefined && userLevel !== '') {
                                                    item.price = item[USER_PRICE[userLevel]]
                                                } else {
                                                    item.price = item.price1
                                                }
                                            } else {
                                                item.price = item.price1
                                            }
                                        })
                                    }
                                }
                            }
                        )
                    },
                }
            });
        </script>
		<script src="<%=path%>/assets/js/main3.js"></script>
    </body>
</html>
