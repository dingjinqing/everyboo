package com.jeff.everyboo.cms.dto;

import com.jeff.everyboo.common.dto.CommonQueryDTO;

/**
 * @author dingjinqing
 * @desc ShopProfitQueryDTO 
 * @date 2018-12-08
 */
public class ShopProfitQueryDTO extends CommonQueryDTO{
	private byte type;
	private String sdateStart;
	private String sdateEnd;

	public String getSdateStart() {
		return sdateStart;
	}

	public void setSdateStart(String sdateStart) {
		this.sdateStart = sdateStart;
	}

	public String getSdateEnd() {
		return sdateEnd;
	}

	public void setSdateEnd(String sdateEnd) {
		this.sdateEnd = sdateEnd;
	}

	public byte getType() {
		return type;
	}

	public void setType(byte type) {
		this.type = type;
	}
	
}