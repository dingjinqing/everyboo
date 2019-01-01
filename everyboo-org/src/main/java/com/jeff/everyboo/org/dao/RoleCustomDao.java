package com.jeff.everyboo.org.dao;

import java.util.List;
import java.util.Map;

import com.jeff.everyboo.common.entity.PageModel;
import com.jeff.everyboo.org.dto.RoleQueryDTO;
import com.jeff.everyboo.org.entity.Role;

public interface RoleCustomDao {
	
	public List<Role> findRoles(Map<String, Object> params);
	
	/**
	 * 根据查询条件查询角色分页信息
	 * @param userQueryDTO
	 * @return
	 */
	PageModel<Role> queryRolePage(RoleQueryDTO roleQueryDTO);
	
}
