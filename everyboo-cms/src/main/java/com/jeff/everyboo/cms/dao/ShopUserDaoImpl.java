package com.jeff.everyboo.cms.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jeff.everyboo.cms.dto.ShopUserQueryDTO;
import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.common.dao.CustomBaseSqlDaoImpl;
import com.jeff.everyboo.common.entity.PageModel;
/**
 * @author dingjinqing
 * @desc ShopUserDaoImpl类 
 * @date 2018-11-06
 */

public class ShopUserDaoImpl extends CustomBaseSqlDaoImpl implements ShopUserDaoCustom  {

    public PageModel<ShopUser> queryShopUserPage(ShopUserQueryDTO shopUserQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopUser t where 1=1  ");
         if(shopUserQueryDTO != null){
        	 if(StringUtils.isNotBlank(shopUserQueryDTO.getPhone())){
        		 hql.append(" and t.phone = :phone ");
            	 map.put("phone", shopUserQueryDTO.getPhone());
        	 }
        	 if(StringUtils.isNotBlank(shopUserQueryDTO.getVipLevel())){
        		 hql.append(" and t.vipLevel = :vipLevel ");
        		 map.put("vipLevel", shopUserQueryDTO.getVipLevel());
        	 }
        	 if(shopUserQueryDTO.getStatus()!=0){
        		 hql.append(" and t.status = :status ");
        		 map.put("status", shopUserQueryDTO.getStatus());
        	 }
        	 if(StringUtils.isNotBlank(shopUserQueryDTO.getAccount())){
        		 hql.append(" and t.account = :account ");
        		 map.put("account", shopUserQueryDTO.getAccount());
        	 }
    		 
         }
         hql.append(" order by t.id desc");
         return this.queryForPageWithParams(hql.toString(),map,shopUserQueryDTO.getCurrentPage(),shopUserQueryDTO.getPageSize());
    }

    public List<ShopUser> queryShopUserList(ShopUserQueryDTO shopUserQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         /*if(shopUserQueryDTO.getIsFront() != null && shopUserQueryDTO.getIsFront()){
        	 hql.append("select new ShopUser(id,account,phone,password,refPhone,vipLevel,address,createDate,createBy,updateDate,updateBy,nickName,jiaoyimima,status)  from ShopUser t where 1=1 ");

         }else {
        	 */
        	 hql.append("select t from ShopUser t where 1=1  ");
        // }
         if(shopUserQueryDTO != null){
        	 if(StringUtils.isNotBlank(shopUserQueryDTO.getPhone())){
        		 hql.append(" and t.phone = :phone ");
            	 map.put("phone", shopUserQueryDTO.getPhone());
        	 }
        	 if(StringUtils.isNotBlank(shopUserQueryDTO.getVipLevel())){
        		 hql.append(" and t.vipLevel = :vipLevel ");
        		 map.put("vipLevel", shopUserQueryDTO.getVipLevel());
        	 }
        	 if(shopUserQueryDTO.getStatus()!=0){
        		 hql.append(" and t.status = :status ");
        		 map.put("status", shopUserQueryDTO.getStatus());
        	 }
        	 if(StringUtils.isNotBlank(shopUserQueryDTO.getAccount())){
        		 hql.append(" and t.account = :account ");
        		 map.put("account", shopUserQueryDTO.getAccount());
        	 }
        	 if(StringUtils.isNotBlank(shopUserQueryDTO.getPassword())){
        		 hql.append(" and t.password = :password ");
        		 map.put("password", shopUserQueryDTO.getPassword());
        	 }
    		 
         }
         hql.append(" order by t.id desc");
         return this.queryByMapParams(hql.toString(),map);
    }


    public List<Map<String, Object>> queryUser2List(String phone){
    	StringBuilder sql = new StringBuilder();
    	sql.append("select account,nick_name as nickNmae,phone,vip_level as viplevel  from  shop_user where ref_phone=? ");
    	
    	List<Object> params = new ArrayList<>();
    	params.add(phone);
    	return this.querySqlObjects(sql.toString(), params);
    }
    
    public List<Map<String, Object>> queryUser3List(String phone){
    	StringBuilder sql = new StringBuilder();
    	sql.append("SELECT account,nick_name as nickName,phone,vip_level as viplevel from shop_user where ref_phone in (select phone from  shop_user where ref_phone=? )");
    	List<Object> params = new ArrayList<>();
    	params.add(phone);
    	return this.querySqlObjects(sql.toString(), params);
    }
    
    
    public List<Map<String, Object>> queryIncomeList(String userId){
    	StringBuilder sql = new StringBuilder();
    	sql.append("SELECT sum(price) as income,type from shop_trade where user_id=? GROUP BY type ");
    	List<Object> params = new ArrayList<>();
    	params.add(userId);
    	return this.querySqlObjects(sql.toString(), params);
    }

	@Override
	public List<Map<String, Object>> queryIncomeList(ShopUserQueryDTO shopUserQueryDTO) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
    	sql.append("SELECT ifnull(ABS(sum(price)),0) as income,type from shop_trade where 1=1  ");
    	List<Object> params = new ArrayList<>();
    	if (shopUserQueryDTO.getUserId()!=0) {
    		sql.append("and user_id=?");
    		params.add(shopUserQueryDTO.getUserId());
		}
    	if (shopUserQueryDTO.getStartTime()!=null ) {
    		sql.append("and create_date>?");
    		params.add(shopUserQueryDTO.getStartTime());
		}
    	if (shopUserQueryDTO.getEndTime()!=null ) {
    		sql.append("and create_date<?");
    		params.add(shopUserQueryDTO.getEndTime());
    	}
    	sql.append(" GROUP BY type ");
    	return this.querySqlObjects(sql.toString(), params);
	}

}