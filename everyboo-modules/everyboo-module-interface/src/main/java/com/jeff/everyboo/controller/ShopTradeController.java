package com.jeff.everyboo.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.jpa.criteria.predicate.NegatedPredicateWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableLoadTimeWeaving;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.jeff.everyboo.cms.dto.ShopProfitQueryDTO;
import com.jeff.everyboo.cms.dto.ShopTradeQueryDTO;
import com.jeff.everyboo.cms.dto.ShopUserQueryDTO;
import com.jeff.everyboo.cms.entity.ShopProduct;
import com.jeff.everyboo.cms.entity.ShopProfit;
import com.jeff.everyboo.cms.entity.ShopRegisterRule;
import com.jeff.everyboo.cms.entity.ShopTrade;
import com.jeff.everyboo.cms.entity.ShopTradeDetail;
import com.jeff.everyboo.cms.entity.ShopTradeDto;
import com.jeff.everyboo.cms.entity.ShopTradeRule;
import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.cms.service.ShopProductService;
import com.jeff.everyboo.cms.service.ShopProfitService;
import com.jeff.everyboo.cms.service.ShopRegisterRuleService;
import com.jeff.everyboo.cms.service.ShopTradeDetailService;
import com.jeff.everyboo.cms.service.ShopTradeRuleService;
import com.jeff.everyboo.cms.service.ShopTradeService;
import com.jeff.everyboo.cms.service.ShopUserService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.common.util.Md5Util;
import com.jeff.everyboo.common.util.VipLevelEnum;
import com.jeff.everyboo.util.WebHelper;

/**
 * 用户管理Controller
 * 
 * @author dingjinqing@163.com
 *
 */
@Controller
@RequestMapping("/api/shoptrade")
// @org.springframework.transaction.annotation.Transactional(value="transactionManager",
// rollbackFor = Exception.class)
public class ShopTradeController {

	@Autowired
	private ShopProductService productService;
	@Autowired
	private ShopTradeService tradeService;
	@Autowired
	private ShopTradeDetailService tradeDetailService;
	@Autowired
	private ShopUserService userService;
	@Autowired
	private ShopRegisterRuleService ruleService;
	@Autowired
	private ShopTradeRuleService tradeRuleService;
	@Autowired
	private ShopProfitService shopProfitService;

	/**
	 * 获取订单列表
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public AjaxResult list(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		String userId = request.getParameter("userId");
		if (StringUtils.isNotEmpty(userId)) {
			String status = request.getParameter("status");
			String jtype = request.getParameter("jtype");
			String currentPageStr = request.getParameter("currentPage");
			String pageSizeStr = request.getParameter("pageSize");

			int currentPage = 1;
			int pageSize = 6;
			int sta = 0;
			int jty = 0, u = 0;
			u = Integer.parseInt(userId);
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
				String[] types = jtype.split(",");
				if (types.length > 1) {
					List<Integer> list = new ArrayList<>();
					for (String strtype : types) {
						list.add(Integer.parseInt(strtype));
					}
					userQueryDTO.setTypes(list);
				} else {
					jty = Integer.parseInt(jtype);
					userQueryDTO.setJtype(jty);
				}

			}

			userQueryDTO.setStatus(sta);
			userQueryDTO.setUserId(u);

			userQueryDTO.setCurrentPage(currentPage);
			userQueryDTO.setPageSize(pageSize);
			userQueryDTO.setIsFront(true);
			PageModel<ShopTrade> page = tradeService.queryShopTradePage(userQueryDTO);
			ajaxResult.setData(page);
			ajaxResult.setSuccess(true);
		}

		return ajaxResult;
	}

	@RequestMapping("/getDetail")
	@ResponseBody
	public AjaxResult getDetail(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			ShopTrade bean = tradeService.find(Integer.parseInt(id));
			ajaxResult.setData(bean);
			ajaxResult.setSuccess(true);
		}
		return ajaxResult;
	}

	/**
	 * 保存订单操作 扣去余额 并增加积分
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public AjaxResult ajaxSave(HttpServletRequest request, @RequestBody ShopTradeDto bean) throws Exception {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		ShopUser user = WebHelper.getUser(request);
		user = userService.find(user.getId());

		String payPwd = request.getParameter("payPwd");
		if (StringUtils.isNotEmpty(user.getJiaoyimima())) {
			if (!Md5Util.generatePassword(bean.getPayPwd().trim()).equals(user.getJiaoyimima())) {
				ajaxResult.setMsg("交易密码错误");
				return ajaxResult;
			}
		} else {
			ajaxResult.setMsg("请先设置交易密码");
			return ajaxResult;
		}
		// 减去余额(未开启事物 可能存在不一致)
		BigDecimal balance = user.getShopUserExts().getBalance().subtract(bean.getPrice().abs());
		if (balance.compareTo(BigDecimal.ZERO) >= 0 || bean.getJtype() == 15) {
			bean.setTradeNo(WebHelper.getDayNo());
			bean.setCreateDate(new Date());
			/*
			 * 购买商品走审核流程 1.购买会员大礼包2.复购产品 13项目合作14提现余额15充值
			 * （3-12后台生成）3.直推4.间推5.管理奖6.股份收益7.平台分红8.捐赠9购买返点10直推购买返点11间推购买返点12提现健康值
			 */
			if (bean.getJtype() == 1 || bean.getJtype() == 2 || bean.getJtype() == 13 || bean.getJtype() == 14
					|| bean.getJtype() == 15) {
				bean.setStatus(1);
			} else {
				bean.setStatus(3);
			}

