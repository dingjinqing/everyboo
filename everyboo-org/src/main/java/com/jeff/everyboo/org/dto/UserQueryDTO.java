package com.jeff.everyboo.org.dto;
import com.jeff.everyboo.common.dto.CommonQueryDTO;
/**
 * 后台用户查询信息封装
 * @author dingjinqing@163.com
 * @since 2016-01-20
 */
public class UserQueryDTO extends CommonQueryDTO{
	
	//账号
	private String userName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
