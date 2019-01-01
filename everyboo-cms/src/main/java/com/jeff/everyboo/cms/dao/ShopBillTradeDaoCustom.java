package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.entity.PageModel;
import java.util.List;
import com.jeff.everyboo.cms.entity.ShopBillTrade;
import com.jeff.everyboo.cms.dto.ShopBillTradeQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopBillTradeDaoCustom接口 
 * @date 2018-11-06
 */
public interface ShopBillTradeDaoCustom {

      PageModel<ShopBillTrade> queryShopBillTradePage(ShopBillTradeQueryDTO shopBillTradeQueryDTO);

      List<ShopBillTrade> queryShopBillTradeList(ShopBillTradeQueryDTO shopBillTradeQueryDTO);



}