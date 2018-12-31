package com.jeff.everyboo.controller;

import com.jeff.everyboo.cms.entity.ShopSysParam;
import com.jeff.everyboo.cms.service.ShopSysParamService;
import javax.servlet.http.HttpServletRequest; 
import org.apache.commons.lang3.StringUtils; 
import java.util.Date; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeff.everyboo.common.dto.AjaxResult;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.util.Constants;
import com.jeff.everyboo.cms.dto.ShopSysParamQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopSysParamController 
 * @date 2018-11-19
 */
@Controller
@RequestMapping("/sysParam")
public class ShopSysParamController{

    @Autowired
    private ShopSysParamService shopSysParamService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request,Model model){
       String currentPageStr = request.getParameter("currentPage");
       String pageSizeStr = request.getParameter("pageSize");
       String sysCode = request.getParameter("sysCode");
       String sysType = request.getParameter("sysType");
       int currentPage = 1;
       int pageSize = 10;
       if(StringUtils.isNotBlank(currentPageStr)){
             currentPage = Integer.parseInt(currentPageStr);
       }
       if(StringUtils.isNotBlank(pageSizeStr)){
             pageSize = Integer.parseInt(pageSizeStr);
       }
       ShopSysParamQueryDTO shopSysParamQueryDTO = new ShopSysParamQueryDTO(); 
       shopSysParamQueryDTO.setCurrentPage(currentPage);
       shopSysParamQueryDTO.setPageSize(pageSize);
       shopSysParamQueryDTO.setSysType(sysType);
       shopSysParamQueryDTO.setSysCode(sysCode);
       PageModel<ShopSysParam> page = this.shopSysParamService.queryShopSysParamPage(shopSysParamQueryDTO);
       model.addAttribute("page", page);
       model.addAttribute("queryDTO", shopSysParamQueryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.SHOP_SYS_PARAM);
       return "shop/sysParam_list";
    }

    @RequestMapping("/edit")
    public String dialogEdit(HttpServletRequest request,Model model){
        String id = request.getParameter("id");
        ShopSysParam shopSysParam = null;
        if(StringUtils.isNotBlank(id)){
             shopSysParam = this.shopSysParamService.find(Integer.parseInt(id));
        }
        model.addAttribute("bean", shopSysParam);
        return "shop/dialog/sysParam_edit";
    }

    @RequestMapping("/save")
    @ResponseBody
	public AjaxResult  doSaveOrUpdate(HttpServletRequest request,ShopSysParam shopSysParam){
    	AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
        String id = request.getParameter("id");
        if(StringUtils.isNotBlank(id)){
             shopSysParam.setUpdateDate(new Date());
             this.shopSysParamService.update(shopSysParam);
        }else{
             shopSysParam.setCreateDate(new Date());
             this.shopSysParamService.save(shopSysParam);
        }
        ajaxResult.setSuccess(true);
        return ajaxResult;
    }

    @RequestMapping("/doDelete")
    public String doDelete(HttpServletRequest request){
        String id = request.getParameter("id");
        ShopSysParam shopSysParam = this.shopSysParamService.find(Integer.parseInt(id));
        if(shopSysParam != null){
           this.shopSysParamService.delete(Integer.parseInt(id));;
        }
        return "redirect:/sysParam/list";
    }



}