package com.jeff.everyboo.cms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeff.everyboo.cms.dao.ShopTradeDao;
import com.jeff.everyboo.cms.dto.ShopTradeQueryDTO;
import com.jeff.everyboo.cms.entity.ShopTrade;
import com.jeff.everyboo.cms.entity.ShopTradeUser;
import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.common.service.CommonService;
/**
 * @author dingjinqing
 * @desc ShopTradeService类 
 * @date 2018-11-06
 */
@Service
public class ShopTradeService extends CommonService< ShopTrade,Integer >  {

    @Autowired
    private ShopTradeDao shopTradeDao;

    @Autowired
    public void setShopTradeDao(ShopTradeDao shopTradeDao){
      super.setCommonDao(shopTradeDao);
    }

    public PageModel<ShopTrade> queryShopTradePage(ShopTradeQueryDTO shopTradeQueryDTO){
           return this.shopTradeDao.queryShopTradePage(shopTradeQueryDTO);
    }

    public List<ShopTrade> queryShopTradeList(ShopTradeQueryDTO shopTradeQueryDTO){
           return this.shopTradeDao.queryShopTradeList(shopTradeQueryDTO);
    }

	public ShopTrade updateStatus(String id, int status) {
		// TODO Auto-generated method stub
		ShopTrade bean = this.find(Integer.parseInt(id));
		bean.setStatus(status);
		bean.setUpdateDate(new Date());
		this.update(bean);
		return bean;
	}
	
	public int queryLisiJkz(int userId) {
		return shopTradeDao.queryLisiJkz(userId);
	}

	public PageModel<ShopTradeUser> queryShopTradeUserPage(ShopTradeQueryDTO userQueryDTO) {
		// TODO Auto-generated method stub
		return this.shopTradeDao.queryShopTradeUserPage(userQueryDTO);
	}
	
	public List<ShopTradeUser> queryShopTradeUserList(ShopTradeQueryDTO userQueryDTO) {
		// TODO Auto-generated method stub
		return this.shopTradeDao.queryShopTradeUserList(userQueryDTO);
	}


}