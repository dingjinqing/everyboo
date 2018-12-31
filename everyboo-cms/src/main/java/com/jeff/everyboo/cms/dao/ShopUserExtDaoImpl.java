package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.dao.CustomBaseSqlDaoImpl;
import com.jeff.everyboo.common.entity.PageModel;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.bridge.MessageWriter;

import com.jeff.everyboo.cms.entity.ShopUserExt;
import com.jeff.everyboo.cms.dto.ShopUserExtQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopUserExtDaoImpl类 
 * @date 2018-11-06
 */

public class ShopUserExtDaoImpl extends CustomBaseSqlDaoImpl implements ShopUserExtDaoCustom  {

    public PageModel<ShopUserExt> queryShopUserExtPage(ShopUserExtQueryDTO shopUserExtQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopUserExt t ");
         return this.queryForPageWithParams(hql.toString(),map,shopUserExtQueryDTO.getCurrentPage(),shopUserExtQueryDTO.getPageSize());
    }

    public List<ShopUserExt> queryShopUserExtList(ShopUserExtQueryDTO shopUserExtQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopUserExt t ");
         return this.queryByMapParams(hql.toString(),map);
    }

	@Override
	public ShopUserExt queryShopUserByUserId(Integer id) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
    	sql.append("SELECT id, credits, bill, active_bill as activeBill,trade_bill as tradeBill,balance from shop_user_ext where user_id =? ");

		List<Object> params = new ArrayList<>();
    	params.add(id);
    	ShopUserExt ext = new ShopUserExt();
    	List<Map<String, Object>> list = this.querySqlObjects(sql.toString(), params);
    	
    	if (list!=null && list.size()>0) {
    		ext.setId(Integer.parseInt(list.get(0).get("id").toString()) );
    		ext.setCredits(list.get(0).get("credits").toString());
    		ext.setBill(list.get(0).get("credits").toString());
    		ext.setActiveBill(list.get(0).get("credits").toString());
    		ext.setTradeBill(list.get(0).get("credits").toString());
    		ext.setBalance(new BigDecimal(list.get(0).get("credits").toString()) );
		}
		return ext;
        
	}


}