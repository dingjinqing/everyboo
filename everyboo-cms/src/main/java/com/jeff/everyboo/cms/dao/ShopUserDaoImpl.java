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
        	 if(StringUtils.isNotBlank(shopUserQueryDTO.getLevel())){
        		 hql.append(" and t.level = :level ");
        		 map.put("level", shopUserQueryDTO.getLevel());
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
        	 if(StringUtils.isNotBlank(shopUserQueryDTO.getLevel())){
        		 hql.append(" and t.level = :level ");
        		 map.put("level", shopUserQueryDTO.getLevel());
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
    	sql.append("select t.id,account,nick_name as nickNmae,phone,level,vip_level as viplevel,uext.active_bill as activeBill,(SELECT IFNULL(SUM(ABS(price)+ABS(duihuan)+ABS(credits)),0) from shop_trade where user_id=t.id and type=1) as selfyeji,(SELECT IFNULL(SUM(ABS(t2.price)+ABS(t2.duihuan)+ABS(t2.credits)),0) from shop_trade t2 where t2.user_id in (SELECT t3.id from shop_user t3 where t3.ref_phone=t.phone)  and t2.type=1)  as zituiyeji ,(SELECT IFNULL(SUM(ABS(t5.price)+ABS(t5.duihuan)+ABS(t5.credits)),0) from shop_trade t5 LEFT JOIN shop_user t6 on t5.user_id =t6.id and t5.type=1 where  t6.ref_phone in (SELECT t4.phone from shop_user t4 where t4.ref_phone=t.phone)) as jiantuiyeji    from  shop_user t LEFT JOIN shop_user_ext uext on t.id= uext.user_id where ref_phone=? " );
    	
    	List<Object> params = new ArrayList<>();
    	params.add(phone);
    	return this.querySqlObjects(sql.toString(), params);
    }
    
    public List<Map<String, Object>> queryUser3List(String phone){
    	StringBuilder sql = new StringBuilder();
    	sql.append("SELECT id,account,nick_name as nickName,phone,level,vip_level as viplevel,t.ref_phone as refPhone,(SELECT IFNULL(SUM(ABS(price)+ABS(duihuan)+ABS(credits)),0) from shop_trade where user_id=t.id and type=1) as selfyeji  from shop_user t where t.ref_phone in (select phone from  shop_user where ref_phone=? ) ORDER BY t.ref_phone ");
    	List<Object> params = new ArrayList<>();
    	params.add(phone);
    	return this.querySqlObjects(sql.toString(), params);
    }
    
    /**后台查询直接团队购买明细
     * @param phone
     * @return
     */
    public List<Map<String, Object>> queryUser4List(String phone){
    	StringBuilder sql = new StringBuilder();
    	sql.append("select t.id,account,nick_name as nickNmae,phone,level,vip_level as viplevel,uext.active_bill as activeBill,(SELECT IFNULL(SUM(ABS(price)+ABS(duihuan)+ABS(credits)),0) from shop_trade where user_id=t.id and type=1) as selfyeji,(SELECT IFNULL(SUM(ABS(t2.price)+ABS(t2.duihuan)+ABS(t2.credits)),0) from shop_trade t2 where t2.user_id in (SELECT t3.id from shop_user t3 where t3.ref_phone=t.phone)  and t2.type=1)  as zituiyeji ,(SELECT IFNULL(SUM(ABS(t5.price)+ABS(t5.duihuan)+ABS(t5.credits)),0) from shop_trade t5 LEFT JOIN shop_user t6 on t5.user_id =t6.id and t5.type=1 where  t6.ref_phone in (SELECT t4.phone from shop_user t4 where t4.ref_phone=t.phone)) as jiantuiyeji    from  shop_user t LEFT JOIN shop_user_ext uext on t.id= uext.user_id where ref_phone=? ");
    	
    	List<Object> params = new ArrayList<>();
    	params.add(phone);
    	return this.querySqlObjects(sql.toString(), params);
    }
    
    /**后台查询间推团队购买明细
     * @param phone
     * @return
     */
    public List<Map<String, Object>> queryUser5List(String phone){
    	StringBuilder sql = new StringBuilder();
    	sql.append("SELECT t.id,account,nick_name as nickName,phone,level,vip_level as viplevel ,t.ref_phone as refPhone ,uext.active_bill as activeBill,(SELECT IFNULL(SUM(ABS(price)+ABS(duihuan)+ABS(credits)),0) from shop_trade where user_id=t.id and type=1) as selfyeji ,(SELECT IFNULL(SUM(ABS(t2.price)+ABS(t2.duihuan)+ABS(t2.credits)),0) from shop_trade t2 where t2.user_id in (SELECT t3.id from shop_user t3 where t3.ref_phone=t.phone)  and t2.type=1)  as zituiyeji ,(SELECT IFNULL(SUM(ABS(t5.price)+ABS(t5.duihuan)+ABS(t5.credits)),0) from shop_trade t5 LEFT JOIN shop_user t6 on t5.user_id =t6.id and t5.type=1 where  t6.ref_phone in (SELECT t4.phone from shop_user t4 where t4.ref_phone=t.phone)) as jiantuiyeji from shop_user t LEFT JOIN shop_user_ext uext on t.id= uext.user_id where t.ref_phone in (select phone from  shop_user where ref_phone=? ) ORDER BY t.ref_phone ");
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