			// 账户积分-订单积分+购买商品赠送积分
			BigDecimal credits = user.getShopUserExts().getCredits();
			BigDecimal credits2 = new BigDecimal(bean.getCredits()).abs();
			if (credits.compareTo(credits2) < 0) {
				ajaxResult.setSuccess(false);
				ajaxResult.setMsg("消费积分不足");
				return ajaxResult;
			}
			BigDecimal duihuan1 = user.getShopUserExts().getDuihuan();
			BigDecimal duihuan2 = bean.getDuihuan()==null?BigDecimal.ZERO:bean.getDuihuan().abs();
			if (duihuan1.compareTo(duihuan2) < 0) {
				ajaxResult.setSuccess(false);
				ajaxResult.setMsg("兑换积分不足");
				return ajaxResult;
			}

			ShopTrade trade = new ShopTrade();
			trade.setCredits(bean.getCredits());
			trade.setJtype(bean.getJtype());
			trade.setUserId(bean.getUserId());
			trade.setTradeNo(bean.getTradeNo());
			trade.setShopTradeDetails(bean.getShopTradeDetails());
			trade.setStatus(bean.getStatus());
			trade.setPrice(bean.getPrice());
			trade.setCreateDate(bean.getCreateDate());
			trade.setDuihuan(bean.getDuihuan());
			trade.setId(bean.getId());
			trade.setRemark(bean.getRemark());
			trade.setUpdateDate(new Date());
			Set<ShopTradeDetail> shopTradeDetails = bean.getShopTradeDetails();
			Iterator<ShopTradeDetail> it = shopTradeDetails.iterator();
			while (it.hasNext()) {
				ShopTradeDetail detail = it.next();
				if (detail.getProId() == 0) {
					ajaxResult.setSuccess(false);
					System.out.println("保存订单失败，商品id不能为空");
					ajaxResult.setMsg("商品id不能为空");
					return ajaxResult;
				}
			}

			// 下单
			trade = tradeService.save(trade);
			// 充值提现余额变化后台手动进行
			if (bean.getJtype() != 14 && bean.getJtype() != 15) {
				// 减去账户余额
				user.getShopUserExts().setBalance(balance);
			}

			// 获取商品列表的赠送积分，并添加到用户
			Set<ShopTradeDetail> shopTradeDetail = bean.getShopTradeDetails();
			Iterator<ShopTradeDetail> its = shopTradeDetail.iterator();
			while (its.hasNext()) {
				ShopTradeDetail detail = its.next();
				// 保存订单明细
				detail.setShopTrade(trade);
				tradeDetailService.save(detail);
				// 修改库存
				ShopProduct product = productService.find(detail.getProId());
				product.setProCount(String.valueOf(Integer.parseInt(product.getProCount()) - detail.getCount()));
				credits.add(new BigDecimal(product.getIncomeCredits()));
				productService.save(product);
			}
			// 账户积分-订单积分+购买商品赠送积分
			user.getShopUserExts().setCredits(credits.subtract(credits2));
			user.getShopUserExts().setDuihuan(duihuan1.subtract(duihuan2));
			userService.update(user);
//			下单直接调用返利逻辑
			fangli(user,trade);
			
