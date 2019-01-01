package com.jeff.everyboo.cms.service;

import com.jeff.everyboo.cms.entity.ShopProduct;
import com.jeff.everyboo.cms.entity.ShopTrade;
import com.jeff.everyboo.cms.dao.ShopProductDao;
import com.jeff.everyboo.cms.dto.ShopProductQueryDTO;
import com.jeff.everyboo.common.service.CommonService;
import com.jeff.everyboo.common.entity.PageModel;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author dingjinqing
 * @desc ShopProductService类 
 * @date 2018-11-06
 */
@Service
public class ShopProductService extends CommonService< ShopProduct,Integer >  {

    @Autowired
    private ShopProductDao shopProductDao;

    @Autowired
    public void setShopProductDao(ShopProductDao shopProductDao){
      super.setCommonDao(shopProductDao);
    }

    public PageModel<ShopProduct> queryShopProductPage(ShopProductQueryDTO shopProductQueryDTO){
           return this.shopProductDao.queryShopProductPage(shopProductQueryDTO);
    }

    public List<ShopProduct> queryShopProductList(ShopProductQueryDTO shopProductQueryDTO){
           return this.shopProductDao.queryShopProductList(shopProductQueryDTO);
    }

	public void updateStatus(String id, String status) {
		// TODO Auto-generated method stub
		ShopProduct bean = this.find(Integer.parseInt(id));
		bean.setStatus(status);
		this.update(bean);
	}
	
	public BigDecimal FindProductCreditsByVip(String vipLevel) {
		ShopProductQueryDTO dto =new ShopProductQueryDTO();
		dto.setStatus("1");
		dto.setVipLevel(vipLevel);
		//获取商品的赠送积分，并转化为BigDecimal格式，用于用户升级补积分
		List<ShopProduct> list = shopProductDao.queryShopProductList(dto);
		BigDecimal creids =  new BigDecimal(list.get(0).getIncomeCredits());
		return creids;
		
	}

}