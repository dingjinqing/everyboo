package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.dao.CustomBaseSqlDaoImpl;
import com.jeff.everyboo.common.entity.PageModel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jeff.everyboo.cms.entity.ShopProduct;
import com.jeff.everyboo.cms.dto.ShopProductQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopProductDaoImpl类 
 * @date 2018-11-06
 */

public class ShopProductDaoImpl extends CustomBaseSqlDaoImpl implements ShopProductDaoCustom  {

    public PageModel<ShopProduct> queryShopProductPage(ShopProductQueryDTO shopProductQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopProduct t  where 1=1  ");
         if(StringUtils.isNotBlank(shopProductQueryDTO.getProName())){
    		 hql.append(" and t.proName = :proName ");
    		 map.put("proName", shopProductQueryDTO.getProName());
    	 }
    	 if(StringUtils.isNotBlank(shopProductQueryDTO.getStatus())){
    		 hql.append(" and t.status = :status ");
    		 map.put("status", shopProductQueryDTO.getStatus());
    	 }
    	 if(StringUtils.isNotBlank(shopProductQueryDTO.getType())){
    		 hql.append(" and t.type = :type ");
    		 map.put("type", shopProductQueryDTO.getType());
    	 }
    	 if(shopProductQueryDTO.getTypes()!=null && (!shopProductQueryDTO.getTypes().isEmpty()) &&shopProductQueryDTO.getTypes().size()>0 ){
        	 hql.append(" and t.type in ( :types ) ");
        	 map.put("types", shopProductQueryDTO.getTypes());
         }
    	 if(StringUtils.isNotBlank(shopProductQueryDTO.getVipLevel())){
    		 hql.append(" and t.vipLevel = :vipLevel ");
    		 map.put("vipLevel", shopProductQueryDTO.getVipLevel());
    	 }
    	 if(shopProductQueryDTO.getHot()!= null&&shopProductQueryDTO.getHot()!= 0){
    		 hql.append(" and t.hot = :hot ");
    		 map.put("hot", shopProductQueryDTO.getHot());
    	 }
    	 hql.append(" order by t.id desc");
         return this.queryForPageWithParams(hql.toString(),map,shopProductQueryDTO.getCurrentPage(),shopProductQueryDTO.getPageSize());
    }

    public List<ShopProduct> queryShopProductList(ShopProductQueryDTO shopProductQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopProduct t  where 1=1  ");
         if(StringUtils.isNotBlank(shopProductQueryDTO.getProName())){
    		 hql.append(" and t.proName = :proName ");
    		 map.put("proName", shopProductQueryDTO.getProName());
    	 }
    	 if(StringUtils.isNotBlank(shopProductQueryDTO.getStatus())){
    		 hql.append(" and t.status = :status ");
    		 map.put("status", shopProductQueryDTO.getStatus());
    	 }
    	 if(StringUtils.isNotBlank(shopProductQueryDTO.getType())){
    		 hql.append(" and t.type = :type ");
    		 map.put("type", shopProductQueryDTO.getType());
    	 }
    	 if(shopProductQueryDTO.getTypes()!=null && (!shopProductQueryDTO.getTypes().isEmpty()) &&shopProductQueryDTO.getTypes().size()>0 ){
        	 hql.append(" and t.type in ( :types ) ");
        	 map.put("types", shopProductQueryDTO.getTypes());
         }
    	 if(StringUtils.isNotBlank(shopProductQueryDTO.getVipLevel())){
    		 hql.append(" and t.vipLevel = :vipLevel ");
    		 map.put("vipLevel", shopProductQueryDTO.getVipLevel());
    	 }
    	 if(shopProductQueryDTO.getHot()!= null&&shopProductQueryDTO.getHot()!= 0){
    		 hql.append(" and t.hot = :hot ");
    		 map.put("hot", shopProductQueryDTO.getHot());
    	 }
    	 hql.append(" order by t.id desc");
         return this.queryByMapParams(hql.toString(),map);
    }


}