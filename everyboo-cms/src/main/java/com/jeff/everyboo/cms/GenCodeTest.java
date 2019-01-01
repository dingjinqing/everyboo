package com.jeff.everyboo.cms;

import java.io.IOException;

import com.jeff.everyboo.cms.entity.Article;
import com.jeff.everyboo.cms.entity.ShopBillTrade;
import com.jeff.everyboo.cms.entity.ShopProduct;
import com.jeff.everyboo.cms.entity.ShopProfit;
import com.jeff.everyboo.cms.entity.ShopRegisterRule;
import com.jeff.everyboo.cms.entity.ShopSysParam;
import com.jeff.everyboo.cms.entity.ShopTrade;
import com.jeff.everyboo.cms.entity.ShopTradeDetail;
import com.jeff.everyboo.cms.entity.ShopTradeRule;
import com.jeff.everyboo.cms.entity.ShopUser;
import com.jeff.everyboo.cms.entity.ShopUserExt;
import com.jeff.everyboo.common.util.GenCodeUtil;

public class GenCodeTest {
	
	public static void main(String[] args) throws IOException{
		//基本包目录（不用到entity那一层级）
		String s = "com.jeff.everyboo.cms";
		//作者
		String writer = "dingjinqing";
		//Demo为Entity类（放上自己新增的实体类即可）
//		GenCodeTest.autoGenAllCode(ColumnInfo.class,s,writer);
//		GenCodeTest.autoGenAllCode(ShopBillTrade.class,s,writer);
//		GenCodeTest.autoGenAllCode(ShopProduct.class,s,writer);
//		GenCodeTest.autoGenAllCode(ShopRegisterRule.class,s,writer);
//		GenCodeTest.autoGenAllCode(ShopTrade.class,s,writer);
//		GenCodeTest.autoGenAllCode(ShopTradeDetail.class,s,writer);
//		GenCodeTest.autoGenAllCode(ShopUser.class,s,writer);
//		GenCodeTest.autoGenAllCode(ShopUserExt.class,s,writer);
		GenCodeTest.autoGenAllCode(ShopProfit.class,s,writer);
	}
	
	/**
	 * 组装所有生成类
	 * @param c
	 * @param commonPackage
	 * @param writer
	 * @throws IOException
	 */
	public static void autoGenAllCode(Class c,String commonPackage,String writer) throws IOException{
		GenCodeUtil.createQueryDTO(c, commonPackage, writer);
//		GenCodeUtil.createFrontQueryDTO(c, commonPackage, writer);
		GenCodeUtil.createDaoCustomInterface(c,commonPackage,writer);
		GenCodeUtil.createDaoInterface(c,commonPackage,writer);
		GenCodeUtil.createDaoClass(c,commonPackage,writer);
		GenCodeUtil.createServiceClass(c,commonPackage,writer);
//		GenCodeUtil.createControllerClass(c, commonPackage, "com.jeff.everyboo.cms", "dingjinqing", true);
	}

}