			ajaxResult.setSuccess(true);
		} else {
			ajaxResult.setSuccess(false);
			ajaxResult.setMsg("余额不足");
		}

		return ajaxResult;
	}

	@RequestMapping("/upd/status")
	@ResponseBody
	public AjaxResult ajaxUpdStatus(HttpServletRequest request) throws Exception {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		String id = request.getParameter("id");
		// String status = request.getParameter("status");

		
		// 用户升级vip逻辑
		ShopUser user = WebHelper.getUser(request);
		user = userService.find(user.getId());

		// 交易密码校验
		String payPwd = request.getParameter("payPwd");
		if (StringUtils.isNotEmpty(user.getJiaoyimima())) {
			if (StringUtils.isEmpty(payPwd)) {
				ajaxResult.setMsg("交易密码不能为空");
				return ajaxResult;
			}
			if (!Md5Util.generatePassword(payPwd.trim()).equals(user.getJiaoyimima())) {
				ajaxResult.setMsg("交易密码错误");
				return ajaxResult;
			}
		} else {
			ajaxResult.setMsg("请先设置交易密码");
			return ajaxResult;
		}
//		确认收货状态修改
		ShopTrade shopTrade = tradeService.updateStatus(id, 3);
		System.out.println("确认收货会员用户信息：" + user.getId());

		ajaxResult.setSuccess(true);

		return ajaxResult;
	}

	public void fangli(ShopUser user,ShopTrade shopTrade) {
		// 直推间推返利开始

		// 如果介绍人电话不为空，介绍人获得直推收益
		if (StringUtils.isNotEmpty(user.getRefPhone())) {
			ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
			shopUserQueryDTO.setPhone(user.getRefPhone());
			ShopUser ztUser = userService.queryShopUserList(shopUserQueryDTO).get(0);

			// 如果根据介绍人电话查找的用户不存在，则不赠送
			if (ztUser != null) {
				// rule = tradeRuleService.queryShopTradeRule(proId, ztUser.getVipLevel());
				// 邀请用户复购的直推返点 给用户本身账户余额增加
				// 如果第一次购买
				if (user.getVipLevel().equals("v0")) {
					BigDecimal toprice = shopTrade.getPrice().add(shopTrade.getDuihuan()).add(new BigDecimal(shopTrade.getCredits()));
					BigDecimal a1 = user.getShopUserExts().getDuihuan().add(toprice.abs());
					this.saveTrade(shopTrade.getPrice().abs(), ztUser, 3);
					userService.update(ztUser);
				} else {
					BigDecimal a2 = new BigDecimal(0.2).multiply(shopTrade.getPrice().add(new BigDecimal(shopTrade.getCredits())).abs());
					this.saveTradeInfo(a2, ztUser, 10);
				}

				// 如果介绍人电话不为空，介绍人获得间推收益
				if (StringUtils.isNotEmpty(ztUser.getRefPhone())) {
					ShopUserQueryDTO shopQueryDTO = new ShopUserQueryDTO();
					shopQueryDTO.setPhone(ztUser.getRefPhone());
					ShopUser jtUser = userService.queryShopUserList(shopQueryDTO).get(0);
					// 如果根据介绍人电话查找的用户不存在，则不赠送
					if (jtUser != null) {
						// 邀请用户复购的直推返点 给用户本身账户余额增加
						// rule = tradeRuleService.queryShopTradeRule(proId, jtUser.getVipLevel());
						BigDecimal a3 = new BigDecimal(0.1).multiply(shopTrade.getPrice().add(new BigDecimal(shopTrade.getCredits())).abs());
						this.saveTradeInfo(a3, jtUser, 11);
					}
				}
			}
		}

		// 如果第一次购买,本人增加购买金额对应的兑换积分
		if (user.getVipLevel().equals("v0")) {
			// 赠送积分：第一次购买就赠送等值积分，假如我是你上家，那丁清第一次购买时，你获得300分我获得300，丁清第二次~N次购买我不获得任何积分。
			user.setVipLevel("v1");
			BigDecimal toprice = shopTrade.getPrice().add(shopTrade.getDuihuan()).add(new BigDecimal(shopTrade.getCredits()));
			BigDecimal a1 = user.getShopUserExts().getDuihuan().add(toprice.abs());
			user.getShopUserExts().setDuihuan(a1);
			this.saveTrade(shopTrade.getPrice().abs(), user, 9);
			userService.update(user);
		}

		// 返利结束
	}

	public void saveTradeInfo(BigDecimal ba, ShopUser user, int type) {
		// 邀请用户复购的直推返点 给用户本身账户余额增加
		if (ba.compareTo(BigDecimal.ZERO) > 0) {
			this.saveTrade(ba, user, type);
			// 直推间推的钱先到销售积分，等客户点击转换的时候，在百分之八十到余额，百分之二十到消费积分
			user.getShopUserExts()
					.setXiaoshou(user.getShopUserExts().getXiaoshou().add(ba));
//			user.getShopUserExts()
//					.setCredits(user.getShopUserExts().getCredits().add(ba.multiply(new BigDecimal(0.2))));
			userService.update(user);
		}

	}

	public void saveTrade(BigDecimal ba, ShopUser user, int type) {
		ShopTrade ztTrade = new ShopTrade();
		ztTrade.setPrice(ba);
		ztTrade.setUserId(user.getId());
		ztTrade.setTradeNo(WebHelper.getDayNo());
		ztTrade.setJtype(type);// 1.购买会员大礼包2.复购产品3.直推4.间推5.管理奖6.股份收益7.平台分红8.捐赠9购买返点10直推购买返点11间推购买返点
		ztTrade.setStatus(3);
		ztTrade.setCredits(0);
		ztTrade.setDuihuan(BigDecimal.ZERO);
		ztTrade.setCreateDate(new Date());
		ztTrade.setUpdateDate(new Date());
		ztTrade.setShopTradeDetails(null);
		tradeService.save(ztTrade);
	}

	/**
	 * 获取购物车
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/listCart")
	@ResponseBody
	public AjaxResult ajaxListCart(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		try {
			// 获取session
			HttpSession session = request.getSession();

			List<ShopTradeDetail> cartlist = (List<ShopTradeDetail>) session.getAttribute("cartlist");
			ajaxResult.setData(cartlist);
			ajaxResult.setSuccess(true);

		} catch (Exception e) {
			ajaxResult.setMsg(e.getMessage());
			e.printStackTrace();
		}

		return ajaxResult;
	}

	@RequestMapping("/addCart")
	@ResponseBody
	public AjaxResult ajaxSaveCart(HttpServletRequest request, ShopTradeDetail bean) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		try {
			// 获取session
			HttpSession session = request.getSession();
			ShopUser user = (ShopUser) session.getAttribute("userInfo");

			ShopProduct product = productService.find(bean.getProId());

			BigDecimal tprice = new BigDecimal(product.getPrice1());
			bean.setPrice(tprice.multiply(new BigDecimal(bean.getCount())));
			bean.setProName(product.getProName());
			bean.setProLogoImg(product.getProLogoImg());
			bean.setDuihuan(new BigDecimal(product.getPrice3()));
			bean.setCredits(product.getConsumeCredits() == null ? 0 : Integer.parseInt(product.getConsumeCredits()));
			// 查询是否添加过购物车（session有没有封装属性）
			List<ShopTradeDetail> cartlist = (List<ShopTradeDetail>) session.getAttribute("cartlist");
			if (cartlist == null) {// 表示没有添加过
				// 把购物车信息添加List
				// 不能超过库存
				if (StringUtils.isNotEmpty(product.getProCount())
						&& Integer.parseInt(product.getProCount()) < bean.getCount()) {
					bean.setCount(Integer.parseInt(product.getProCount()));
				}
				List<ShopTradeDetail> list = new ArrayList<ShopTradeDetail>();
				list.add(bean);
				session.setAttribute("cartlist", list);
			} else {// 如果添加过

				// 第二次及以上添加判断商品是否存在 如果存在数量相加
				boolean bln = false;// 表示不存在
				for (int i = 0; i < cartlist.size(); i++) {
					ShopTradeDetail sc = (ShopTradeDetail) cartlist.get(i);
					if (bean.getProId() == sc.getProId()) {// 如果要添加的 在原来的购物车已经存在
						bln = true;
						sc.setCount(sc.getCount() + bean.getCount());// 得到商品数量加一重新赋给自己
						// 不能超过库存
						if (StringUtils.isNotEmpty(product.getProCount())
								&& Integer.parseInt(product.getProCount()) < sc.getCount()) {
							sc.setCount(Integer.parseInt(product.getProCount()));
						}
						sc.setPrice(tprice.multiply(new BigDecimal(sc.getCount())));
						sc.setCredits(sc.getCount() * (product.getConsumeCredits() == null ? 0
								: Integer.parseInt(product.getConsumeCredits())));
						break;
					}
				}

				if (!bln) {// 不存在 才是添加到购物车
					cartlist.add(bean);
				}

			}
			// ajaxResult.setData(cartlist);
			ajaxResult.setSuccess(true);

		} catch (Exception e) {
			ajaxResult.setMsg(e.getMessage());
			e.printStackTrace();
		}

		return ajaxResult;
	}

	@RequestMapping("/updateCart")
	@ResponseBody
	public AjaxResult ajaxUpdateCart(HttpServletRequest request, ShopTradeDetail bean) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		try {
			// 获取session
			HttpSession session = request.getSession();
			// String proid = request.getParameter("proId");
			// String count = request.getParameter("count");
			if (bean.getCount() != 0 && bean.getProId() != 0) {
				ShopUser user = (ShopUser) session.getAttribute("userInfo");

				ShopProduct product = productService.find(bean.getProId());

				BigDecimal tprice = new BigDecimal(product.getPrice1());
				bean.setPrice(tprice.multiply(new BigDecimal(bean.getCount())));

				List<ShopTradeDetail> cartlist = (List<ShopTradeDetail>) session.getAttribute("cartlist");
				for (int i = 0; i < cartlist.size(); i++) {
					ShopTradeDetail sc = (ShopTradeDetail) cartlist.get(i);
					if (bean.getProId() == sc.getProId()) {// 如果要添加的 在原来的购物车已经存在
						sc.setCount(bean.getCount());
						// 不能超过库存
						if (StringUtils.isNotEmpty(product.getProCount())
								&& Integer.parseInt(product.getProCount()) < sc.getCount()) {
							sc.setCount(Integer.parseInt(product.getProCount()));
						}
						sc.setPrice(tprice.multiply(new BigDecimal(bean.getCount())));
						sc.setCredits(sc.getCount() * (product.getConsumeCredits() == null ? 0
								: Integer.parseInt(product.getConsumeCredits())));
						sc.setDuihuan(new BigDecimal( sc.getCount() * (product.getPrice3() == null ? 0
								: Integer.parseInt(product.getPrice3()))));
						cartlist.set(i, sc);
						break;
					}
				}
				ajaxResult.setSuccess(true);
			}

		} catch (Exception e) {
			ajaxResult.setMsg(e.getMessage());
			e.printStackTrace();
		}
		return ajaxResult;
	}

	/**
	 * 从购物车中根据商品id删除某个商品的接口
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/removeCart")
	@ResponseBody
	public AjaxResult ajaxDeleteCart(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		try {
			// 获取session
			HttpSession session = request.getSession();
			String proid = request.getParameter("proId");

			// 查询是否添加过购物车（session有没有封装属性）
			List<ShopTradeDetail> cartlist = (List<ShopTradeDetail>) session.getAttribute("cartlist");
			for (int i = 0; i < cartlist.size(); i++) {
				ShopTradeDetail sc = (ShopTradeDetail) cartlist.get(i);
				if (Integer.parseInt(proid) == sc.getProId()) {// 如果要添加的 在原来的购物车已经存在
					cartlist.remove(i);
					break;
				}
			}
			ajaxResult.setSuccess(true);

		} catch (Exception e) {
			ajaxResult.setMsg(e.getMessage());
			e.printStackTrace();
		}

		return ajaxResult;
	}

	@RequestMapping("/listProfit")
	@ResponseBody
	public AjaxResult listShopProfit(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");
		String sdateStart = request.getParameter("sdateStart");// string类型日期开始时间，如20181208
		String sdateEnd = request.getParameter("sdateEnd");// string类型日期结束时间，如20181208
		String type = request.getParameter("type");// 1.日利润2月利润
		int currentPage = 1;
		int pageSize = 10;
		byte btype = 0;
		if (StringUtils.isNotBlank(currentPageStr)) {
			currentPage = Integer.parseInt(currentPageStr);
		}
		if (StringUtils.isNotBlank(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		if (StringUtils.isNotBlank(type)) {
			btype = Byte.parseByte(type);
		}
		ShopProfitQueryDTO queryDTO = new ShopProfitQueryDTO();
		queryDTO.setCurrentPage(currentPage);
		queryDTO.setPageSize(pageSize);
		queryDTO.setSdateEnd(sdateEnd);
		queryDTO.setSdateStart(sdateStart);
		queryDTO.setType(btype);
		PageModel<ShopProfit> page = shopProfitService.queryShopProfitPage(queryDTO);
		ajaxResult.setData(page);
		ajaxResult.setSuccess(true);
		return ajaxResult;
	}

}
