package com.jeff.everyboo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
import com.jeff.everyboo.common.util.ExcelUtils;
import com.jeff.everyboo.util.Constants;
/**
 * 用户管理Controller
 * @author dingjinqing@163.com
 *
 */
@Controller
@RequestMapping("/shopproduct")
public class ShopProductController {

	@Autowired
	private ShopProductService tradeService;
	
	/**
	 * 获取用户列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model){
		String status = request.getParameter("status");
		String type = request.getParameter("type");
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
		queryDTO.setStatus(status);
		queryDTO.setType(type);
		queryDTO.setProName(proName);
		queryDTO.setCurrentPage(currentPage);
		queryDTO.setPageSize(pageSize);
		
		PageModel<ShopProduct> page = tradeService.queryShopProductPage(queryDTO);
		model.addAttribute("page", page);
		model.addAttribute("queryDTO", queryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_PRODUCT_LIST);
		
		return "shop/product_list";
	}
	
	/**
	 * 导出用户数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/export")
	public String exportOrder(HttpServletRequest request, HttpServletResponse response){	
		String account = request.getParameter("account");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		String vipLevel = request.getParameter("vipLevel");
		
		ShopProductQueryDTO queryDTO = new ShopProductQueryDTO();
//		queryDTO.setAccount(account);
//		queryDTO.setPhone(phone);
//		queryDTO.setStatus(sta);
//		queryDTO.setVipLevel(vipLevel);
		
		List<ShopProduct> userList = this.tradeService.queryShopProductList(queryDTO);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, String> headNameMap = new LinkedHashMap<String, String>();
		headNameMap.put("account", "账户名");
		headNameMap.put("phone", "手机号");
		headNameMap.put("refPhone", "推荐人手机号");
		headNameMap.put("vipLevel", "会员等级");
		headNameMap.put("status", "是否有效");
		headNameMap.put("credits", "账户余额");
		headNameMap.put("activeBill", "健康值激活个数");
		headNameMap.put("tradeBill", "转让获得的健康值");
		headNameMap.put("balance", "账户积分");
		headNameMap.put("createDate", "创建时间");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(userList != null && userList.size() > 0){/*
			for(ShopProduct user : userList){
				String statusName = "有效";
				String createDate = "";
				if(user.getStatus()==2){
					statusName = "无效";
				}
				
				if(user.getCreateDate() != null){
					createDate = sdf.format(user.getCreateDate());
				}
				
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("account", user.getAccount());
				map.put("phone", user.getPhone());
				map.put("refPhone", user.getRefPhone());
				map.put("vipLevel", VipLevelEnum.getDescByCode(user.getVipLevel()));
				map.put("status", statusName);
				map.put("credits", user.getShopTradeExts().getCredits());
				map.put("activeBill", user.getShopTradeExts().getActiveBill());
				map.put("tradeBill", user.getShopTradeExts().getTradeBill());
				map.put("balance", user.getShopTradeExts().getBalance());
				map.put("createDate", createDate);
				list.add(map);
			}
		*/}
		
		ExcelUtils.exportXlsx(response, "注册用户数据", headNameMap, list);
		return null;
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
			ShopProduct bean = tradeService.find(Integer.parseInt(id));
			model.addAttribute("bean", bean);
		}
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_PRODUCT_LIST);
		return "shop/product_edit";
	}
	
	/**
	 * 用户保存操作
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public AjaxResult ajaxSave(HttpServletRequest request ,ShopProduct user){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			if(user.getId()!=null && user.getId()!=0){
				tradeService.update(user);
			}else{
				user.setCreateDate(new Date() );
				tradeService.save(user);
			}
			ajaxResult.setSuccess(true);
			
		} catch (Exception e) {
			ajaxResult.setMsg(e.getMessage());
			e.printStackTrace();
		}
		
		return ajaxResult;
	}
	
	
	/**
	 * 修改用户状态
	 * @param request
	 * @return
	 */
	@RequestMapping("/upd/status")
	@ResponseBody
	public AjaxResult ajaxUpdStatus(HttpServletRequest request){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			String id = request.getParameter("id");
			String status = request.getParameter("status");
			
			tradeService.updateStatus(id, status);
			
			ajaxResult.setSuccess(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setMsg(e.getMessage());;
		}
		
		return ajaxResult;
	}
	

	
}
