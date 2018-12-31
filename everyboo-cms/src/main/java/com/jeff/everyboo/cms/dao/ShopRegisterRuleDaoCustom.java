package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.entity.PageModel;
import java.util.List;
import com.jeff.everyboo.cms.entity.ShopRegisterRule;
import com.jeff.everyboo.cms.dto.ShopRegisterRuleQueryDTO;
/**
 * @author dingjinqing
 * @desc ShopRegisterRuleDaoCustom接口 
 * @date 2018-11-06
 */
public interface ShopRegisterRuleDaoCustom {

      PageModel<ShopRegisterRule> queryShopRegisterRulePage(ShopRegisterRuleQueryDTO shopRegisterRuleQueryDTO);

      List<ShopRegisterRule> queryShopRegisterRuleList(ShopRegisterRuleQueryDTO shopRegisterRuleQueryDTO);

      ShopRegisterRule findByVip(String vipLevel);

}