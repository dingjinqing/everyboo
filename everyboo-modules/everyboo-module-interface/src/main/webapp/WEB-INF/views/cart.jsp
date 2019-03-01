<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>艾瑞堡-我的购物车</title>
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

                        <!-- shopping-cart-area start -->
                        <div class="cart-area ptb-100">
                            <div class="container">
                                <div class="section-title text-center mb-50">
                                    <h2>
                                        我的购物车
                                        <i class="pe-7s-cart"></i>
                                    </h2>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12
                                        col-xs-12">
                                        <form action="#">
                                            <div class="table-content table-responsive">
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th>商品图片</th>
                                                            <th>商品名称</th>
                                                            <th>商品单价</th>
                                                            <th>购买数量</th>
                                                            <th>总价</th>
                                                            <th>删除</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="item in carts">
                                                            <td>
                                                                <a href="javascript:;"><img
                                                                        :src="item.proLogoImgFull"
                                                                        alt="" class="img-responsive"></a>
                                                            </td>
                                                            <td><a
                                                                    href="javascript:;" v-text="item.proName"></a></td>
                                                            <td><span v-text="'￥' + item.price"></span></td>
                                                            <td>
                                                                <input v-model="item.count"
                                                                    type="number">
                                                            </td>
                                                            <td v-text="'￥' + (item.price * item.count)"></td>
                                                            <td
                                                                class="product-remove"><a
                                                                    href="javascript:;" @click="removeCart(item.proId)"><i
                                                                        class="fa
                                                                        fa-times"></i></a></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="row tax-coupon-div">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="cart-total">
                                            <ul>
                                                <li class="cart-black">总价<span v-text="'￥' + totalPrice"></span></li>
                                            </ul>
                                            <div v-if="carts != null && carts.length > 0" class="cart-total-btn">
                                                <div class="cart-total-btn2 f-right">
                                                    <a href="<%=path%>/order-preview?from=cart">去结算</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- shopping-cart-area end -->
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
        <script src="<%=path%>/assets/js/everyboo.js?v=1.2"></script>
        <script>
            var view = new Vue({
                el: '#content',
                data: {
                    carts:[],
                    oCarts: [],
                    totalPrice: 0
                },
                created: function() {

                },
                mounted: function() {
                    this.meanMenu()
                    this.showCarts()
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
                    showCarts: function () {
                        $.post(
                            CART_LIST_URL,
                            function (data) {
                                if (data.success === true) {
                                    view.carts = data.data
                                    if (view.carts != null) {
                                        view.oCarts = JSON.parse(JSON.stringify(view.carts))
                                        view.carts.forEach(function (item, index) {
                                            item.proLogoImgFull = BASE_URL + MODULE_ADMIN + item.proLogoImg
                                            view.totalPrice += item.count * item.price
                                        })
                                    }
                                } else if (data.success === 'false' && data.msg === LOGIN_ERR_MSG) {
                                    window.location.href = '<%=path%>/login?relogin=y'
                                }
                            }
                        )
                    },
                    removeCart: function (productId) {
                        console.log(productId)
                        $.post(
                            CART_REMOVE_URL,
                            {
                                proId: productId
                            },
                            function (data) {
                                if (data.success === true) {
                                    for (var i = 0; i < view.carts.length; i++) {
                                        if (view.carts[i].proId === productId) {
                                            view.carts.splice(i, 1)
                                            break
                                        }
                                    }
                                } else if (data.success === 'false' && data.msg === LOGIN_ERR_MSG) {
                                    window.location.href = '<%=path%>/login?relogin=y'
                                }
                            }
                        )
                    },
                    meanMenu: function () {
                        this.$nextTick(function() {
                            $('#my-mobile-menu').meanmenu()
                        })
                    }
                },
                watch: {
                    carts: {
                        handler: function (newValue, oldValue) {
                            view.totalPrice = 0
                            if (newValue != null) {
                                newValue.forEach(function (item, index) {
                                    view.totalPrice += item.count * item.price
                                    view.oCarts.forEach(function (oitem, oindex) {
                                        if (item.count !== '' && oitem.proId === item.proId && oitem.count !== item.count) {
                                            $.post(
                                                CART_UPDATE_URL,
                                                {
                                                    proId: item.proId,
                                                    count: item.count
                                                },
                                                function (data) {
                                                    if (data.success === true) {
                                                        view.showCarts()
                                                    }
                                                }
                                            )
                                        }
                                    })
                                })
                            }
                        },
                        deep: true
                    }
                },
            });
        </script>
		    <script src="<%=path%>/assets/js/main3.js"></script>
        </body>
    </html>
