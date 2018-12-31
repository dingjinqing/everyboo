package com.jeff.everyboo.cms.dto;

import com.jeff.everyboo.common.dto.CommonQueryDTO;

/**
 * @author dingjinqing
 * @desc ShopRegisterRuleQueryDTO 
 * @date 2018-11-06
 */
public class ShopRegisterRuleQueryDTO extends CommonQueryDTO{
	
	private String vipLevel;

	public String getVipLevel() {
		return vipLevel;
	}

	public void setVipLevel(String vipLevel) {
		this.vipLevel = vipLevel;
	}

}