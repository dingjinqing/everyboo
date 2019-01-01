package com.jeff.everyboo.controller;

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

import com.jeff.everyboo.cms.dto.ShopProfitQueryDTO;
import com.jeff.everyboo.cms.dto.ShopUserQueryDTO;
import com.jeff.everyboo.cms.entity.ShopProfit;
import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.cms.service.ShopProfitService;
import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.common.util.ExcelUtils;
import com.jeff.everyboo.util.Constants;
/**
 * @author dingjinqing
 * @date 2018-11-19
 */
@Controller
@RequestMapping("/sysProfit")
public class ShopProfitController{

    @Autowired
    private ShopProfitService shopProfitService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request,Model model){
       String currentPageStr = request.getParameter("currentPage");
       String pageSizeStr = request.getParameter("pageSize");
       String sdateStart = request.getParameter("sdateStart");
       String sdateEnd = request.getParameter("sdateEnd");
       String type = request.getParameter("type");
       int currentPage = 1;
       int pageSize = 10;
       byte btype = 0;
       if(StringUtils.isNotBlank(currentPageStr)){
             currentPage = Integer.parseInt(currentPageStr);
       }
       if(StringUtils.isNotBlank(pageSizeStr)){
             pageSize = Integer.parseInt(pageSizeStr);
       }
       if(StringUtils.isNotBlank(type)){
    	   btype = Byte.parseByte(type);
       }
       ShopProfitQueryDTO queryDTO = new ShopProfitQueryDTO(); 
       queryDTO.setCurrentPage(currentPage);
       queryDTO.setPageSize(pageSize);
       queryDTO.setSdateEnd(sdateEnd);
       queryDTO.setSdateStart(sdateStart);
       queryDTO.setType(btype);
       PageModel<ShopProfit> page = this.shopProfitService.queryShopProfitPage(queryDTO);
       model.addAttribute("page", page);
       model.addAttribute("queryDTO", queryDTO);
       model.addAttribute(Constants.MENU_NAME, Constants.SHOP_SYS_PARAM);
       return "shop/sysProfit_list";
    }

    @RequestMapping("/edit")
    public String dialogEdit(HttpServletRequest request,Model model){
        String id = request.getParameter("id");
        ShopProfit shopSysParam = null;
        if(StringUtils.isNotBlank(id)){
             shopSysParam = this.shopProfitService.find(Integer.parseInt(id));
        }
        model.addAttribute("bean", shopSysParam);
        return "shop/dialog/sysprofit_edit";
    }

    @RequestMapping("/save")
    @ResponseBody
	public AjaxResult  doSaveOrUpdate(HttpServletRequest request,ShopProfit shopSysParam){
    	AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
        String id = request.getParameter("id");
        if(StringUtils.isNotBlank(id)){
             this.shopProfitService.update(shopSysParam);
        }else{
             shopSysParam.setCreateDate(new Date());
             this.shopProfitService.save(shopSysParam);
        }
        ajaxResult.setSuccess(true);
        return ajaxResult;
    }

    @RequestMapping("/doDelete")
    public String doDelete(HttpServletRequest request){
        String id = request.getParameter("id");
        ShopProfit shopSysParam = this.shopProfitService.find(Integer.parseInt(id));
        if(shopSysParam != null){
           this.shopProfitService.delete(Integer.parseInt(id));;
        }
        return "redirect:/sysProfit/list";
    }

    @RequestMapping("/export")
	public String exportOrder(HttpServletRequest request, HttpServletResponse response) {
        String sdateStart = request.getParameter("sdateStart");
        String sdateEnd = request.getParameter("sdateEnd");
        String type = request.getParameter("type");
        byte btype = 0;
        if(StringUtils.isNotBlank(type)){
     	   btype = Byte.parseByte(type);
        }
        ShopProfitQueryDTO queryDTO = new ShopProfitQueryDTO(); 
        queryDTO.setSdateEnd(sdateEnd);
        queryDTO.setSdateStart(sdateStart);
        queryDTO.setType(btype);

		List<ShopProfit> userList = this.shopProfitService.queryShopProfitList(queryDTO);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, String> headNameMap = new LinkedHashMap<String, String>();
		headNameMap.put("type", "类型");
		headNameMap.put("profit", "利润");
		headNameMap.put("dateString", "利润对应时间");
		headNameMap.put("createDate", "创建时间");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (userList != null && userList.size() > 0) {
			for (ShopProfit user : userList) {
				String statusName = "日利润";
				String createDate = "";
				if (user.getType() == 2) {
					statusName = "月利润";
				}

				if (user.getCreateDate() != null) {
					createDate = sdf.format(user.getCreateDate());
				}

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("type", statusName);
				map.put("profit", user.getProfit());
				map.put("dateString", user.getDateString());
				map.put("createDate", createDate);
				list.add(map);
			}
		}

		ExcelUtils.exportXlsx(response, "平台利润数据", headNameMap, list);
		return null;
	}

}