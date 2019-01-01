package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.entity.PageModel;
import java.util.List;
import com.jeff.everyboo.cms.entity.ShopProduct;
import com.jeff.everyboo.cms.dto.ShopProductQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopProductDaoCustom接口 
 * @date 2018-11-06
 */
public interface ShopProductDaoCustom {

      PageModel<ShopProduct> queryShopProductPage(ShopProductQueryDTO shopProductQueryDTO);

      List<ShopProduct> queryShopProductList(ShopProductQueryDTO shopProductQueryDTO);



}