<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangzhenyu
  Date: 2018/11/6
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="menu-wrap">
    <nav class="menu">
        <div class="icon-list">
            <h5 class="mt-2">个人中心</h5>
            <a href="<%=path%>/user"><i class="pe-7s-user"></i><span>我的资料</span></a>
            <a href="<%=path%>/profit"><i class="pe-7s-gift"></i><span>我的收益</span></a>
            <a href="<%=path%>/team"><i class="pe-7s-users"></i><span>我的团队</span></a>
            <a href="<%=path%>/order"><i class="pe-7s-shopbag"></i><span>我的订单</span></a>
            <a href="<%=path%>/cart"><i class="pe-7s-cart"></i><span>我的购物车</span></a>
            <a href="<%=path%>/share-reg?refPhone=${sessionScope.userInfo.phone}"><i class="pe-7s-share"></i><span>分享注册</span></a>
            <a href="<%=path%>/qrcode"><i class="pe-7s-share"></i><span>我的邀请二维码</span></a>
            <c:if test="${sessionScope.userInfo.vipLevel == 'v7'}">
                <a href="<%=path%>/holder-profit-detail"><i class="pe-7s-gift"></i><span>平台日利润明细</span></a>
            </c:if>
            <c:if test="${empty sessionScope.userInfo.id}">
                <a href="<%=path%>/login"><i class="pe-7s-next-2"></i><span>登录</span></a>
                <a href="<%=path%>/register"><i class="pe-7s-add-user"></i><span>注册</span></a>
            </c:if>
            <c:if test="${!empty sessionScope.userInfo.id}">
                <a href="javascript:;"><span>${sessionScope.userInfo.phone}</span></a>
                <a href="javascript:;" @click="logout"><span>安全退出</span></a>
            </c:if>
        </div>
    </nav>
    <button class="close-button" id="close-button">Close Menu</button>
    <div class="morph-shape" id="morph-shape" data-morph-open="M-1,0h101c0,0,0-1,0,395c0,404,0,405,0,405H-1V0z">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 100 800" preserveAspectRatio="none">
            <path d="M-1,0h101c0,0-97.833,153.603-97.833,396.167C2.167,627.579,100,800,100,800H-1V0z"></path>
        </svg>
    </div>
</div>
