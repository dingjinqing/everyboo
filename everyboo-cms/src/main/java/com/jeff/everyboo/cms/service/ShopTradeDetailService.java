package com.jeff.everyboo.cms.service;

import com.jeff.everyboo.cms.entity.ShopTradeDetail;
import com.jeff.everyboo.cms.dao.ShopTradeDetailDao;
import com.jeff.everyboo.cms.dto.ShopTradeDetailQueryDTO;
import com.jeff.everyboo.common.service.CommonService;
import com.jeff.everyboo.common.entity.PageModel;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author dingjinqing
 * @desc ShopTradeDetailService类 
 * @date 2018-11-06
 */
@Service
public class ShopTradeDetailService extends CommonService< ShopTradeDetail,Integer >  {

    @Autowired
    private ShopTradeDetailDao shopTradeDetailDao;

    @Autowired
    public void setShopTradeDetailDao(ShopTradeDetailDao shopTradeDetailDao){
      super.setCommonDao(shopTradeDetailDao);
    }

    public PageModel<ShopTradeDetail> queryShopTradeDetailPage(ShopTradeDetailQueryDTO shopTradeDetailQueryDTO){
           return this.shopTradeDetailDao.queryShopTradeDetailPage(shopTradeDetailQueryDTO);
    }

    public List<ShopTradeDetail> queryShopTradeDetailList(ShopTradeDetailQueryDTO shopTradeDetailQueryDTO){
           return this.shopTradeDetailDao.queryShopTradeDetailList(shopTradeDetailQueryDTO);
    }


}