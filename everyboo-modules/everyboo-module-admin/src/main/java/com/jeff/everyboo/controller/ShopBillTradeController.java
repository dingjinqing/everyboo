package com.jeff.everyboo.controller;

import java.math.BigDecimal;
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

import com.jeff.everyboo.cms.dto.ShopBillTradeQueryDTO;
import com.jeff.everyboo.cms.dto.ShopUserQueryDTO;
import com.jeff.everyboo.cms.entity.ShopBillTrade;
import com.jeff.everyboo.cms.entity.ShopSysParam;
import com.jeff.everyboo.cms.entity.ShopTrade;
import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.cms.service.ShopBillTradeService;
import com.jeff.everyboo.cms.service.ShopSysParamService;
import com.jeff.everyboo.cms.service.ShopTradeService;
import com.jeff.everyboo.cms.service.ShopUserService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.common.util.ExcelUtils;
import com.jeff.everyboo.util.Constants;
import com.jeff.everyboo.util.WebHelper;
/**
 * 健康值Controller
 * @author dingjinqing@163.com
 *
 */
@Controller
@RequestMapping("/shopbilltrade")
public class ShopBillTradeController {

	@Autowired
	private ShopBillTradeService tradeService;
	@Autowired
	private ShopUserService userService;
	@Autowired
    private ShopSysParamService sysParamService;
	@Autowired
	private ShopTradeService stradeService;
	
	/**
	 * 获取用户列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model){
		String type = request.getParameter("type");
		String tradeStatus = request.getParameter("tradeStatus");
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");
		
		int currentPage = 1;
		int pageSize = 10;
		int a = 0,b=0;
		if(StringUtils.isNotBlank(currentPageStr)){
			currentPage = Integer.parseInt(currentPageStr);
		}
		if(StringUtils.isNotBlank(pageSizeStr)){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		if(StringUtils.isNotBlank(type)){
			a = Integer.parseInt(type);
		}
		if(StringUtils.isNotBlank(tradeStatus)){
			b = Integer.parseInt(tradeStatus);
		}
		
		ShopBillTradeQueryDTO queryDTO = new ShopBillTradeQueryDTO();
		queryDTO.setType(a);
		queryDTO.setTradeStatus(b);
		queryDTO.setCurrentPage(currentPage);
		queryDTO.setPageSize(pageSize);
		
		PageModel<ShopBillTrade> page = tradeService.queryShopBillTradePage(queryDTO);
		model.addAttribute("page", page);
		model.addAttribute("queryDTO", queryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_BILL_TRADE);
		
		return "shop/bill_list";
	}
	
	/**
	 * 导出用户数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/export")
	public String exportOrder(HttpServletRequest request, HttpServletResponse response){	
		String type = request.getParameter("type");
		String tradeStatus = request.getParameter("tradeStatus");
		int a = 0,b=0;
		if(StringUtils.isNotBlank(type)){
			a = Integer.parseInt(type);
		}
		if(StringUtils.isNotBlank(tradeStatus)){
			b = Integer.parseInt(tradeStatus);
		}
		ShopBillTradeQueryDTO queryDTO = new ShopBillTradeQueryDTO();
		queryDTO.setType(a);
		queryDTO.setTradeStatus(b);
		
		List<ShopBillTrade> userList = this.tradeService.queryShopBillTradeList(queryDTO);
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
			for(ShopBillTrade user : userList){
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
			ShopBillTrade bean = tradeService.find(Integer.parseInt(id));
			model.addAttribute("bean", bean);
		}
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_BILL_TRADE);
		return "shop/dialog/bill_edit";
	}
	
	/**
	 * 用户保存操作
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public AjaxResult ajaxSave(HttpServletRequest request ,ShopBillTrade user){
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
	 * 修改订单状态
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
			
			ShopBillTrade bean = tradeService.updateStatus(id, Integer.parseInt(status));
			
			ShopUser user = userService.find(bean.getUserId());
			
			//操作类型"1、提现  2、转让 3.捐赠     被转让用户转让健康值增加，
        	if (bean.getType()==2) {
        		ShopUserQueryDTO shopUserQueryDTO = new ShopUserQueryDTO();
        		shopUserQueryDTO.setPhone(bean.getTradePhone());
        		ShopUser tradeUser = userService.queryShopUserList(shopUserQueryDTO).get(0);
        		if (tradeUser!=null) {
        			BigDecimal transBill = tradeUser.getShopUserExts().getTradeBill().add(new BigDecimal(bean.getCount()));
	    	        tradeUser.getShopUserExts().setTradeBill(transBill);
	    	        userService.update(tradeUser);
	    	        
				}else {
					ajaxResult.setMsg("转让用户不存在");
					return ajaxResult;
				}
        	}/*else if (bean.getType()==1) {//提现到个人账户余额
//        		获取提现比例
        		ShopSysParam param = sysParamService.findByCode(WebHelper.SYS_PARAM_TIXIAN);
//        		数量乘以兑换比例
    	        BigDecimal jine = new BigDecimal(param.getSysValue()).multiply(new BigDecimal(bean.getCount()));
    	        user.getShopUserExts().setBalance(user.getShopUserExts().getBalance().add(jine));
    	        //插入提现记录到交易表
    	        ShopTrade ztTrade = new ShopTrade();
            	ztTrade.setPrice(jine);
            	ztTrade.setUserId(user.getId());
            	ztTrade.setTradeNo(WebHelper.getDayNo());
            	ztTrade.setJtype(12);//1.购买会员大礼包2.复购产品3.直推4.间推5.管理奖6.股份收益7.平台分红8.捐赠9赠送积分10直推赠送积分11间推赠送积分12提现健康值13项目合作
            	ztTrade.setStatus(3);
            	ztTrade.setCredits(0);
            	ztTrade.setCreateDate(new Date());
            	ztTrade.setShopTradeDetails(null);
            	stradeService.save(ztTrade);
        	}*/
        	
        	//发起用户减少健康值
			BigDecimal activeBill = user.getShopUserExts().getActiveBill().subtract(new BigDecimal(bean.getCount()));
	        //减去激活的健康值
	        user.getShopUserExts().setActiveBill( activeBill);
	        userService.update(user);
	        
			
			tradeService.save(bean);
			
			
			
			ajaxResult.setSuccess(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setMsg(e.getMessage());;
		}
		
		return ajaxResult;
	}
	
}
