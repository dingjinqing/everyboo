package com.jeff.everyboo.cms.service;

import com.jeff.everyboo.cms.entity.ShopSysParam;
import com.jeff.everyboo.cms.dao.ShopSysParamDao;
import com.jeff.everyboo.cms.dto.ShopSysParamQueryDTO;
import com.jeff.everyboo.common.service.CommonService;
import com.jeff.everyboo.common.entity.PageModel;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author dingjinqing
 * @desc ShopSysParamService类 
 * @date 2018-11-19
 */
@Service
public class ShopSysParamService extends CommonService< ShopSysParam,Integer >  {

    @Autowired
    private ShopSysParamDao shopSysParamDao;

    @Autowired
    public void setShopSysParamDao(ShopSysParamDao shopSysParamDao){
      super.setCommonDao(shopSysParamDao);
    }

    public PageModel<ShopSysParam> queryShopSysParamPage(ShopSysParamQueryDTO shopSysParamQueryDTO){
           return this.shopSysParamDao.queryShopSysParamPage(shopSysParamQueryDTO);
    }

    public List<ShopSysParam> queryShopSysParamList(ShopSysParamQueryDTO shopSysParamQueryDTO){
           return this.shopSysParamDao.queryShopSysParamList(shopSysParamQueryDTO);
    }

	public ShopSysParam findByCode(String sysParamTixian) {
		// TODO Auto-generated method stub
		ShopSysParamQueryDTO shopSysParamQueryDTO = new ShopSysParamQueryDTO();
		shopSysParamQueryDTO.setSysCode(sysParamTixian);
		List<ShopSysParam> list = shopSysParamDao.queryShopSysParamList(shopSysParamQueryDTO);
		return list.get(0);
	}


}