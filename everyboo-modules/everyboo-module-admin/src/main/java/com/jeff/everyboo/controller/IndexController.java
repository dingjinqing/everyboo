package com.jeff.everyboo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台工程欢迎页
 * @author dingjinqing@163.com
 * @since 2017-12-02
 */
@Controller
public class IndexController {
	
	/**
	 * 入口
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "index";
	}

}
