<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path= request.getContextPath();
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
                                        订单预览
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
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="product in products">
                                                            <td>
                                                                <a href="javascript:;"><img
                                                                        :src="product.proLogoImgFull" class="img-responsive"
                                                                        alt=""></a>
                                                            </td>
                                                            <td><a
                                                                    href="javascript:;" v-text="product.proName"></a></td>
                                                            <td><span v-text="'￥' + product.price"></span></td>
                                                            <td>
                                                                <span v-text="product.count"></span>
                                                            </td>
                                                            <td v-text="'￥' + (product.price * product.count)"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="row tax-coupon-div">
                                    <div class="col-md-12 login-form" style="text-align: right;">
                                        姓名：<span v-text="user.account"></span><br/>
                                        收货地址：<span v-text="user.address"></span><br/>
                                        <a href="<%=path%>/user?operation=1">去设置姓名和收货地址</a><br/>
                                        账户健康余额：<span v-text="user.shopUserExts.balance"></span><br/>
                                        账户消费积分：<span v-text="user.shopUserExts.credits"></span><br/>
                                        账户兑换积分：<span v-text="user.shopUserExts.duihuan"></span><br/>
                                        最高可抵扣消费积分：<span v-text="totalCredits"></span><br/>
                                        <form>
                                            抵扣消费积分：<input v-model="useCredits" placeholder="请输入需要抵扣的积分数" type="number" style="width: 100px;">
                                            <br/>
                                            备注：<input v-model="remark" placeholder="请输入订单备注" type="text" style="width: 200px;">
                                            <br/>
                                            交易密码：<input v-model="payPwd" placeholder="请输入交易密码" type="password" style="width: 200px;">
                                        </form>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="cart-total">
                                            <ul>
                                                <li class="cart-black">总价<span v-text="'￥' + totalPrice"></span></li>
                                            </ul>
                                            <div style="text-align: right;color: red;" v-html="errMsg"></div>
                                            <div v-if="products.length > 0 && !submitted && !submitting" class="cart-total-btn">
                                                <div class="cart-total-btn2 f-right">
                                                    <a href="javascript:;" @click="submitOrder">提交订单</a>
                                                </div>
                                            </div>
                                            <div v-if="!submitted && submitting" class="cart-total-btn">
                                                <div class="cart-total-btn2 f-right">
                                                    <a href="javascript:;">正在提交订单……</a>
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
        <script src="<%=path%>/assets/js/everyboo.js?v=1.1"></script>
        <script>
            var productId = '${requestScope.id}'
            var quantity = '${requestScope.quantity}'
            var from = '${requestScope.from}'
            var userId = ${sessionScope.userInfo.id}
            var view = new Vue({
                el: '#content',
                data: {
                    products: [],
                    useCredits: 0,
                    totalPrice: 0,
                    totalCredits: 0,
                    oTotalPrice: 0,
                    jtype: 0,
                    submitted: false,
                    submitting: false,
                    payPwd: '',
                    remark: "",
                    errMsg: '',
                    user: {
                        shopUserExts: {}
                    }
                },
                created: function() {
                    if (!isNaN(productId) && productId !== '') {
                        productId = parseInt(productId)
                    } else {
                        productId = 0
                    }
                    if (!isNaN(quantity) && quantity !== '') {
                        quantity = parseInt(quantity)
                    } else {
                        quantity = 0
                    }
                },
                mounted: function() {
                    this.meanMenu()
                    this.getUser()
                    this.getProducts()
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
                    getUser: function () {
                        $.post(
                            USER_DETAIL_URL,
                            {
                                userId: userId
                            },
                            function (data) {
                                if (data.success === true) {
                                    view.user = data.data
                                } else if (data.success === 'false' && data.msg === LOGIN_ERR_MSG) {
                                    window.location.href = '<%=path%>/login?relogin=y'
                                }
                            }
                        )
                    },
                    getProducts: function () {
                        if (from === 'cart') {
                            $.post(
                                CART_LIST_URL,
                                function (data) {
                                    if (data.success === true) {
                                        view.products = data.data
                                        view.products.forEach(function (item, index) {
                                            view.totalPrice += item.count * item.price
                                            view.oTotalPrice = view.totalPrice
                                            view.totalCredits += item.credits
                                            item.id = item.proId
                                            item.proLogoImgFull = BASE_URL + MODULE_ADMIN + item.proLogoImg
                                        })
                                        view.jtype = 2
                                    } else if (data.success === 'false' && data.msg === LOGIN_ERR_MSG) {
                                        window.location.href = '<%=path%>/login?relogin=y'
                                    }
                                }
                            )
                        } else {
                            var userLevel = this.user.vipLevel
                            $.post(
                                PRODUCT_DETAIL_URL,
                                {
                                    id: productId
                                },
                                function (data) {
                                    if (data.success === true) {
                                        data.data.proLogoImgFull = BASE_URL + MODULE_ADMIN + data.data.proLogoImg
                                        data.data.count = quantity
                                        // 如果不是会员大礼包
                                        if (data.data.type !== '1') {
                                            if (userLevel != null && userLevel !== undefined && userLevel !== '') {
                                                data.data.price = data.data[USER_PRICE[userLevel]]
                                            } else {
                                                data.data.price = data.data.price1
                                            }
                                        } else {
                                            data.data.price = data.data.price1
                                        }
                                        if (data.data.type === '2') {
                                            view.totalCredits += parseInt(data.data.consumeCredits)
                                        }
                                        view.products.push(data.data)
                                        view.totalPrice += quantity * data.data.price
                                        view.oTotalPrice = view.totalPrice
                                        if (data.data.type === '1') {
                                            view.jtype = 1
                                        } else if (data.data.type === '3') {
                                            view.jtype = 13
                                        } else if (data.data.type === '2') {
                                            view.jtype = 2
                                        }
                                    } else if (data.success === 'false' && data.msg === LOGIN_ERR_MSG) {
                                        window.location.href = '<%=path%>/login?relogin=y'
                                    }
                                }
                            )
                        }
                    },
                    submitOrder: function () {
                        var errMsg = ''
                        if (view.payPwd.trim() === '') {
                            errMsg += '请输入交易密码，若未设置请先在个人中心我的资料中设置交易密码<br/>'
                        }
                        if (errMsg !== '') {
                            view.errMsg = errMsg
                        } else {
                            view.submitting = true
                            view.errMsg = ''
                            if (view.useCredits === '') {
                                view.useCredits = 0
                            }
                            view.products.forEach(function (item, index) {
                                item.proId = item.id
                                item.id = ''
                            })
                            $.ajax(
                                {
                                    type: "POST",
                                    url: ORDER_CREATE_URL,
                                    contentType: "application/json; charset=utf-8",
                                    data: JSON.stringify({
                                        userId: userId,
                                        price: -view.totalPrice,
                                        credits: view.useCredits,
                                        jtype: view.jtype,
                                        payPwd: view.payPwd,
                                        remark: view.remark,
                                        shopTradeDetails: view.products
                                    }),
                                    dataType: "json",
                                    success: function (data) {
                                        if (data.success === true) {
                                            view.submitted = true
                                            view.submitting = false
                                            view.errMsg = '提交订单成功'
                                        } else if (data.success === false) {
                                            view.errMsg = data.msg
                                            view.submitting = false
                                        } else if (data.success === 'false' && data.msg === LOGIN_ERR_MSG) {
                                            window.location.href = '<%=path%>/login?relogin=y'
                                        }
                                    },
                                    error: function (data) {

                                    }
                                }
                            )
                        }
                    },
                    meanMenu: function () {
                        this.$nextTick(function() {
                            $('#my-mobile-menu').meanmenu()
                        })
                    }
                },
                watch: {
                    useCredits: {
                        handler: function (newValue, oldValue) {
                            var userCredits = parseInt(${sessionScope.userInfo.shopUserExts.credits})
                            // 用户总积分500 订单总金额200 可使用总积分100
                            if (view.totalCredits <= userCredits) {
                                if (newValue >= view.totalCredits) {
                                    view.useCredits = view.totalCredits
                                }
                            } else {
                                if (newValue >= userCredits) {
                                    view.useCredits = userCredits
                                }
                            }
                            if (newValue < 0) {
                                view.useCredits = 0
                            }
                            if (newValue === '-') {
                                view.useCredits = 0
                            }
                            view.totalPrice = view.oTotalPrice - view.useCredits
                        }
                    }
                }
            });
        </script>
		    <script src="<%=path%>/assets/js/main3.js"></script>
        </body>
    </html>
