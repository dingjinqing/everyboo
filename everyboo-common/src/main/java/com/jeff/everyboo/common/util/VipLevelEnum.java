/**
 * 
 */
package com.jeff.everyboo.common.util;

/**
 * @author Administrator
 *
 */
public enum VipLevelEnum {
	v0("v0","普通会员"),
	v1("v1","个人vip"),
	v2("v2","初级代理"),
	v3("v3","中级代理"),
	v4("v4","高级代理"),
	v5("v5","核心代理"),
	v6("v6","运营中心"),
	v7("v7","公司合伙人");

	private String level;	 
    private String desc;
    
    VipLevelEnum(String level,String desc){
    	this.level=level;
    	this.desc=desc;
    }
	public String getLevel() {
		return level;
	}
	public String getDesc() {
		return desc;
	}
	
	public static VipLevelEnum fromLevel(String level) {
        for (VipLevelEnum type : VipLevelEnum.values()) {
            if (type.getLevel().equals(level)) {
                return type;
            }
        }
        return null;
    }

	public static String getDescByCode(String level) {
        return fromLevel(level).desc;
    }
	
	private static VipLevelEnum[] vals = values();
	
	public VipLevelEnum previous() {
        return vals[(this.ordinal() - 1) % vals.length];
    }

    public VipLevelEnum next() {
        return vals[(this.ordinal() + 1) % vals.length];
    }

    
}
