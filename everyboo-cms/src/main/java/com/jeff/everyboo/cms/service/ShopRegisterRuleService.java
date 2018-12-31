package com.jeff.everyboo.cms.service;

import com.jeff.everyboo.cms.entity.ShopRegisterRule;
import com.jeff.everyboo.cms.dao.ShopRegisterRuleDao;
import com.jeff.everyboo.cms.dto.ShopRegisterRuleQueryDTO;
import com.jeff.everyboo.common.service.CommonService;
import com.jeff.everyboo.common.entity.PageModel;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author dingjinqing
 * @desc ShopRegisterRuleService类 
 * @date 2018-11-06
 */
@Service
public class ShopRegisterRuleService extends CommonService< ShopRegisterRule,Integer >  {

    @Autowired
    private ShopRegisterRuleDao shopRegisterRuleDao;

    @Autowired
    public void setShopRegisterRuleDao(ShopRegisterRuleDao shopRegisterRuleDao){
      super.setCommonDao(shopRegisterRuleDao);
    }

    public PageModel<ShopRegisterRule> queryShopRegisterRulePage(ShopRegisterRuleQueryDTO shopRegisterRuleQueryDTO){
           return this.shopRegisterRuleDao.queryShopRegisterRulePage(shopRegisterRuleQueryDTO);
    }

    public List<ShopRegisterRule> queryShopRegisterRuleList(ShopRegisterRuleQueryDTO shopRegisterRuleQueryDTO){
           return this.shopRegisterRuleDao.queryShopRegisterRuleList(shopRegisterRuleQueryDTO);
    }

	public ShopRegisterRule findByVip(String vipLevel) {
		// TODO Auto-generated method stub
		return shopRegisterRuleDao.findByVip(vipLevel);
	}


}