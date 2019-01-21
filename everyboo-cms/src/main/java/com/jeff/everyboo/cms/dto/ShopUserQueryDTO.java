package com.jeff.everyboo.cms.dto;

import java.util.Date;

import com.jeff.everyboo.common.dto.CommonQueryDTO;

/**
 * @author dingjinqing
 * @desc ShopUserQueryDTO 
 * @date 2018-11-06
 */
public class ShopUserQueryDTO extends CommonQueryDTO{
	//是否前端查询
	private Boolean isFront;
	private String account;
	private String phone;
	private String vipLevel;
	private String password;
	private int status;
	private int userId;
	private Date startTime;
	private Date endTime;
	private String level;
	
	public String getVipLevel() {
		return vipLevel;
	}
	public void setVipLevel(String vipLevel) {
		this.vipLevel = vipLevel;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getIsFront() {
		return isFront;
	}
	public void setIsFront(Boolean isFront) {
		this.isFront = isFront;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}

}