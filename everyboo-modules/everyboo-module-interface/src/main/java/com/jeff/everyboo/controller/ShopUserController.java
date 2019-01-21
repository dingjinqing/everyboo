package com.jeff.everyboo.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.jeff.everyboo.cms.dto.ShopUserQueryDTO;
import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.cms.entity.ShopUserExt;
import com.jeff.everyboo.cms.service.ShopUserExtService;
import com.jeff.everyboo.cms.service.ShopUserService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.util.Md5Util;
import com.jeff.everyboo.util.SmsClient;
import com.jeff.everyboo.util.WebHelper;

/**
 * 用户管理Controller
 * 
 * @author dingjinqing@163.com
 *
 */
@Controller
@RequestMapping("/api/shopuser")
public class ShopUserController {

	@Autowired
	private ShopUserExtService userExtService;

	@Autowired
	private ShopUserService userService;

	/**
	 * 19、根据登录的用户编号或手机号获取用户信息的接口，用户信息包括手机号，昵称，等级，团队，收益，权益等信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getDetail")
	@ResponseBody
	public AjaxResult getDetail(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ShopUser user = WebHelper.getUser(request);
		if (user != null) {
			user = userService.find(user.getId());
			ajaxResult.setData(user);
			ajaxResult.setSuccess(true);
		} else {
			String id = request.getParameter("userId");
			if (StringUtils.isNotBlank(id)) {
				ShopUser bean = userService.find(Integer.parseInt(id));
//				bean.setPassword(null);
//				bean.setJiaoyimima(null);
				ajaxResult.setData(bean);
				ajaxResult.setSuccess(true);
				request.getSession().setAttribute("userInfo", bean);
			} else {
				ajaxResult.setSuccess(false);
				ajaxResult.setMsg("请输入用户id");
			}
		}

		return ajaxResult;
	}
	
	
	@RequestMapping("/getTeam")
	@ResponseBody
	public AjaxResult getMyTeam(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		String phone = request.getParameter("phone");
//		ShopUser user = (ShopUser) request.getSession().getAttribute("userInfo");
//		if (user != null) {
		if (StringUtils.isNoneEmpty(phone)) {
			
//			List<Map<String, Object>> list = userService.queryUser2List(user.getPhone());
//			List<Map<String, Object>> list2 = userService.queryUser3List(user.getPhone());
			List<Map<String, Object>> list = userService.queryUser2List(phone);
			List<Map<String, Object>> list2 = userService.queryUser3List(phone);
			
			JSONObject jsonObject  = new JSONObject();
			jsonObject.put("zhitui", list);//直推信息
			jsonObject.put("jiantui", list2);//间推信息
			
			ajaxResult.setData(jsonObject);
			ajaxResult.setSuccess(true);
		} 
		
		return ajaxResult;
	}
	
	/**获取我的收益
	 * @param request
	 * @return
	 */
	@RequestMapping("/getIncome")
	@ResponseBody
	public AjaxResult getMyIncome(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		String userId = request.getParameter("userId");
		if (StringUtils.isNoneEmpty(userId)) {
			//SELECT sum(price) as income,type from shop_trade where user_id=1 GROUP BY type
			/*List<Map<String, Object>> income = (List<Map<String, Object>>) request.getSession().getAttribute("userIncome");
			if (income==null) {
				income = userService.queryIncomeList(userId);
				request.getSession().setAttribute("userIncome", income);
			}*/
			
			List<Map<String, Object>> income = userService.queryIncomeList(userId);

			ajaxResult.setData(income);
			ajaxResult.setSuccess(true);
		} 
		
		return ajaxResult;
	}

