package com.jeff.everyboo.cms.service;

import com.jeff.everyboo.cms.entity.ShopProfit;
import com.jeff.everyboo.cms.dao.ShopProfitDao;
import com.jeff.everyboo.cms.dto.ShopProfitQueryDTO;
import com.jeff.everyboo.common.service.CommonService;
import com.jeff.everyboo.common.entity.PageModel;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author dingjinqing
 * @desc ShopProfitService类 
 * @date 2018-12-08
 */
@Service
public class ShopProfitService extends CommonService< ShopProfit,Integer >  {

    @Autowired
    private ShopProfitDao shopProfitDao;

    @Autowired
    public void setShopProfitDao(ShopProfitDao shopProfitDao){
      super.setCommonDao(shopProfitDao);
    }

    public PageModel<ShopProfit> queryShopProfitPage(ShopProfitQueryDTO shopProfitQueryDTO){
           return this.shopProfitDao.queryShopProfitPage(shopProfitQueryDTO);
    }

    public List<ShopProfit> queryShopProfitList(ShopProfitQueryDTO shopProfitQueryDTO){
           return this.shopProfitDao.queryShopProfitList(shopProfitQueryDTO);
    }


}