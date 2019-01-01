package com.jeff.everyboo.org.dao;


import org.springframework.data.jpa.repository.Query;

import com.jeff.everyboo.common.dao.CommonDao;
import com.jeff.everyboo.org.entity.Role;

public interface RoleDao extends RoleCustomDao,CommonDao<Role,String>{

	@Query("from Role r where r.roleName = ?1 ")
	public Role findByRoleName(String roleName);
	
}
