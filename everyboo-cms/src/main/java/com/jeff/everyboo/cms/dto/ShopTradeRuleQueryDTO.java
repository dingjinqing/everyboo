package com.jeff.everyboo.cms.dto;

import com.jeff.everyboo.common.dto.CommonQueryDTO;

/**
 * @author dingjinqing
 * @desc ShopTradeRuleQueryDTO 
 * @date 2018-12-02
 */
public class ShopTradeRuleQueryDTO extends CommonQueryDTO{
	private Integer proId;
	private String vipLevel;
	public Integer getProId() {
		return proId;
	}
	public void setProId(Integer proId) {
		this.proId = proId;
	}
	public String getVipLevel() {
		return vipLevel;
	}
	public void setVipLevel(String vipLevel) {
		this.vipLevel = vipLevel;
	}
}