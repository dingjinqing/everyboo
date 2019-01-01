package com.jeff.everyboo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeff.everyboo.cms.dto.ShopProductQueryDTO;
import com.jeff.everyboo.cms.entity.ShopProduct;
import com.jeff.everyboo.cms.service.ShopProductService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
/**
 * 用户管理Controller
 * @author dingjinqing@163.com
 *
 */
@Controller
@RequestMapping("/api/shopproduct")
public class ShopProductController {

	@Autowired
	private ShopProductService productService;
	
	
	@RequestMapping("/list")
	@ResponseBody
	public AjaxResult list(HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		AjaxResult ajaxResult = new AjaxResult();
		
		String type = request.getParameter("type");
		String hot = request.getParameter("hot");
		String proName = request.getParameter("proName");
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");
		
		int currentPage = 1;
		int pageSize = 10;
		if(StringUtils.isNotBlank(currentPageStr)){
			currentPage = Integer.parseInt(currentPageStr);
		}
		if(StringUtils.isNotBlank(pageSizeStr)){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		
		ShopProductQueryDTO queryDTO = new ShopProductQueryDTO();
		queryDTO.setType(type);
		queryDTO.setStatus("1");
		if(StringUtils.isNotBlank(hot)){
			queryDTO.setHot(Byte.parseByte(hot));
		}
		queryDTO.setProName(proName);
		queryDTO.setCurrentPage(currentPage);
		queryDTO.setPageSize(pageSize);
		
		PageModel<ShopProduct> page = productService.queryShopProductPage(queryDTO);
		ajaxResult.setData(page);
		ajaxResult.setSuccess(true);
		return ajaxResult;
	}
	
	@RequestMapping("/getDetail")
	@ResponseBody
	public AjaxResult dialogEdit(HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		AjaxResult ajaxResult = new AjaxResult();
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)){
			ShopProduct bean = productService.find(Integer.parseInt(id));
			ajaxResult.setData(bean);
			ajaxResult.setSuccess(true);
		}else {
			ajaxResult.setMsg("请输入id");
			ajaxResult.setSuccess(false);
		}
		return ajaxResult;
	}
	
}
