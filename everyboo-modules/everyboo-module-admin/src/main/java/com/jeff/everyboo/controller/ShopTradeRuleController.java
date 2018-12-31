package com.jeff.everyboo.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeff.everyboo.cms.dto.ShopProductQueryDTO;
import com.jeff.everyboo.cms.dto.ShopTradeRuleQueryDTO;
import com.jeff.everyboo.cms.entity.ShopProduct;
import com.jeff.everyboo.cms.entity.ShopTradeRule;
import com.jeff.everyboo.cms.service.ShopProductService;
import com.jeff.everyboo.cms.service.ShopTradeRuleService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.util.Constants;

@Controller
@RequestMapping("/traderule")
public class ShopTradeRuleController {

	@Autowired
	private ShopTradeRuleService shopService;
	@Autowired
	private ShopProductService productService;
	
	/**
	 * 获取列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model){
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");
		String vipLevel = request.getParameter("vipLevel");
		String proId = request.getParameter("proId");
		
		int currentPage = 1;
		int pageSize = 10;
		int prod = 0;
		if(StringUtils.isNotBlank(currentPageStr)){
			currentPage = Integer.parseInt(currentPageStr);
		}
		if(StringUtils.isNotBlank(pageSizeStr)){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		if(StringUtils.isNotBlank(proId)){
			prod = Integer.parseInt(proId);
		}
		
		ShopTradeRuleQueryDTO queryDTO = new ShopTradeRuleQueryDTO();
		queryDTO.setCurrentPage(currentPage);
		queryDTO.setPageSize(pageSize);
		queryDTO.setVipLevel(vipLevel);
		queryDTO.setProId(prod);
		
		PageModel<ShopTradeRule> page = shopService.queryShopTradeRulePage(queryDTO);
		model.addAttribute("page", page);
		model.addAttribute("queryDTO", queryDTO);
		
		ShopProductQueryDTO pqueryDTO = new ShopProductQueryDTO();
		pqueryDTO.setStatus("1");
		pqueryDTO.setType("2");
		List<ShopProduct> productList = productService.queryShopProductList(pqueryDTO);
		model.addAttribute("productList", productList);
		
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_TRADE_RULE);
		
		return "shop/traderule_list";
	}
	
	
	/**
	 * 跳转到编辑页
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/edit")
	public String dialogEdit(HttpServletRequest request, Model model){
		
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)){
			ShopTradeRule bean = shopService.find(Integer.parseInt(id));
			model.addAttribute("bean", bean);
		}
		ShopProductQueryDTO queryDTO = new ShopProductQueryDTO();
		queryDTO.setStatus("1");
		queryDTO.setType("2");
		List<ShopProduct> productList = productService.queryShopProductList(queryDTO);
		model.addAttribute("productList", productList);
		return "shop/dialog/traderule_edit";
	}
	
	/**
	 * 保存操作
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public AjaxResult ajaxSave(HttpServletRequest request,ShopTradeRule bean){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		try {
			if(bean.getId()!=null&&bean.getId()!=0){
				bean.setUpdateDate(new Date());
				shopService.update(bean);
			}else{
				bean.setCreateDate(new Date());
				shopService.save(bean);
			}
			ajaxResult.setSuccess(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setMsg(e.getMessage());
		}
		
		return ajaxResult;
	}
	
	
	
}
