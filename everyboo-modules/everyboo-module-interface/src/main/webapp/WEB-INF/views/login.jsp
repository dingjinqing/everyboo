<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="en">
    
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>艾瑞堡-用户登录</title>
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

                    <!-- login area end -->
                    <div class="login-area ptb-100">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <div class="login-content">
                                        <div class="login-title">
                                            <h4>用户登录</h4>
                                            <p v-if="relogin == 'y'" style="color: red;">您还未登录或登录已失效，请重新登录！</p>
                                        </div>
                                        <div class="login-form">
                                            <form action="#">
                                                <input v-model="form.phone" placeholder="请输入手机号" type="text">
                                                <input v-model="form.pwd" placeholder="请输入密码" type="password">
                                                <span v-html="errMsg" style="color: red; font-size: 12px;"></span>
                                                <button class="login-btn" type="button" @click="login">登录</button>
                                                <div class="new-account">
                                                    <p>还没有账号？ <a href="<%=path%>/register">注册新账号</a></p>
                                                    <p>忘记登录密码？ <a href="<%=path%>/reset-pwd">重置登录密码</a></p>
                                                </div>
                                            </form>
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
        <script src="https://cdn.bootcss.com/qs/6.5.2/qs.min.js"></script>
        <script>
            var relogin = '${requestScope.relogin}'
            var view = new Vue({
                el: '#content',
                data: {
                    form: {
                        phone: '',
                        pwd: ''
                    },
                    errMsg: '',
                    relogin: 'n'
                },
                created: function() {

                },
                mounted: function() {
                    this.meanMenu()
                    this.relogin = relogin
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
                    login: function () {
                        view.errMsg = ''
                        var errMsg = ''
                        if (!isPhone(view.form.phone.trim())) {
                            errMsg += '请输入正确的手机号<br/>';
                        }
                        if (view.form.pwd.trim() === '') {
                            errMsg += '请输入密码<br/>';
                        }
                        if (errMsg === '') {
                            $.post(LOGIN_URL,
                                Qs.stringify(view.form),
                                function (data) {
                                    if (data.success === false) {
                                        view.errMsg = data.msg
                                    } else {
                                        window.location.href = '<%=path%>/user'
                                    }
                                })
                        } else {
                            view.errMsg = errMsg;
                        }
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
