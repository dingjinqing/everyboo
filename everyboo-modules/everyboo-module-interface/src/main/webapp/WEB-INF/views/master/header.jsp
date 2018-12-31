<%--
  Created by IntelliJ IDEA.
  User: wangzhenyu
  Date: 2018/11/6
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- header start -->
<header class="header-area home-style-2">
    <div class="header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-3 col-xs-6">
                    <div class="logo" style="padding: 10px 0 0 0;">
                        <a href="<%=path%>/index">
                            <img src="<%=path%>/assets/img/logo/my-logo.png" class="img-responsive" style="max-height:60px;" alt="艾瑞堡在线商城">
                        </a>
                    </div>
                </div>
                <div class="col-md-8 col-sm-9 col-xs-6">
                    <div class="cart-menu">
                        <div class="user user-style-3 f-right">
                            <a href="#" id="open-button">
                                <i class="pe-7s-user"></i>
                            </a>
                        </div>

                        <div class="shopping-cart f-right">
                            <a class="top-cart" href="<%=path%>/cart"><i class="pe-7s-cart"></i></a>
                        </div>

                        <div class="search-style-2 f-right">
                            <a class="icon-search-2" href="#">
                                <i class="pe-7s-search"></i>
                            </a>
                            <div class="search2-content">
                                <form action="#">
                                    <div class="search-input-button2">
                                        <input class="" placeholder="搜索……" type="search">
                                        <button class="search-button2" type="submit">
                                            <i class="pe-7s-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>



                        <div class="main-menu f-right">
                            <nav>
                                <ul>
                                    <li>
                                        <a href="<%=path%>/index">首页</a>
                                    </li>
                                    <li>
                                        <a href="<%=path%>/shop">商城 </a>
                                    </li>
                                    <li><a href="<%=path%>/shop-proj">项目合作</a>
                                    <li><a href="<%=path%>/blog">资讯</a></li>
                                    <li><a href="<%=path%>/health">健康管理 </a>
                                    </li>
                                    <li><a href="<%=path%>/heart">爱心公益</a>
                                    </li>
                                    <li><a href="<%=path%>/contact">联系我们</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- header end -->
<!-- mobile-menu-area start -->
<div class="mobile-menu-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="mobile-menu">
                    <nav id="my-mobile-menu">
                        <ul>
                            <li>
                                <a href="<%=path%>/index">首页</a>
                            </li>
                            <li>
                                <a href="<%=path%>/shop">商城 </a>
                            </li>
                            <li><a href="<%=path%>/shop-proj">项目合作</a>
                            <li><a href="<%=path%>/blog">资讯</a></li>
                            <li><a href="<%=path%>/health">健康管理 </a>
                            </li>
                            <li><a href="<%=path%>/heart">爱心公益</a>
                            </li>
                            <li><a href="<%=path%>/contact">联系我们</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- mobile-menu-area end -->