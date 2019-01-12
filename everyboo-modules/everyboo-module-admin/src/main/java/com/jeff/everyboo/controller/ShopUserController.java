package com.jeff.everyboo.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.jeff.everyboo.cms.dto.ShopUserQueryDTO;
import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.cms.entity.ShopUserExt;
import com.jeff.everyboo.cms.service.ShopUserExtService;
import com.jeff.everyboo.cms.service.ShopUserService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.common.util.ExcelUtils;
import com.jeff.everyboo.common.util.Md5Util;
import com.jeff.everyboo.common.util.TradeTypeEnum;
import com.jeff.everyboo.util.Constants;

/**
 * 用户管理Controller
 * 
 * @author dingjinqing@163.com
 *
 */
@Controller
@RequestMapping("/shopuser")
public class ShopUserController {

	@Autowired
	private ShopUserExtService userExtService;

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
		String account = request.getParameter("account");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		String vipLevel = request.getParameter("vipLevel");
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");

		int currentPage = 1;
		int pageSize = 10;
		int sta = 0;
		if (StringUtils.isNotBlank(currentPageStr)) {
			currentPage = Integer.parseInt(currentPageStr);
		}
		if (StringUtils.isNotBlank(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		if (StringUtils.isNotBlank(status)) {
			sta = Integer.parseInt(status);
		}

		ShopUserQueryDTO userQueryDTO = new ShopUserQueryDTO();
		userQueryDTO.setAccount(account);
		userQueryDTO.setPhone(phone);
		userQueryDTO.setStatus(sta);
		userQueryDTO.setVipLevel(vipLevel);
		userQueryDTO.setCurrentPage(currentPage);
		userQueryDTO.setPageSize(pageSize);

		PageModel<ShopUser> page = userService.queryShopUserPage(userQueryDTO);
		model.addAttribute("page", page);
		model.addAttribute("userQueryDTO", userQueryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_USER_LIST);

		return "shop/user_list";
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
		String account = request.getParameter("account");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		String vipLevel = request.getParameter("vipLevel");
		int sta = 0;
		if (StringUtils.isNotBlank(status)) {
			sta = Integer.parseInt(status);
		}

		ShopUserQueryDTO userQueryDTO = new ShopUserQueryDTO();
		userQueryDTO.setAccount(account);
		userQueryDTO.setPhone(phone);
		userQueryDTO.setStatus(sta);
		userQueryDTO.setVipLevel(vipLevel);

		List<ShopUser> userList = this.userService.queryShopUserList(userQueryDTO);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, String> headNameMap = new LinkedHashMap<String, String>();
		headNameMap.put("account", "账户名");
		headNameMap.put("phone", "手机号");
		headNameMap.put("refPhone", "推荐人手机号");
		headNameMap.put("vipLevel", "会员等级");
		headNameMap.put("status", "账号状态");
		headNameMap.put("vipStatus", "会员状态");
		headNameMap.put("balance", "健康余额");
		headNameMap.put("tuiguang", "共享积分");
		headNameMap.put("xiaoshou", "销售积分");
		headNameMap.put("duihuan", "兑换积分");
		headNameMap.put("credits", "消费积分");
		headNameMap.put("createDate", "创建时间");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (userList != null && userList.size() > 0) {
			for (ShopUser user : userList) {
				String statusName = "有效";
				String vstatusName = "参与分红";
				String createDate = "";
				if (user.getStatus() == 2) {
					statusName = "无效";
				}
				if (user.getVipStatus() == 2) {
					vstatusName = "不参与";
				}

				if (user.getCreateDate() != null) {
					createDate = sdf.format(user.getCreateDate());
				}

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("account", user.getAccount());
				map.put("phone", user.getPhone());
				map.put("refPhone", user.getRefPhone());
				map.put("vipLevel", com.jeff.everyboo.common.util.VipLevelEnum.getDescByCode(user.getVipLevel()));
				map.put("status", statusName);
				map.put("vipStatus", vstatusName);
				map.put("balance", user.getShopUserExts().getBalance());
				map.put("tuiguang", user.getShopUserExts().getTuiguang());
				map.put("xiaoshou", user.getShopUserExts().getXiaoshou());
				map.put("duihuan", user.getShopUserExts().getDuihuan());
				map.put("credits", user.getShopUserExts().getCredits());
				map.put("createDate", createDate);
				list.add(map);
			}
		}

		ExcelUtils.exportXlsx(response, "注册用户数据", headNameMap, list);
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
			ShopUser bean = userService.find(Integer.parseInt(id));
//			List<Map<String, Object>> list = userService.queryUser2List(bean.getPhone());
//			List<Map<String, Object>> list2 = userService.queryUser3List(bean.getPhone());
			model.addAttribute("bean", bean);
//			model.addAttribute("zhitui", list);//直推信息
//			model.addAttribute("jiantui", list2);//间推信息

		}
		return "shop/dialog/user_edit";
	}
	
