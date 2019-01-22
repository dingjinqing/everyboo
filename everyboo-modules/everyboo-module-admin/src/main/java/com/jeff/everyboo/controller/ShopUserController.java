package com.jeff.everyboo.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import com.jeff.everyboo.cms.entity.ShopTrade;
import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.cms.entity.ShopUserExt;
import com.jeff.everyboo.cms.service.ShopSysParamService;
import com.jeff.everyboo.cms.service.ShopTradeService;
import com.jeff.everyboo.cms.service.ShopUserExtService;
import com.jeff.everyboo.cms.service.ShopUserService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.common.util.CommonConstants;
import com.jeff.everyboo.common.util.ExcelUtils;
import com.jeff.everyboo.common.util.Md5Util;
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
@RequestMapping("/shopuser")
public class ShopUserController {

	@Autowired
	private ShopUserExtService userExtService;
	@Autowired
	private ShopUserService userService;
	@Autowired
	private ShopTradeService tradeService;
	@Autowired
	private ShopSysParamService sysparamService;
	
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
		String level = request.getParameter("level");
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
		userQueryDTO.setLevel(level);

		PageModel<ShopUser> page = userService.queryShopUserPage(userQueryDTO);
		model.addAttribute("page", page);
		model.addAttribute("userQueryDTO", userQueryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_USER_LIST);

