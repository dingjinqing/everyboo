package com.jeff.everyboo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping("index")
    public String index(){
        return "index";
    }
    
    @RequestMapping("about")
    public String about() {
        return "about-us";
    }

    @RequestMapping("register")
    public String register() {
        return "register";
    }

    @RequestMapping("login")
    public ModelAndView login(String relogin) {
        ModelAndView mav = new ModelAndView("login");
        mav.addObject("relogin", relogin);
        return mav;
    }

    @RequestMapping("user")
    public ModelAndView userCenter(HttpSession session, String operation) {
        ModelAndView mav = new ModelAndView();
        if (session.getAttribute("userInfo") == null) {
            mav.setViewName("redirect:login?relogin=y");
            return mav;
        }
        mav.setViewName("user-center");
        mav.addObject("operation", operation);
        return mav;
    }

    @RequestMapping("team")
    public String userTeam(HttpSession session) {
        if (session.getAttribute("userInfo") == null) {
            return "redirect:login?relogin=y";
        }
        return "user-team";
    }

    @RequestMapping("profit")
    public String userProfit(HttpSession session) {
        if (session.getAttribute("userInfo") == null) {
            return "redirect:login?relogin=y";
        }
        return "user-profit";
    }

    @RequestMapping("profit-detail")
    public ModelAndView userProfitDetail(HttpSession session, String typeName, Integer type) {
        ModelAndView mav = new ModelAndView();
        if (session.getAttribute("userInfo") == null) {
            mav.setViewName("redirect:login?relogin=y");
            return mav;
        }
        mav.setViewName("user-profit-detail");
        mav.addObject("typeName", typeName);
        mav.addObject("type", type);
        return mav;
    }

    @RequestMapping("bill-detail")
    public String userBillDetail(HttpSession session) {
        if (session.getAttribute("userInfo") == null) {
            return "redirect:login?relogin=y";
        }
        return "user-bill-detail";
    }

    @RequestMapping("shop")
    public String shop() {
        return "shop-page";
    }

    @RequestMapping("shop-proj")
    public String shopProj() {
        return "shop-page-pro";
    }

    @RequestMapping("product")
    public ModelAndView product(Integer id) {
        ModelAndView mav = new ModelAndView("single-product");
        mav.addObject("id", id);
        return mav;
    }

    @RequestMapping("order")
    public String order(HttpSession session) {
        if (session.getAttribute("userInfo") == null) {
            return "redirect:login?relogin=y";
        }
        return "order";
    }

    @RequestMapping("order-detail")
    public ModelAndView orderDetail(HttpSession session, Integer id) {
        ModelAndView mav = new ModelAndView();
        if (session.getAttribute("userInfo") == null) {
            mav.setViewName("redirect:login?relogin=y");
            return mav;
        }
        mav.setViewName("order-detail");
        mav.addObject("id", id);
        return mav;
    }

    @RequestMapping("order-preview")
    public ModelAndView orderPreview(HttpSession session, @RequestParam(required = false) Integer id, @RequestParam(required = false) Integer quantity, @RequestParam(required = false) String from) {
        ModelAndView mav = new ModelAndView();
        if (session.getAttribute("userInfo") == null) {
            mav.setViewName("redirect:login?relogin=y");
            return mav;
        }
        mav.setViewName("order-preview");
        mav.addObject("id", id);
        mav.addObject("quantity", quantity);
        mav.addObject("from", from);
        return mav;
    }

    @RequestMapping("blog")
    public String blog() {
        return "blog-page";
    }

    @RequestMapping("blog-detail")
    public ModelAndView blogDetail(String id) {
        ModelAndView mav = new ModelAndView("blog-details");
        mav.addObject("id", id);
        return mav;
    }

    @RequestMapping("heart")
    public String heart() {
        return "heart";
    }

    @RequestMapping("heart-detail")
    public ModelAndView heartDetail(String id) {
        ModelAndView mav = new ModelAndView("heart-detail");
        mav.addObject("id", id);
        return mav;
    }

    @RequestMapping("health")
    public String health() {
        return "health";
    }

    @RequestMapping("health-detail")
    public ModelAndView healthDetail(String id) {
        ModelAndView mav = new ModelAndView("health-detail");
        mav.addObject("id", id);
        return mav;
    }

    @RequestMapping("contact")
    public String contact() {
        return "contact";
    }

    @RequestMapping("cart")
    public String cart(HttpSession session) {
        if (session.getAttribute("userInfo") == null) {
            return "redirect:login?relogin=y";
        }
        return "cart";
    }

    @RequestMapping("reset-pwd")
    public String resetLoginPwd() {
        return "reset-login-pwd";
    }

    @RequestMapping("share-reg")
    public ModelAndView shareRegister(String refPhone) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("share-register");
        mav.addObject("refPhone", refPhone);
        return mav;
    }

    @RequestMapping("qrcode")
    public ModelAndView showQrcode(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        if (session.getAttribute("userInfo") == null) {
            mav.setViewName("redirect:login?relogin=y");
            return mav;
        }
        mav.setViewName("qrcode");
        return mav;
    }
    
    @RequestMapping("recharge")
    public String showRecharge() {
    	return "chongzhi";
    }

    @RequestMapping("holder-profit-detail")
    public ModelAndView holderProfitDetail(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        if (session.getAttribute("userInfo") == null) {
            mav.setViewName("redirect:login?relogin=y");
            return mav;
        }
        mav.setViewName("holder-profit-detail");
        return mav;
    }


}
