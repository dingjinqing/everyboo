package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.entity.PageModel;
import java.util.List;
import com.jeff.everyboo.cms.entity.ShopUserExt;
import com.jeff.everyboo.cms.dto.ShopUserExtQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopUserExtDaoCustom接口 
 * @date 2018-11-06
 */
public interface ShopUserExtDaoCustom {

      PageModel<ShopUserExt> queryShopUserExtPage(ShopUserExtQueryDTO shopUserExtQueryDTO);

      List<ShopUserExt> queryShopUserExtList(ShopUserExtQueryDTO shopUserExtQueryDTO);

  	  ShopUserExt queryShopUserByUserId(Integer id);

}