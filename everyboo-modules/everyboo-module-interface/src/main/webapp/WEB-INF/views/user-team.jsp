<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>艾瑞堡-个人中心</title>
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
                            <div id="team" class="section-title text-center mb-50">
                                <h2>
                                    我的团队
                                    <i class="pe-7s-users"></i>
                                </h2>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <h4>直推团队</h4>
                                    <div class="table-content table-responsive">
                                        <table>
                                        <thead>
                                        <tr>
                                            <th>姓名</th>
                                            <th>手机号</th>
                                            <th>等级</th>
                                            <th>昵称</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr v-for="item in directTeam">
                                            <td v-text="item.account"></td>
                                            <td v-text="item.phone"></td>
                                            <td v-text="item.userLevel"></td>
                                            <td v-text="item.nickname"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <h4>间推团队</h4>
                                    <div class="table-content table-responsive">
                                        <table>
                                        <thead>
                                        <tr>
                                            <th>姓名</th>
                                            <th>等级</th>
                                            <th>昵称</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr v-for="item in otherTeam">
                                            <td v-text="item.account"></td>
                                            <td v-text="item.userLevel"></td>
                                            <td v-text="item.nickname"></td>
                                        </tr>
                                        </tbody>
                                    </table>
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
            var view = new Vue({
                el: '#content',
                data: {
                    directTeam: [],
                    otherTeam: []
                },
                created: function() {

                },
                mounted: function() {
                    this.meanMenu()
                    this.getTeam()
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
                    getTeam: function () {
                        $.post(
                            USER_TEAM_URL,
                            {
                                phone: ${sessionScope.userInfo.phone}
                            },
                            function (data) {
                                if (data.success === true) {
                                    view.directTeam = data.data.zhitui
                                    view.otherTeam = data.data.jiantui
                                    view.directTeam.forEach(function (item, index) {
                                        item.userLevel = item.viplevel + '-' + USER_LEVELS[item.viplevel]
                                    })
                                    view.otherTeam.forEach(function (item, index) {
                                        item.userLevel = item.viplevel + '-' + USER_LEVELS[item.viplevel]
                                    })
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
                }
            });
        </script>
		<script src="<%=path%>/assets/js/main3.js"></script>
    </body>
</html>
