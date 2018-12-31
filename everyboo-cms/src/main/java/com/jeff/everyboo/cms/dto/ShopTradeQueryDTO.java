package com.jeff.everyboo.cms.dto;

import java.util.List;

import com.jeff.everyboo.common.dto.CommonQueryDTO;

/**
 * @author dingjinqing
 * @desc ShopTradeQueryDTO 
 * @date 2018-11-06
 */
public class ShopTradeQueryDTO extends CommonQueryDTO{
	private int jtype;
	private int status;
	private int userId;
	//是否前端查询
	private Boolean isFront;
//	private List<Integer> types;
	private List<Integer> types;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getJtype() {
		return jtype;
	}
	public void setJtype(int jtype) {
		this.jtype = jtype;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Boolean getIsFront() {
		return isFront;
	}
	public void setIsFront(Boolean isFront) {
		this.isFront = isFront;
	}
	public List<Integer> getTypes() {
		return types;
	}
	public void setTypes(List<Integer> types) {
		this.types = types;
	}

}