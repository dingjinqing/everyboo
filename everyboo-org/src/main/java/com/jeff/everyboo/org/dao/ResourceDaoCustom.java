package com.jeff.everyboo.org.dao;

import java.util.List;
import java.util.Map;

import com.jeff.everyboo.org.entity.Resource;


public interface ResourceDaoCustom {

	public List<Resource> findMenuResource(Map<String, Object> params);
	
}