		return "shop/user_list";
	}
	/**
	 * 分红
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("/fenhong")
	public String fenhong(HttpServletRequest request) throws ParseException {
//		AjaxResult ajaxResult = new AjaxResult();
//		ajaxResult.setSuccess(false);
		
		String account = request.getParameter("account");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		String vipLevel = request.getParameter("vipLevel");
		String level = request.getParameter("level");
		
		String shouyi = request.getParameter("shouyi");
		String createDate = request.getParameter("createDate");
		String fenhongtype = request.getParameter("fenhongtype");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date cdDate = StringUtils.isEmpty(createDate)?new Date():simpleDateFormat.parse(createDate);
		int sta = 0;
		if (StringUtils.isNotBlank(status)) {
			sta = Integer.parseInt(status);
		}
		
		ShopUserQueryDTO userQueryDTO = new ShopUserQueryDTO();
		userQueryDTO.setAccount(account);
		userQueryDTO.setPhone(phone);
		userQueryDTO.setStatus(sta);
		userQueryDTO.setVipLevel(vipLevel);
		userQueryDTO.setLevel(level);

		List<ShopUser> list = userService.queryShopUserList(userQueryDTO);
		List<ShopTrade> trades = new ArrayList<>();
		
		// 获取不同等级分红奖励上限
		Map<String, String> rule = sysparamService.findByType(CommonConstants.SYS_AWARDS_LIMIT);
//				获取目前分红金额
		Map<String, String> tuijian = tradeService.queryFenhongList();
		Map<String, String> gongxiang = tradeService.queryGongxiangList();
		if (list!=null && list.size()>0) {
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
//				如果没超过收益上限，则增加收益，并插入收益明细表，收益上限暂时不处理
				
				ShopUser shopUser = (ShopUser) iterator.next();
				
//				如果未超出上限，继续分红，否则不分红
				BigDecimal ztshangxian = new BigDecimal(rule.get(shopUser.getLevel()).toString());
				BigDecimal zttuijian = new BigDecimal(tuijian.get(shopUser.getId().toString())==null?"0":tuijian.get(shopUser.getId().toString()));
				BigDecimal ztfenhong = new BigDecimal(gongxiang.get(shopUser.getId().toString())==null?"0":gongxiang.get(shopUser.getId().toString()));
				if (ztshangxian.compareTo(zttuijian)>0 && ztshangxian.compareTo(ztfenhong)>0) {
//				增加共享收益
					shopUser.getShopUserExts().setTuiguang(shopUser.getShopUserExts().getTuiguang().add(new BigDecimal(shouyi)));
					
					ShopTrade ztTrade = new ShopTrade();
					ztTrade.setPrice(new BigDecimal(shouyi));
					ztTrade.setUserId(shopUser.getId());
					ztTrade.setTradeNo(WebHelper.getDayNo());
					if ("2".equals(fenhongtype)) { //2 加盟店   1 平台分红
						ztTrade.setJtype(5);
					}else {
						
						ztTrade.setJtype(7);// 1.购买会员大礼包2.复购产品3.直推4.间推5.管理奖6.股份收益7.平台分红8.捐赠9购买返点10直推购买返点11间推购买返点
					}
					ztTrade.setStatus(3);
					ztTrade.setCredits(0);
					ztTrade.setDuihuan(BigDecimal.ZERO);
					ztTrade.setCreateDate(cdDate);
					ztTrade.setUpdateDate(new Date());
					ztTrade.setShopTradeDetails(null);
					trades.add(ztTrade);
				}else {
					System.out.println(shopUser.getId()+"超出上限，不进行分红");
				}
				
			}
		}
		
		userService.save(list);
		tradeService.save(trades);
//		ajaxResult.setSuccess(true);
		return "redirect:list";
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
		String level = request.getParameter("level");
		int sta = 0;
		if (StringUtils.isNotBlank(status)) {
			sta = Integer.parseInt(status);
		}

		ShopUserQueryDTO userQueryDTO = new ShopUserQueryDTO();
		userQueryDTO.setAccount(account);
		userQueryDTO.setPhone(phone);
		userQueryDTO.setStatus(sta);
		userQueryDTO.setVipLevel(vipLevel);
		userQueryDTO.setLevel(level);

		List<ShopUser> userList = this.userService.queryShopUserList(userQueryDTO);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, String> headNameMap = new LinkedHashMap<String, String>();
		headNameMap.put("account", "账户名");
		headNameMap.put("phone", "手机号");
		headNameMap.put("refPhone", "推荐人手机号");
		headNameMap.put("level", "会员等级");
		headNameMap.put("vipLevel", "加盟店等级");
		headNameMap.put("status", "账号状态");
		headNameMap.put("vipStatus", "会员状态");
		headNameMap.put("balance", "健康余额");
		headNameMap.put("tuiguang", "共享收益");
		headNameMap.put("xiaoshou", "销售收益");
		headNameMap.put("duihuan", "兑换积分");
		headNameMap.put("credits", "消费积分");
		headNameMap.put("createDate", "创建时间");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (userList != null && userList.size() > 0) {
			for (ShopUser user : userList) {
				String statusName = "有效";
				String vstatusName = "参与分红";
				String levelName = "黄金会员";
				String createDate = "";
				if (user.getStatus() == 2) {
					statusName = "无效";
				}
				if (user.getVipStatus() == 2) {
					vstatusName = "不参与";
				}
				
				if (user.getLevel().equals("t2")) {
					levelName = "铂金会员";
				}else if (user.getLevel().equals("t3")) {
					levelName = "钻石会员";
				}

				if (user.getCreateDate() != null) {
					createDate = sdf.format(user.getCreateDate());
				}

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("account", user.getAccount());
				map.put("phone", user.getPhone());
				map.put("refPhone", user.getRefPhone());
				map.put("level", levelName);
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
			List<Map<String, Object>> list = userService.queryUser4List(bean.getPhone());
			List<Map<String, Object>> list2 = userService.queryUser5List(bean.getPhone());
			String xiaofei1 = tradeService.queryGerenXiaofei(bean.getId());
			String xiaofei2 = tradeService.queryZhituiXiaofei(bean.getPhone());
			String xiaofei3 = tradeService.queryJiantuiXiaofei(bean.getPhone());
			
			model.addAttribute("bean", bean);
			model.addAttribute("zhitui", list);//直推信息
			model.addAttribute("jiantui", list2);//间推信息
			model.addAttribute("xiaofei1", xiaofei1);//个人消费
			model.addAttribute("xiaofei2", xiaofei2);//直推消费
			model.addAttribute("xiaofei3", xiaofei3);//间推消费
			
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
