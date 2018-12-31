package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.dao.CustomBaseSqlDaoImpl;
import com.jeff.everyboo.common.entity.PageModel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jeff.everyboo.cms.entity.ShopRegisterRule;
import com.jeff.everyboo.cms.dto.ShopRegisterRuleQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopRegisterRuleDaoImpl类 
 * @date 2018-11-06
 */

public class ShopRegisterRuleDaoImpl extends CustomBaseSqlDaoImpl implements ShopRegisterRuleDaoCustom  {

    public PageModel<ShopRegisterRule> queryShopRegisterRulePage(ShopRegisterRuleQueryDTO shopRegisterRuleQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopRegisterRule t where 1=1 ");
         if (StringUtils.isNotEmpty(shopRegisterRuleQueryDTO.getVipLevel())) {
    		 hql.append(" and t.vipLevel = :vipLevel ");
        	 map.put("vipLevel", shopRegisterRuleQueryDTO.getVipLevel());
		}
         return this.queryForPageWithParams(hql.toString(),map,shopRegisterRuleQueryDTO.getCurrentPage(),shopRegisterRuleQueryDTO.getPageSize());
    }

    public List<ShopRegisterRule> queryShopRegisterRuleList(ShopRegisterRuleQueryDTO shopRegisterRuleQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopRegisterRule t where 1=1 ");
         if (StringUtils.isNotEmpty(shopRegisterRuleQueryDTO.getVipLevel())) {
    		 hql.append(" and t.vipLevel = :vipLevel ");
        	 map.put("vipLevel", shopRegisterRuleQueryDTO.getVipLevel());
		}
         return this.queryByMapParams(hql.toString(),map);
    }

	@Override
	public ShopRegisterRule findByVip(String vipLevel) {
		// TODO Auto-generated method stub
		ShopRegisterRuleQueryDTO shopRegisterRuleQueryDTO = new ShopRegisterRuleQueryDTO();
		shopRegisterRuleQueryDTO.setVipLevel(vipLevel);
		List<ShopRegisterRule> list = this.queryShopRegisterRuleList(shopRegisterRuleQueryDTO);
		
		return list.get(0);
	}


}