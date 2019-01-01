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


}