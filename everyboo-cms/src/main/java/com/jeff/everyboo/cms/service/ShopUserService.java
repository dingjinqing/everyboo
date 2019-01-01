package com.jeff.everyboo.cms.service;

import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.cms.dao.ShopUserDao;
import com.jeff.everyboo.cms.dto.ShopUserQueryDTO;
import com.jeff.everyboo.common.service.CommonService;
import com.jeff.everyboo.common.entity.PageModel;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author dingjinqing
 * @desc ShopUserService类 
 * @date 2018-11-06
 */
@Service
public class ShopUserService extends CommonService< ShopUser,Integer >  {

    @Autowired
    private ShopUserDao shopUserDao;

    @Autowired
    public void setShopUserDao(ShopUserDao shopUserDao){
      super.setCommonDao(shopUserDao);
    }

    public PageModel<ShopUser> queryShopUserPage(ShopUserQueryDTO shopUserQueryDTO){
           return this.shopUserDao.queryShopUserPage(shopUserQueryDTO);
    }

    public List<ShopUser> queryShopUserList(ShopUserQueryDTO shopUserQueryDTO){
           return this.shopUserDao.queryShopUserList(shopUserQueryDTO);
    }

	public void updateStatus(String id, int status) {
		// TODO Auto-generated method stub
		
		ShopUser user = this.find(Integer.parseInt(id));
		user.setStatus(status);
		this.update(user);
	
	}
	
    /**通过phone获取我的团队直推成员
     * @param phone
     * @return
     */
    public List<Map<String, Object>> queryUser2List(String phone){
    	return shopUserDao.queryUser2List(phone);
    }
    
    /**通过phone获取我的团队间推成员
     * @param phone
     * @return
     */
    public List<Map<String, Object>> queryUser3List(String phone){
    	return shopUserDao.queryUser3List(phone);
    }

	/**获取我的收入汇总
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> queryIncomeList(String userId) {
		// TODO Auto-generated method stub
		return shopUserDao.queryIncomeList(userId);
	}
	/**获取平台收支汇总
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> queryIncomeList(ShopUserQueryDTO shopUserQueryDTO) {
		// TODO Auto-generated method stub
		return shopUserDao.queryIncomeList(shopUserQueryDTO);
	}

}