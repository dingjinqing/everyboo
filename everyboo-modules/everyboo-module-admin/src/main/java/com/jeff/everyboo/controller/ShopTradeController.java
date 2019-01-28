package com.jeff.everyboo.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
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

import com.jeff.everyboo.cms.dto.ShopTradeQueryDTO;
import com.jeff.everyboo.cms.dto.ShopUserQueryDTO;
import com.jeff.everyboo.cms.entity.ShopTrade;
import com.jeff.everyboo.cms.entity.ShopTradeUser;
import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.cms.service.ShopTradeService;
import com.jeff.everyboo.cms.service.ShopUserService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.common.util.ExcelUtils;
import com.jeff.everyboo.common.util.TradeTypeEnum;
import com.jeff.everyboo.util.Constants;
import com.jeff.everyboo.util.WebHelper;

/**
 * 用户管理Controller
 * 
 * @author dingjinqing@163.com
 *
 */
@Controller
@RequestMapping("/shoptrade")
public class ShopTradeController {

	@Autowired
	private ShopTradeService tradeService;
	@Autowired
	private ShopUserService userService;

	/**
	 * 获取用户列表
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		String status = request.getParameter("status");
		String jtype = request.getParameter("jtype");
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");

		int currentPage = 1;
		int pageSize = 10;
		int sta = 0;
		int jty = 0;
		if (StringUtils.isNotBlank(currentPageStr)) {
			currentPage = Integer.parseInt(currentPageStr);
		}
		if (StringUtils.isNotBlank(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		if (StringUtils.isNotBlank(status)) {
			sta = Integer.parseInt(status);
		}
		ShopTradeQueryDTO userQueryDTO = new ShopTradeQueryDTO();
		if (StringUtils.isNotBlank(jtype)) {
			jty = Integer.parseInt(jtype);
		} else {
			Integer[] types = { 1, 2, 13 };
			List<Integer> list = Arrays.asList(types);
			userQueryDTO.setTypes(list);
		}

		userQueryDTO.setStatus(sta);
		userQueryDTO.setJtype(jty);
		userQueryDTO.setCurrentPage(currentPage);
		userQueryDTO.setPageSize(pageSize);

		PageModel<ShopTradeUser> page = tradeService.queryShopTradeUserPage(userQueryDTO);
		// PageModel<ShopTrade> page = tradeService.queryShopTradePage(userQueryDTO);
		model.addAttribute("page", page);
		model.addAttribute("queryDTO", userQueryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_TRADE_LIST);

		return "shop/trade_list";
	}

	@RequestMapping("/listTransfer")
	public String listForTransfer(HttpServletRequest request, Model model) {
		String status = request.getParameter("status");
		String jtype = request.getParameter("jtype");
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");
		
		int currentPage = 1;
		int pageSize = 10;
		int sta = 0;
		int jty = 0;
		if (StringUtils.isNotBlank(currentPageStr)) {
			currentPage = Integer.parseInt(currentPageStr);
		}
		if (StringUtils.isNotBlank(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		if (StringUtils.isNotBlank(status)) {
			sta = Integer.parseInt(status);
		}
		ShopTradeQueryDTO userQueryDTO = new ShopTradeQueryDTO();
		if (StringUtils.isNotBlank(jtype)) {
			jty = Integer.parseInt(jtype);
		} else {
			// 1.购买会员大礼包2.复购产品3.直推4.间推5.管理奖6.股份收益7.平台分红8.捐赠9购买返点10直推购买返点11间推购买返点12提现健康值13项目合作14提现余额15充值
			Integer[] types = { 16, 17 };
			List<Integer> list = Arrays.asList(types);
			userQueryDTO.setTypes(list);
		}
		
		userQueryDTO.setStatus(sta);
		userQueryDTO.setJtype(jty);
		userQueryDTO.setCurrentPage(currentPage);
		userQueryDTO.setPageSize(pageSize);
		
		// PageModel<ShopTrade> page = tradeService.queryShopTradePage(userQueryDTO);
		PageModel<ShopTradeUser> page = tradeService.queryShopTradeUserPage(userQueryDTO);
		
		model.addAttribute("page", page);
		model.addAttribute("queryDTO", userQueryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_TRANSFER_LIST);
		
		return "shop/transfer_list";
	}
	@RequestMapping("/listf")
	public String listForFinance(HttpServletRequest request, Model model) {
		String status = request.getParameter("status");
		String jtype = request.getParameter("jtype");
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");

		int currentPage = 1;
		int pageSize = 10;
		int sta = 0;
		int jty = 0;
		if (StringUtils.isNotBlank(currentPageStr)) {
			currentPage = Integer.parseInt(currentPageStr);
		}
		if (StringUtils.isNotBlank(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		if (StringUtils.isNotBlank(status)) {
			sta = Integer.parseInt(status);
		}
		ShopTradeQueryDTO userQueryDTO = new ShopTradeQueryDTO();
		if (StringUtils.isNotBlank(jtype)) {
			jty = Integer.parseInt(jtype);
		} else {
			// 1.购买会员大礼包2.复购产品3.直推4.间推5.管理奖6.股份收益7.平台分红8.捐赠9购买返点10直推购买返点11间推购买返点12提现健康值13项目合作14提现余额15充值
			Integer[] types = { 14, 15 };
			List<Integer> list = Arrays.asList(types);
			userQueryDTO.setTypes(list);
		}

		userQueryDTO.setStatus(sta);
		userQueryDTO.setJtype(jty);
		userQueryDTO.setCurrentPage(currentPage);
		userQueryDTO.setPageSize(pageSize);

		// PageModel<ShopTrade> page = tradeService.queryShopTradePage(userQueryDTO);
		PageModel<ShopTradeUser> page = tradeService.queryShopTradeUserPage(userQueryDTO);

		model.addAttribute("page", page);
		model.addAttribute("queryDTO", userQueryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_FINANCE_LIST);

		return "shop/finance_list";
	}
	
	@RequestMapping("/listo")
	public String listShopOut(HttpServletRequest request, Model model) {
		String status = request.getParameter("status");
		String jtype = request.getParameter("jtype");
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");
		
		int currentPage = 1;
		int pageSize = 10;
		int sta = 0;
		int jty = 0;
		if (StringUtils.isNotBlank(currentPageStr)) {
			currentPage = Integer.parseInt(currentPageStr);
		}
		if (StringUtils.isNotBlank(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		if (StringUtils.isNotBlank(status)) {
			sta = Integer.parseInt(status);
		}
		ShopTradeQueryDTO userQueryDTO = new ShopTradeQueryDTO();
		if (StringUtils.isNotBlank(jtype)) {
			jty = Integer.parseInt(jtype);
		} else {
			// 1.购买会员大礼包2.复购产品3.直推4.间推5.管理奖6.股份收益7.平台分红8.捐赠9购买返点10直推购买返点11间推购买返点12提现健康值13项目合作14提现余额15充值
			Integer[] types = { 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
			List<Integer> list = Arrays.asList(types);
			userQueryDTO.setTypes(list);
		}
		
		userQueryDTO.setStatus(sta);
		userQueryDTO.setJtype(jty);
		userQueryDTO.setCurrentPage(currentPage);
		userQueryDTO.setPageSize(pageSize);
		
		// PageModel<ShopTrade> page = tradeService.queryShopTradePage(userQueryDTO);
		PageModel<ShopTradeUser> page = tradeService.queryShopTradeUserPage(userQueryDTO);
		
		model.addAttribute("page", page);
		model.addAttribute("queryDTO", userQueryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_OUT_LIST);
		
		return "shop/out_list";
	}

	/**
	 * 导出用户数据
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/export")
	public String exportOrder(HttpServletRequest request, HttpServletResponse response) {
		String status = request.getParameter("status");
		String jtype = request.getParameter("jtype");
		String from = request.getParameter("from");
		int sta = 0;
		int jty = 0;
		if (StringUtils.isNotBlank(status)) {
			sta = Integer.parseInt(status);
		}
		ShopTradeQueryDTO userQueryDTO = new ShopTradeQueryDTO();
		if (StringUtils.isNotBlank(jtype)) {
			jty = Integer.parseInt(jtype);
		} else {
			if (from.equals("1")) {
				Integer[] types = { 1, 2, 13 };
				List<Integer> list = Arrays.asList(types);
				userQueryDTO.setTypes(list);
			} else if (from.equals("2")) {
				Integer[] types = { 14, 15 };
				List<Integer> list = Arrays.asList(types);
				userQueryDTO.setTypes(list);
			}else if(from.equals("3")){
				Integer[] types = { 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
				List<Integer> list = Arrays.asList(types);
				userQueryDTO.setTypes(list);
				
			}

		}

		userQueryDTO.setStatus(sta);
		userQueryDTO.setJtype(jty);

		List<ShopTradeUser> List = this.tradeService.queryShopTradeUserList(userQueryDTO);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, String> headNameMap = new LinkedHashMap<String, String>();
		headNameMap.put("tradeNo", "订单编号");
		headNameMap.put("price", "金额");
		headNameMap.put("account", "客户姓名");
		headNameMap.put("phone", "联系方式");
		if (from.equals("2")) {
			headNameMap.put("bankOwer", "卡主姓名");
			headNameMap.put("bankCard", "银行卡号");
		}
		headNameMap.put("jtype", "类型");
		headNameMap.put("status", "订单状态");
		headNameMap.put("createDate", "创建时间");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (List != null && List.size() > 0) {

			for (ShopTradeUser bean : List) {
				String createDate = "";
				String statusName = "";
				if (bean.getStatus() == 1) {
					statusName = "待审核";
				}else if(bean.getStatus() == 2) {
					statusName = "审核通过";
				}else if(bean.getStatus() == 3) {
					statusName = "已完成";
				}

				if (bean.getCreateDate() != null) {
					createDate = sdf.format(bean.getCreateDate());
				}

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("tradeNo", bean.getTradeNo());
				map.put("price", bean.getPrice());
				map.put("account", bean.getAccount());
				map.put("phone", bean.getPhone());
				if (from.equals("2")) {
					map.put("bankOwer",bean.getBankOwer());
					map.put("bankCard", bean.getBankCard());
				}
				map.put("jtype", TradeTypeEnum.getDescByCode(bean.getJtype()));
				map.put("status", statusName);
				map.put("createDate", createDate);
				list.add(map);
			}
		}

		ExcelUtils.exportXlsx(response, "财务管理数据", headNameMap, list);
		return null;
	}

	/**
	 * 跳转到用户编辑页
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/edit")
	public String dialogEdit(HttpServletRequest request, Model model) {

		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			ShopTrade bean = tradeService.find(Integer.parseInt(id));
			ShopUser user = userService.find(bean.getUserId());
			model.addAttribute("bean", bean);
			model.addAttribute("user", user);

		}
		return "shop/dialog/trade_edit";
	}
	
	@RequestMapping("/editTran")
	public String dialogEditTran(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			ShopTrade bean = tradeService.find(Integer.parseInt(id));
			ShopUser user = userService.find(bean.getUserId());
			model.addAttribute("bean", bean);
			model.addAttribute("user", user);
			
		}
		return "shop/dialog/transfer_edit";
	}
	@RequestMapping("/editf")
	public String dialogEditf(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			ShopTrade bean = tradeService.find(Integer.parseInt(id));
			ShopUser user = userService.find(bean.getUserId());
			model.addAttribute("bean", bean);
			model.addAttribute("user", user);
			
		}
		return "shop/dialog/finance_edit";
	}
	
	@RequestMapping("/edito")
	public String dialogEdito(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			ShopTrade bean = tradeService.find(Integer.parseInt(id));
			ShopUser user = userService.find(bean.getUserId());
			
			model.addAttribute("bean", bean);
			model.addAttribute("user", user);
			
		}else {
			ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
			List<ShopUser> list = userService.queryShopUserList(shopUserQueryDTO );
			model.addAttribute("roles", list);
			model.addAttribute("bianhao", WebHelper.getDayNo());
			
		}
		return "shop/dialog/out_edit";
	}

	/**
	 * 用户保存操作
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public AjaxResult ajaxSave(HttpServletRequest request, ShopTrade bean) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		try {
			if (bean.getId() != null && bean.getId() != 0) {
				bean.setUpdateDate(new Date());
				tradeService.update(bean);
			} else {
				bean.setCreateDate(new Date());
				bean.setUpdateDate(new Date());
//				bean.setTradeNo(WebHelper.getDayNo());
				tradeService.save(bean);
			}
			ajaxResult.setSuccess(true);

		} catch (Exception e) {
			ajaxResult.setMsg(e.getMessage());
			e.printStackTrace();
		}

		return ajaxResult;
	}

	/**
	 * 修改订单状态
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/upd/status")
	@ResponseBody
	public AjaxResult ajaxUpdStatus(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		try {
			String id = request.getParameter("id");
			String status = request.getParameter("status");

			ShopTrade trade = tradeService.updateStatus(id, Integer.parseInt(status));
//			提现，直接扣去账户余额
			if (trade.getJtype()==14) {
				ShopUser user = userService.find(trade.getUserId());
				// 减去账户余额
				BigDecimal balance = user.getShopUserExts().getBalance().subtract(trade.getPrice().abs());
				user.getShopUserExts().setBalance(balance);
				userService.update(user);
			}
			ajaxResult.setSuccess(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setMsg(e.getMessage());
			;
		}

		return ajaxResult;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResult ajaxDelete(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			String id = request.getParameter("id");
			if (StringUtils.isNoneBlank(id)) {
				tradeService.delete(Integer.parseInt(id));;
			}
			ajaxResult.setSuccess(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setMsg(e.getMessage());
			;
		}
		
		return ajaxResult;
	}

}
