package com.jeff.everyboo.cms.service;

import com.jeff.everyboo.cms.entity.ShopSysParam;
import com.jeff.everyboo.cms.dao.ShopSysParamDao;
import com.jeff.everyboo.cms.dto.ShopSysParamQueryDTO;
import com.jeff.everyboo.common.service.CommonService;
import com.jeff.everyboo.common.entity.PageModel;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

	/**根据表的sys_code查找value设置
	 * @param sysParamTixian
	 * @return
	 */
	public ShopSysParam findByCode(String syscode) {
		// TODO Auto-generated method stub
		ShopSysParamQueryDTO shopSysParamQueryDTO = new ShopSysParamQueryDTO();
		shopSysParamQueryDTO.setSysCode(syscode);
		List<ShopSysParam> list = shopSysParamDao.queryShopSysParamList(shopSysParamQueryDTO);
		return list.get(0);
	}
	
	public Map<String, String> findByType(String syscode) {
		// TODO Auto-generated method stub
		ShopSysParamQueryDTO shopSysParamQueryDTO = new ShopSysParamQueryDTO();
		shopSysParamQueryDTO.setSysCode(syscode);
		List<ShopSysParam> list = shopSysParamDao.queryShopSysParamList(shopSysParamQueryDTO);
//		list转map,java8新特性
		Map<String, String> map = list.stream().collect(Collectors.toMap(ShopSysParam::getSysType,ShopSysParam::getSysValue));
		return map;
	}


}