	@RequestMapping("/total")
	public String pageShow(HttpServletRequest request, Model model,ShopUserQueryDTO shopUserQueryDTO) {
		
		List<Map<String, Object>> list = userService.queryIncomeList(shopUserQueryDTO);
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object>  map = list.get(i);
			String type =  map.get("type").toString();
			String typeName = TradeTypeEnum.getDescByCode(Integer.parseInt(type));
			map.put("typeName", typeName);
//			map.put
		}
		model.addAttribute("list", list);
		model.addAttribute("queryDTO", shopUserQueryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_FINANCE_TOTAL);

		return "shop/total_list";
	}
	
	@RequestMapping("/show")
	public String dialogSjow(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			ShopUser bean = userService.find(Integer.parseInt(id));
			List<Map<String, Object>> list = userService.queryUser2List(bean.getPhone());
			List<Map<String, Object>> list2 = userService.queryUser3List(bean.getPhone());
			model.addAttribute("bean", bean);
			model.addAttribute("zhitui", list);//直推信息
			model.addAttribute("jiantui", list2);//间推信息
			
		}
		return "shop/dialog/user_team";
	}

	/**
	 * 用户保存操作
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public AjaxResult ajaxSave(HttpServletRequest request, ShopUser user) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		try {
			if (user.getId() != null && user.getId() != 0) {
				user.setUpdateDate(new Date());
				user.getShopUserExts().setUpdateDate(new Date());
				user.getShopUserExts().setShopUser(user);
				userService.update(user);
			} else {
				user.setCreateDate(new Date());
				user.getShopUserExts().setCreateDate(new Date());
				user.setPassword(Md5Util.generatePassword("666666"));
				ShopUserExt uExt = user.getShopUserExts();
				user.setShopUserExts(null);
				user = userService.save(user);
				uExt.setShopUser(user);
				if (uExt.getActiveBill()==null) {
					uExt.setActiveBill(new BigDecimal(0));
				}
				if (uExt.getBalance()==null) {
					uExt.setBalance(new BigDecimal(0));
				}
				if (uExt.getBill()==null) {
					uExt.setBill(new BigDecimal(0));
				}
				if (uExt.getCredits()==null) {
					uExt.setCredits(new BigDecimal(0));
				}
				if (uExt.getTradeBill()==null) {
					uExt.setTradeBill(new BigDecimal(0));
				}
				if (uExt.getDuihuan()==null) {
					uExt.setDuihuan(new BigDecimal(0));
				}
				if (uExt.getXiaoshou()==null) {
					uExt.setXiaoshou(new BigDecimal(0));
				}
				if (uExt.getTuiguang()==null) {
					uExt.setTuiguang(new BigDecimal(0));
				}
				userExtService.save(uExt);
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

			userService.updateStatus(id, Integer.parseInt(status));

			ajaxResult.setSuccess(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setMsg(e.getMessage());
			;
		}

		return ajaxResult;
	}

	/**
	 * 校验手机号是否存在
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/validator/phone")
	@ResponseBody
	public Map<String, Object> ajaxValidatorPhone(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String phone = request.getParameter("phone");
		ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
		shopUserQueryDTO.setPhone(phone);
		List<ShopUser> users = userService.queryShopUserList(shopUserQueryDTO);
		if (users != null && users.size() > 0) {
			map.put("error", "手机号已经存在");
		} else {
			map.put("ok", "");
		}

		return map;
	}

	/**
	 * 校验是否存在
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/validator/account")
	@ResponseBody
	public Map<String, Object> ajaxValidatorAcount(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String acount = request.getParameter("acount");
		ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
		shopUserQueryDTO.setAccount(acount);
		List<ShopUser> users = userService.queryShopUserList(shopUserQueryDTO);
		if (users != null && users.size() > 0) {
			map.put("error", "账号已经存在");
		} else {
			map.put("ok", "");
		}

		return map;
	}

}
