package com.jeff.everyboo.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeff.everyboo.cms.dto.ShopRegisterRuleQueryDTO;
import com.jeff.everyboo.cms.entity.ShopRegisterRule;
import com.jeff.everyboo.cms.service.ShopRegisterRuleService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.util.Constants;

@Controller
@RequestMapping("/shoprule")
public class ShopRegisterRuleController {

	@Autowired
	private ShopRegisterRuleService shopService;
	
	/**
	 * 获取用户列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model){
//		String userName = request.getParameter("userName");
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
		
		ShopRegisterRuleQueryDTO queryDTO = new ShopRegisterRuleQueryDTO();
//		queryDTO.setUserName(userName);
		queryDTO.setCurrentPage(currentPage);
		queryDTO.setPageSize(pageSize);
		
		PageModel<ShopRegisterRule> page = shopService.queryShopRegisterRulePage(queryDTO);
		model.addAttribute("page", page);
		model.addAttribute("queryDTO", queryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_RULE_LIST);
		
		return "shop/rule_list";
	}
	
	
	/**
	 * 跳转到用户编辑页
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/edit")
	public String dialogEdit(HttpServletRequest request, Model model){
		
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)){
			ShopRegisterRule bean = shopService.find(Integer.parseInt(id));
			model.addAttribute("bean", bean);
			
		}
		
		return "shop/dialog/rule_edit";
	}
	
	/**
	 * 用户保存操作
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public AjaxResult ajaxSave(HttpServletRequest request,ShopRegisterRule bean){
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
