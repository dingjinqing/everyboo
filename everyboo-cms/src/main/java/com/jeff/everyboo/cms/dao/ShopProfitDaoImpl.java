package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.dao.CustomBaseSqlDaoImpl;
import com.jeff.everyboo.common.entity.PageModel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jeff.everyboo.cms.entity.ShopProfit;
import com.jeff.everyboo.cms.dto.ShopProfitQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopProfitDaoImpl类 
 * @date 2018-12-08
 */

public class ShopProfitDaoImpl extends CustomBaseSqlDaoImpl implements ShopProfitDaoCustom  {

    public PageModel<ShopProfit> queryShopProfitPage(ShopProfitQueryDTO shopProfitQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopProfit t where 1=1 ");
         if(StringUtils.isNotBlank(shopProfitQueryDTO.getSdateEnd())){
    		 hql.append(" and t.dateString <= :dateEnd ");
        	 map.put("dateEnd", shopProfitQueryDTO.getSdateEnd());
    	 }
    	 if(StringUtils.isNotBlank(shopProfitQueryDTO.getSdateStart())){
    		 hql.append(" and t.dateString >= :dateStart ");
    		 map.put("dateStart", shopProfitQueryDTO.getSdateStart());
    	 }
    	 if (shopProfitQueryDTO.getType()!=0) {
    		 hql.append(" and t.type = :type ");
    		 map.put("type", shopProfitQueryDTO.getType());
		}
         hql.append(" order by t.id desc");
         return this.queryForPageWithParams(hql.toString(),map,shopProfitQueryDTO.getCurrentPage(),shopProfitQueryDTO.getPageSize());
    }

    public List<ShopProfit> queryShopProfitList(ShopProfitQueryDTO shopProfitQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopProfit t where 1=1 ");
         if(StringUtils.isNotBlank(shopProfitQueryDTO.getSdateEnd())){
    		 hql.append(" and t.dateString <= :dateEnd ");
        	 map.put("dateEnd", shopProfitQueryDTO.getSdateEnd());
    	 }
    	 if(StringUtils.isNotBlank(shopProfitQueryDTO.getSdateStart())){
    		 hql.append(" and t.dateString >= :dateStart ");
    		 map.put("dateStart", shopProfitQueryDTO.getSdateStart());
    	 }
    	 if (shopProfitQueryDTO.getType()!=0) {
    		 hql.append(" and t.type = :type ");
    		 map.put("type", shopProfitQueryDTO.getType());
		}
         hql.append(" order by t.id desc");
         return this.queryByMapParams(hql.toString(),map);
    }


}