	/**
	 * 用户修改操作，个人中心通用
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public AjaxResult ajaxSave(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		String id = request.getParameter("userId");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String refPhone = request.getParameter("refPhone");
		String address = request.getParameter("address");
		String nickName = request.getParameter("nickName");
		String bankOwer = request.getParameter("bankOwer");
		String bankCard = request.getParameter("bankCard");
		String bankDeposit = request.getParameter("bankDeposit");
		try {
			ShopUser user = WebHelper.getUser(request);
			if (user == null) {
				if (StringUtils.isNotBlank(id)) {
					user = userService.find(Integer.parseInt(id));
				} /*else {
					user = new ShopUser();
				}*/
				
			}else {
				user = userService.find(user.getId());
			}
			// 更改值
			if (StringUtils.isNotBlank(account)) {
				user.setAccount(account.trim());
			}
			if (StringUtils.isNotBlank(phone)) {
				user.setPhone(phone.trim());
			}
			if (StringUtils.isNotBlank(refPhone)) {
				user.setRefPhone(refPhone.trim());
			}
			if (StringUtils.isNotBlank(address)) {
				user.setAddress(address);
			}
			if (StringUtils.isNotBlank(password)) {
				user.setPassword(Md5Util.generatePassword(password.trim()));
			}
			if (StringUtils.isNotBlank(nickName)) {
				user.setNickName(nickName);
			}

			if (user.getId() != null && user.getId() != 0) {
				if (StringUtils.isNotBlank(bankOwer)) {
					user.getShopUserExts().setBankOwer(bankOwer);
				}
				if (StringUtils.isNotBlank(bankCard)) {
					user.getShopUserExts().setBankCard(bankCard);
				}
				if (StringUtils.isNotBlank(bankDeposit)) {
					user.getShopUserExts().setBankDeposit(bankDeposit);
				}
				
				user.setUpdateDate(new Date());
				user.getShopUserExts().setUpdateDate(new Date());
				user.getShopUserExts().setShopUser(user);
				userService.update(user);
			} else {/*
				user.setStatus(1);
				user.setCreateDate(new Date());
				
				user.setVipLevel("v1");
				user = userService.save(user);
				
				ShopUserExt shopUserExt  = new ShopUserExt();
				shopUserExt.setActiveBill("0");
				shopUserExt.setBalance(new BigDecimal(0));
				shopUserExt.setBill("0");
				shopUserExt.setCredits("0");
				shopUserExt.setTradeBill("0");
				shopUserExt.setShopUser(user);
				shopUserExt.setCreateDate(new Date());
				userExtService.save(shopUserExt);
			*/}
			ajaxResult.setSuccess(true);

		} catch (Exception e) {
			ajaxResult.setMsg(e.getMessage());
			e.printStackTrace();
		}

		return ajaxResult;
	}

	/**
	 * 保存密码
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/update_pwd")
	@ResponseBody
	public AjaxResult ajaxSavePwd(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		try {

			ShopUser user = WebHelper.getUser(request);
//			ShopUser user ;

			String oldPwd = request.getParameter("oldPwd");
			String userId = request.getParameter("userId");
			String pwd = request.getParameter("pwd");
			if (StringUtils.isNotEmpty(userId)) {
				user = userService.find(Integer.parseInt(userId));
				if (Md5Util.generatePassword(oldPwd).equals(user.getPassword())) {

					user.setPassword(Md5Util.generatePassword(pwd));
					userService.update(user);

					ajaxResult.setSuccess(true);
				} else {
					ajaxResult.setMsg("原始密码输入不正确");
					ajaxResult.setSuccess(false);
				}
			} else {
				ajaxResult.setMsg("id不能为空");
				ajaxResult.setSuccess(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setSuccess(false);
			ajaxResult.setMsg("修改失败");
		}

		return ajaxResult;
	}

	/**
	 * 更改交易密码密码
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/update_jypwd")
	@ResponseBody
	public AjaxResult ajaxUpdatePwd(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		try {

			ShopUser user = WebHelper.getUser(request);
//			ShopUser user ;

			String oldPwd = request.getParameter("oldPwd");
			String userId = request.getParameter("userId");
			String pwd = request.getParameter("pwd");
			if (StringUtils.isNotEmpty(pwd)) {
				if (StringUtils.isNotEmpty(userId)) {
					user = userService.find(Integer.parseInt(userId));
//						非第一次修改交易密码
					if (StringUtils.isNotEmpty(user.getJiaoyimima()) ) {
						if (Md5Util.generatePassword(oldPwd).equals(user.getJiaoyimima())) {

							user.setJiaoyimima(Md5Util.generatePassword(pwd));
							userService.update(user);

							ajaxResult.setSuccess(true);
						} else {
							ajaxResult.setMsg("原始密码输入不正确");
						}
					}else {
						user.setJiaoyimima(Md5Util.generatePassword(pwd));
						userService.update(user);
						ajaxResult.setSuccess(true);

					}
					
				} else {
					ajaxResult.setMsg("id不能为空");
				}
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setSuccess(false);
			ajaxResult.setMsg("修改失败");
		}

		return ajaxResult;
	}

	@RequestMapping("/login")
	@ResponseBody
	public AjaxResult doLogin(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();

		String phone = request.getParameter("phone").trim();
		String pwd = request.getParameter("pwd").trim();

		String md5Pwd = Md5Util.generatePassword(pwd);
		ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
		shopUserQueryDTO.setPassword(md5Pwd);
		shopUserQueryDTO.setPhone(phone);
		shopUserQueryDTO.setStatus(1);//有效才能登陆
		shopUserQueryDTO.setIsFront(true);
		List<ShopUser> list = userService.queryShopUserList(shopUserQueryDTO);
		if (list != null && list.size() > 0) {
			ShopUser user = list.get(0);
//			user.setPassword(null);
//			user.setJiaoyimima(null);
			/*ShopUserExt userExt =new ShopUserExt();
			userExt= userExtService.queryShopUserByUserId(user.getId());
			user.setShopUserExts(userExt);*/
			request.getSession().setAttribute("userInfo", user);
			ajaxResult.setData(user);
			ajaxResult.setSuccess(true);
		} else {
			ajaxResult.setMsg("账户或者密码错误");
			ajaxResult.setSuccess(false);
		}

		return ajaxResult;
	}

	/**
	 * 退出清除Session
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/login_out")
	@ResponseBody
	public AjaxResult loginOut(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();

		request.getSession().setAttribute("userInfo", null);
		ajaxResult.setSuccess(true);
		return ajaxResult;
	}

	/**
	 * 发送短信验证码
	 * 
	 */
	@RequestMapping("/sendSms")
	@ResponseBody
	public AjaxResult sendSms(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);

		String phone = request.getParameter("phone");
		if (!StringUtils.isEmpty(phone)) {
			JSONObject json = null;
			// 生成6位验证码
			String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
			// 发送短信

			SendSmsResponse response;
			try {
				JSONObject jsons = new JSONObject();
				jsons.put("code", verifyCode);
				response = SmsClient.sendSms(phone, jsons.toJSONString(), "SMS_154415357");

				if (response.getCode() != null && response.getCode().equals("OK")) {
					// 请求成功
					ajaxResult.setSuccess(true);
					// 将验证码存到session中,同时存入创建时间
					// 以json存放，这里使用的是阿里的fastjson
					HttpSession session = request.getSession();
					json = new JSONObject();
					json.put("verifyCode", verifyCode);
					json.put("phone", phone);
					json.put("createTime", System.currentTimeMillis());
					// 将认证码存入SESSION
					session.setAttribute("verifyCode", json);
				}
			} catch (ClientException e) {
				// TODO Auto-generated catch block
				ajaxResult.setSuccess(false);
				ajaxResult.setMsg("短信发送失败");
				e.printStackTrace();
			}
		} else {
			ajaxResult.setSuccess(false);
			ajaxResult.setMsg("请输入手机号码");
		}

		return ajaxResult;
	}

	/**
	 * 注册
	 */
	@RequestMapping("/register")
	@ResponseBody
	public AjaxResult register(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		String code = request.getParameter("code");
		String phone = request.getParameter("phone");
		JSONObject json = (JSONObject) request.getSession().getAttribute("verifyCode");
		System.out.println("code:"+code);
		if (json==null || json.isEmpty()) {
			ajaxResult.setSuccess(false);
			ajaxResult.setMsg("验证码不存在");
		}else {
			System.out.println(json.toString());
			if (!json.getString("verifyCode").equals(code)) {
				ajaxResult.setSuccess(false);
				ajaxResult.setMsg("验证码错误");
				return ajaxResult;
			}
			if (!json.getString("phone").equals(phone)) {
				ajaxResult.setSuccess(false);
				ajaxResult.setMsg("手机号不一致");
				return ajaxResult;
			}
			// 时间看客户要求，目前写的五分钟
			if ((System.currentTimeMillis() - json.getLong("createTime")) > 1000 * 60 * 5) {
				ajaxResult.setSuccess(false);
				ajaxResult.setMsg("验证码过期");
				return ajaxResult;
			}
			// 将用户信息存入数据库
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			String refPhone = request.getParameter("refPhone");
			// 保存用户
			ShopUser user = new  ShopUser();
			if (StringUtils.isNotBlank(account)) {
				user.setAccount(account.trim());
			}
			if (StringUtils.isNotBlank(phone)) {
				user.setPhone(phone.trim());
			}
			if (StringUtils.isNotBlank(refPhone)) {
				user.setRefPhone(refPhone.trim());
			}
			if (StringUtils.isNotBlank(password)) {
				user.setPassword(Md5Util.generatePassword(password.trim()));
			}
			user.setStatus(1);
			user.setCreateDate(new Date());
			
			user.setVipLevel("v1");
			user.setLevel("t0");
			user = userService.save(user);
			
			ShopUserExt shopUserExt  = new ShopUserExt();
			shopUserExt.setActiveBill(BigDecimal.ZERO);
			shopUserExt.setBalance(BigDecimal.ZERO);
			shopUserExt.setBill(BigDecimal.ZERO);
			shopUserExt.setCredits(BigDecimal.ZERO);
			shopUserExt.setTradeBill(BigDecimal.ZERO);
			shopUserExt.setTuiguang(BigDecimal.ZERO);
			shopUserExt.setXiaoshou(BigDecimal.ZERO);
			shopUserExt.setDuihuan(BigDecimal.ZERO);
			shopUserExt.setShopUser(user);
			shopUserExt.setCreateDate(new Date());
			userExtService.save(shopUserExt);
		
			
			ajaxResult.setSuccess(true);
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
	public AjaxResult ajaxValidatorPhone(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();

		String phone = request.getParameter("phone");
		ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
		shopUserQueryDTO.setPhone(phone);
		List<ShopUser> users = userService.queryShopUserList(shopUserQueryDTO);
		if (users != null && users.size() > 0) {
			ajaxResult.setSuccess(false);
			ajaxResult.setMsg("手机号已存在");
		} else {
			ajaxResult.setSuccess(true);
		}

		return ajaxResult;
	}

	/**
	 * 通过手机验证码重置登录密码
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/reset/password")
	@ResponseBody
	public AjaxResult ajaxResetPwd(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		String phone = request.getParameter("phone");
		if (StringUtils.isNotEmpty(phone)) {
			ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
			shopUserQueryDTO.setPhone(phone);
			List<ShopUser> users = userService.queryShopUserList(shopUserQueryDTO);
			if (users != null && users.size() > 0) {
				String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
				// 发送短信
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("password", verifyCode);
				SendSmsResponse response;
				try {
					response = SmsClient.sendSms(phone, jsonObject.toJSONString(), "SMS_154589811");
					if (response.getCode() != null && response.getCode().equals("OK")) {
						users.get(0).setPassword(Md5Util.generatePassword(verifyCode));
						userService.update(users.get(0));
						ajaxResult.setSuccess(true);
					}
				} catch (ClientException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else {
				ajaxResult.setMsg("账号不存在");
			}
		}

		return ajaxResult;
	}
	
	/**
	 * 通过手机验证码重置登录密码
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/reset/jiaoyimima")
	@ResponseBody
	public AjaxResult ajaxResetJYPwd(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		String phone = request.getParameter("phone");
		if (StringUtils.isNotEmpty(phone)) {
			ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
			shopUserQueryDTO.setPhone(phone);
			List<ShopUser> users = userService.queryShopUserList(shopUserQueryDTO);
			if (users != null && users.size() > 0) {
				String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
				// 发送短信
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("password", verifyCode);
				SendSmsResponse response;
				try {
					response = SmsClient.sendSms(phone, jsonObject.toJSONString(), "SMS_154589811");
					if (response.getCode() != null && response.getCode().equals("OK")) {
						users.get(0).setJiaoyimima(Md5Util.generatePassword(verifyCode));
						userService.update(users.get(0));
						ajaxResult.setSuccess(true);
					}
				} catch (ClientException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} else {
				ajaxResult.setMsg("账号不存在");
			}
		}
		
		return ajaxResult;
	}

	/**
	 * 校验是否存在
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/validator/account")
	@ResponseBody
	public AjaxResult ajaxValidatorAcount(HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();

		String acount = request.getParameter("acount");
		ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
		shopUserQueryDTO.setAccount(acount);
		List<ShopUser> users = userService.queryShopUserList(shopUserQueryDTO);
		if (users != null && users.size() > 0) {
			ajaxResult.setSuccess(false);
			ajaxResult.setMsg("手机号已存在");
		} else {
			ajaxResult.setSuccess(true);
		}

		return ajaxResult;
	}

}
