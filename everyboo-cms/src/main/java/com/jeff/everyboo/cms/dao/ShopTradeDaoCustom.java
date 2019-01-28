package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.entity.PageModel;
import java.util.List;
import java.util.Map;

import com.jeff.everyboo.cms.entity.ShopTrade;
import com.jeff.everyboo.cms.entity.ShopTradeUser;
import com.jeff.everyboo.cms.dto.ShopTradeQueryDTO;

/**
 * @author dingjinqing
 * @desc ShopTradeDaoCustom接口
 * @date 2018-11-06
 */
public interface ShopTradeDaoCustom {

	PageModel<ShopTrade> queryShopTradePage(ShopTradeQueryDTO shopTradeQueryDTO);

	List<ShopTrade> queryShopTradeList(ShopTradeQueryDTO shopTradeQueryDTO);

	int queryLisiJkz(int userId);

	PageModel<ShopTradeUser> queryShopTradeUserPage(ShopTradeQueryDTO userQueryDTO);

	List<ShopTradeUser> queryShopTradeUserList(ShopTradeQueryDTO userQueryDTO);

	List<Map<String, Object>> queryFenhongList();

	List<Map<String, Object>> queryGongxiangList();

	String queryGerenXiaofei(int userid);

	String queryZhituiXiaofei(String phone);

	String queryJiantuiXiaofei(String phone);

	
	/**abc成员中c的收入
	 * @param phone
	 * @param type 1 直推  2 间推
	 * @return
	 */
	String queryJiantuiShouru(String phone, int type);

	/**abc中b的收入
	 * @param phone
	 * @param type 1 直推 2 间推
	 * @return
	 */
	String queryZhituiShouru(String phone, int type);

	/**abc中b的收入
	 * @param phone
	 * @param type 1 直推 2 间推
	 * @return
	 */
	String queryGerenShouru(int userid, int type);

}