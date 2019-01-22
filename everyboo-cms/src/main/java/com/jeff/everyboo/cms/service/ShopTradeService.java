package com.jeff.everyboo.cms.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeff.everyboo.cms.dao.ShopTradeDao;
import com.jeff.everyboo.cms.dto.ShopTradeQueryDTO;
import com.jeff.everyboo.cms.entity.ShopSysParam;
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
public class ShopTradeService extends CommonService<ShopTrade, Integer> {

	@Autowired
	private ShopTradeDao shopTradeDao;

	@Autowired
	public void setShopTradeDao(ShopTradeDao shopTradeDao) {
		super.setCommonDao(shopTradeDao);
	}

	public PageModel<ShopTrade> queryShopTradePage(ShopTradeQueryDTO shopTradeQueryDTO) {
		return this.shopTradeDao.queryShopTradePage(shopTradeQueryDTO);
	}

	public List<ShopTrade> queryShopTradeList(ShopTradeQueryDTO shopTradeQueryDTO) {
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

	/**直推+间推
	 * @return
	 */
	public Map<String, String> queryFenhongList() {
		List<Map<String, Object>> list = shopTradeDao.queryFenhongList();

		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> teMap = list.get(i);
			map.put(teMap.get("user_id").toString(), teMap.get("shouyi").toString());
		}
		return map;
	}

	/**分红和管理奖
	 * @return
	 */
	public Map<String, String> queryGongxiangList() {
		List<Map<String, Object>> list = shopTradeDao.queryGongxiangList();

		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> teMap = list.get(i);
			map.put(teMap.get("user_id").toString(), teMap.get("shouyi").toString());
		}
		return map;
	}
	
	public String queryGerenXiaofei(int userid) {
		return shopTradeDao.queryGerenXiaofei(userid);
	}

	public String queryZhituiXiaofei(String phone) {
		return shopTradeDao.queryZhituiXiaofei(phone);
	}

	public String queryJiantuiXiaofei(String phone) {
		return shopTradeDao.queryJiantuiXiaofei(phone);
	}

}