/**
 * 
 */
package com.jeff.everyboo.common.util;

/**
 * @author Administrator
 *
 */
public enum TradeTypeEnum {
	v1(1,"购买商品"),
	v2(2,"复购产品"),
	v3(3,"一级销售奖"),
	v4(4,"间推"),
	v5(5,"加盟店奖励"),
	v6(6,"股份收益"),
	v7(7,"共享收益"),
	v8(8,"捐赠"),
	v9(9,"首次购买奖励"),
	v10(10,"一级销售奖"),
	v11(11,"二级销售奖"),
	v12(12,"提现健康值"),
	v13(13,"项目合作"),
	v14(14,"提现余额"),
	v15(15,"充值"),
	v16(16,"转账收入"),
	v17(17,"转账付款");

	private int level;	 
    private String desc;
    
    TradeTypeEnum(int level,String desc){
    	this.level=level;
    	this.desc=desc;
    }
	public int getLevel() {
		return level;
	}
	public String getDesc() {
		return desc;
	}
	
	public static TradeTypeEnum fromLevel(int level) {
        for (TradeTypeEnum type : TradeTypeEnum.values()) {
            if (type.getLevel()==level) {
                return type;
            }
        }
        return null;
    }

	public static String getDescByCode(int i) {
        return fromLevel(i).desc;
    }
	
	private static TradeTypeEnum[] vals = values();
	
	public TradeTypeEnum previous() {
        return vals[(this.ordinal() - 1) % vals.length];
    }

    public TradeTypeEnum next() {
        return vals[(this.ordinal() + 1) % vals.length];
    }

    
}
