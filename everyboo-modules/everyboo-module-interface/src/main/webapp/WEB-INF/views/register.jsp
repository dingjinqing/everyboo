<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="en">
    
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>艾瑞堡-用户注册</title>
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
                                            <h4>用户注册</h4>
                                        </div>
                                        <div class="login-form">
                                            <form>
                                                <input v-model="form.phone" placeholder="请输入手机号" type="text">
                                                <input v-model="form.password" placeholder="请输入密码" type="password">
                                                <input v-model="form.code" placeholder="请输入短信验证码" type="text">
                                                <button v-if="sendCode == false" type="button"
                                                        @click="smsCode"
                                                        style="background-color: #333;border: medium none;color: #fff;font-size: 15px;letter-spacing: 1px;margin-bottom: 20px;padding: 10px;text-transform: uppercase;transition: all .3s ease 0s;">
                                                    获取短信验证码
                                                </button>
                                                <div v-if="sendCode == true" v-text="seconds" style="margin-bottom: 20px;"></div>
                                                <input v-model="form.refPhone" placeholder="请输入推荐人手机号" type="text">
                                                <div v-html="errMsg" style="color: red; font-size: 12px;"></div>
                                                <div class="button-remember">
                                                    <button class="login-btn" type="button" @click="register">注册</button>
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
            var view = new Vue({
                el: '#content',
                data: {
                    form: {
                        phone: '',
                        code: '',
                        password: '',
                        refPhone: ''
                    },
                    sendCode: false,
                    seconds: '',
                    errMsg: ''
                },
                created: function() {

                },
                mounted: function() {
                    this.meanMenu()
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
                    smsCode: function () {
                        view.errMsg = ''
                        if (!isPhone(view.form.phone.trim())) {
                            view.errMsg += '请输入正确的手机号<br/>'
                        }
                        if (view.errMsg === '') {
                            $.post(
                                SMS_CODE_URL,
                                {
                                    phone: view.form.phone
                                },
                                function (data) {
                                    if (data.success === false) {
                                        view.errMsg = data.msg
                                    } else {
                                        view.sendCode = true
                                        var count = 60
                                        var timer = setInterval(function () {
                                            view.seconds = '发送成功，' + (count--) + '秒后重新获取'
                                            if (count === 0) {
                                                view.sendCode = false
                                                clearInterval(timer)
                                            }
                                        }, 1000)
                                    }
                                }
                            )
                        }
                    },
                    register: function () {
                        view.errMsg = ''
                        var errMsg = ''
                        if (!isPhone(view.form.phone.trim())) {
                            errMsg += '请输入正确的手机号<br/>';
                        }
                        if (view.form.password.trim() === '') {
                            errMsg += '请输入密码<br/>';
                        }
                        if (view.form.code.trim() === '') {
                            errMsg += '请输入短信验证码<br/>';
                        }
                        if (view.form.refPhone.trim() !== '' && !isPhone(view.form.refPhone.trim())) {
                            errMsg += '请输入正确的推荐手机号<br/>';
                        }
                        if (view.form.phone.trim() === view.form.refPhone.trim()) {
                            errMsg += '推荐人手机号不能与注册手机号相同<br/>'
                        }
                        if (errMsg === '') {
                            $.post(
                                PHONE_VALIDATE_URL,
                                {
                                    phone: view.form.phone
                                },
                                function (data) {
                                    if (data.success === false) {
                                        view.errMsg = data.msg
                                    } else {
                                        $.post(
                                            REGISTER_URL,
                                            Qs.stringify(view.form),
                                            function (data) {
                                                if (data.success === false) {
                                                    view.errMsg = data.msg
                                                } else {
                                                    view.errMsg = '注册成功，3秒后自动跳转到登录界面'
                                                    setTimeout(function() {
                                                        window.location.href = '<%=path%>/login'
                                                    }, 3000)
                                                }
                                            })
                                    }
                                }
                            )

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
