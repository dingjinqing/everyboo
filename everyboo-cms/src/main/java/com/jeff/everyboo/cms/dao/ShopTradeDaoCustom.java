package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.entity.PageModel;
import java.util.List;
import com.jeff.everyboo.cms.entity.ShopTrade;
import com.jeff.everyboo.cms.entity.ShopTradeUser;
import com.jeff.everyboo.cms.dto.ShopTradeQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopTradeDaoCustom接口 
 * @date 2018-11-06
 */
public interface ShopTradeDaoCustom {

      PageModel<ShopTrade> queryShopTradePage(ShopTradeQueryDTO shopTradeQueryDTO);

      List<ShopTrade> queryShopTradeList(ShopTradeQueryDTO shopTradeQueryDTO);

      int queryLisiJkz(int userId);
      
      PageModel<ShopTradeUser> queryShopTradeUserPage(ShopTradeQueryDTO userQueryDTO);
      
      List<ShopTradeUser> queryShopTradeUserList(ShopTradeQueryDTO userQueryDTO);

}