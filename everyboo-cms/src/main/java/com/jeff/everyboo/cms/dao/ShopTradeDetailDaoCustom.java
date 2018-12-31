package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.entity.PageModel;
import java.util.List;
import com.jeff.everyboo.cms.entity.ShopTradeDetail;
import com.jeff.everyboo.cms.dto.ShopTradeDetailQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopTradeDetailDaoCustom接口 
 * @date 2018-11-06
 */
public interface ShopTradeDetailDaoCustom {

      PageModel<ShopTradeDetail> queryShopTradeDetailPage(ShopTradeDetailQueryDTO shopTradeDetailQueryDTO);

      List<ShopTradeDetail> queryShopTradeDetailList(ShopTradeDetailQueryDTO shopTradeDetailQueryDTO);



}