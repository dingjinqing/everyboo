package com.jeff.everyboo.cms.dto;

import com.jeff.everyboo.common.dto.CommonQueryDTO;

/**
 * @author dingjinqing
 * @desc ShopProductQueryDTO 
 * @date 2018-11-06
 */
public class ShopProductQueryDTO extends CommonQueryDTO{
	private String proName;
	private String status;
	private String type;
	private Byte hot;  //1 爆款商品
	private String vipLevel;
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getVipLevel() {
		return vipLevel;
	}
	public void setVipLevel(String vipLevel) {
		this.vipLevel = vipLevel;
	}
	public Byte getHot() {
		return hot;
	}
	public void setHot(Byte hot) {
		this.hot = hot;
	}
}