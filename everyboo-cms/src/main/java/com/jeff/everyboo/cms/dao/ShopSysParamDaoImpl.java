package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.dao.CustomBaseSqlDaoImpl;
import com.jeff.everyboo.common.entity.PageModel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jeff.everyboo.cms.entity.ShopSysParam;
import com.jeff.everyboo.cms.dto.ShopSysParamQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopSysParamDaoImpl类 
 * @date 2018-11-19
 */

public class ShopSysParamDaoImpl extends CustomBaseSqlDaoImpl implements ShopSysParamDaoCustom  {

    public PageModel<ShopSysParam> queryShopSysParamPage(ShopSysParamQueryDTO shopSysParamQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopSysParam t where 1=1 ");
         if(StringUtils.isNotBlank(shopSysParamQueryDTO.getSysCode())){
    		 hql.append(" and t.sysCode = :sysCode ");
        	 map.put("sysCode", shopSysParamQueryDTO.getSysCode());
    	 }
         if(StringUtils.isNotBlank(shopSysParamQueryDTO.getSysType())){
        	 hql.append(" and t.sysType = :sysType ");
        	 map.put("sysType", shopSysParamQueryDTO.getSysType());
         }
         hql.append(" order by t.id desc");
         return this.queryForPageWithParams(hql.toString(),map,shopSysParamQueryDTO.getCurrentPage(),shopSysParamQueryDTO.getPageSize());
    }

    public List<ShopSysParam> queryShopSysParamList(ShopSysParamQueryDTO shopSysParamQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopSysParam t  where 1=1 ");
         if(StringUtils.isNotBlank(shopSysParamQueryDTO.getSysCode())){
    		 hql.append(" and t.sysCode = :sysCode ");
        	 map.put("sysCode", shopSysParamQueryDTO.getSysCode());
    	 }
         if(StringUtils.isNotBlank(shopSysParamQueryDTO.getSysType())){
        	 hql.append(" and t.sysType = :sysType ");
        	 map.put("sysType", shopSysParamQueryDTO.getSysType());
         }
         hql.append(" order by t.id desc");
         return this.queryByMapParams(hql.toString(),map);
    }


}