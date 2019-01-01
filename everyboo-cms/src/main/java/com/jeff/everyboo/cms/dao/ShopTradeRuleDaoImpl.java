package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.dao.CustomBaseSqlDaoImpl;
import com.jeff.everyboo.common.entity.PageModel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jeff.everyboo.cms.entity.ShopTradeRule;
import com.jeff.everyboo.cms.dto.ShopTradeRuleQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopTradeRuleDaoImpl类 
 * @date 2018-12-02
 */

public class ShopTradeRuleDaoImpl extends CustomBaseSqlDaoImpl implements ShopTradeRuleDaoCustom  {

    public PageModel<ShopTradeRule> queryShopTradeRulePage(ShopTradeRuleQueryDTO shopTradeRuleQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select new ShopTradeRule(t.id,t.proId,t2.proName,t.vipLevel,t.fugoufd,t.fugouztfd,t.fugoujtfd,t.createDate,t.updateDate) from ShopTradeRule t,ShopProduct t2 where t.proId=t2.id ");
         if(StringUtils.isNotBlank(shopTradeRuleQueryDTO.getVipLevel())){
    		 hql.append(" and t.vipLevel = :vipLevel ");
    		 map.put("vipLevel", shopTradeRuleQueryDTO.getVipLevel());
    	 }
    	 if(shopTradeRuleQueryDTO.getProId()!=0){
    		 hql.append(" and t.proId = :proId ");
    		 map.put("proId", shopTradeRuleQueryDTO.getProId());
    	 }
         return this.queryForPageWithParams(hql.toString(),map,shopTradeRuleQueryDTO.getCurrentPage(),shopTradeRuleQueryDTO.getPageSize());
    }

    public List<ShopTradeRule> queryShopTradeRuleList(ShopTradeRuleQueryDTO shopTradeRuleQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select new ShopTradeRule(t.id, t.proId,t2.proName,t.vipLevel,t.fugoufd,t.fugouztfd,t.fugoujtfd,t.createDate,t.updateDate) from ShopTradeRule t,ShopProduct t2 where t.proId=t2.id ");
         if(StringUtils.isNotBlank(shopTradeRuleQueryDTO.getVipLevel())){
    		 hql.append(" and t.vipLevel = :vipLevel ");
    		 map.put("vipLevel", shopTradeRuleQueryDTO.getVipLevel());
    	 }
    	 if(shopTradeRuleQueryDTO.getProId()!=0){
    		 hql.append(" and t.proId = :proId ");
    		 map.put("proId", shopTradeRuleQueryDTO.getProId());
    	 }
         return this.queryByMapParams(hql.toString(),map);
    }


}