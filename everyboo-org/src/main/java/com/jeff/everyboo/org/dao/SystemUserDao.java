package com.jeff.everyboo.org.dao;


import java.util.List;
import java.util.Map;

import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.org.dto.UserQueryDTO;
import com.jeff.everyboo.org.entity.User;

public interface SystemUserDao {
	
	public List<User> findUsers(Map<String, Object> params);
	
	/**
	 * 根据用户信息查询分页信息
	 * @param userQueryDTO
	 * @return
	 */
	PageModel<User> queryUserPage(UserQueryDTO userQueryDTO);
	
}
