package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.dao.CustomBaseSqlDaoImpl;
import com.jeff.everyboo.common.entity.PageModel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.jeff.everyboo.cms.entity.ShopTradeDetail;
import com.jeff.everyboo.cms.dto.ShopTradeDetailQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopTradeDetailDaoImpl类 
 * @date 2018-11-06
 */

public class ShopTradeDetailDaoImpl extends CustomBaseSqlDaoImpl implements ShopTradeDetailDaoCustom  {

    public PageModel<ShopTradeDetail> queryShopTradeDetailPage(ShopTradeDetailQueryDTO shopTradeDetailQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopTradeDetail t ");
         return this.queryForPageWithParams(hql.toString(),map,shopTradeDetailQueryDTO.getCurrentPage(),shopTradeDetailQueryDTO.getPageSize());
    }

    public List<ShopTradeDetail> queryShopTradeDetailList(ShopTradeDetailQueryDTO shopTradeDetailQueryDTO){
         Map<String,Object> map = new HashMap<String,Object>();
         StringBuilder hql = new StringBuilder();
         hql.append("select t from ShopTradeDetail t ");
         return this.queryByMapParams(hql.toString(),map);
    }


}