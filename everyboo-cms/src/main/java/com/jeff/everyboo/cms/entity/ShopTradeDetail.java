package com.jeff.everyboo.cms.entity;
// Generated 2018-11-9 10:43:37 by Hibernate Tools 4.3.5.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;

import java.math.BigDecimal;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * ShopTradeDetail generated by hbm2java
 */
@Entity
@Table(name = "shop_trade_detail", catalog = "everyboo")
public class ShopTradeDetail implements java.io.Serializable {

	private Integer id;
	@JsonIgnore
	private ShopTrade shopTrade;
	private int proId;
	private int count;
	private BigDecimal price;
	private BigDecimal duihuan;
	private int credits;
	private String proName;
	private String proLogoImg;

	public ShopTradeDetail() {
	}

	public ShopTradeDetail(ShopTrade shopTrade, int proId, int count, BigDecimal price, String proName, String proLogoImg,int credits) {
		this.shopTrade = shopTrade;
		this.proId = proId;
		this.count = count;
		this.price = price;
		this.proName = proName;
		this.proLogoImg = proLogoImg;
		this.credits = credits;
	}
	
	public ShopTradeDetail(Integer id, ShopTrade shopTrade, int proId, int count, BigDecimal price, BigDecimal duihuan,
			int credits, String proName, String proLogoImg) {
		super();
		this.id = id;
		this.shopTrade = shopTrade;
		this.proId = proId;
		this.count = count;
		this.price = price;
		this.duihuan = duihuan;
		this.credits = credits;
		this.proName = proName;
		this.proLogoImg = proLogoImg;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "trade_id")
	public ShopTrade getShopTrade() {
		return this.shopTrade;
	}

	public void setShopTrade(ShopTrade shopTrade) {
		this.shopTrade = shopTrade;
	}

	@Column(name = "pro_id", nullable = false)
	public int getProId() {
		return this.proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	@Column(name = "count", nullable = false)
	public int getCount() {
		return this.count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Column(name = "price", nullable = false)
	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	@Column(name = "pro_name", nullable = false, length = 64)
	public String getProName() {
		return this.proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	@Column(name = "pro_logo_img", nullable = false, length = 64)
	public String getProLogoImg() {
		return this.proLogoImg;
	}

	public void setProLogoImg(String proLogoImg) {
		this.proLogoImg = proLogoImg;
	}
	
	@Column(name = "credits")
	public int getCredits() {
		return this.credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	public BigDecimal getDuihuan() {
		return duihuan;
	}

	public void setDuihuan(BigDecimal duihuan) {
		this.duihuan = duihuan;
	}

	@Override
	public String toString() {
		return "ShopTradeDetail [id=" + id + ", proId=" + proId + ", count=" + count + ", price=" + price + ", duihuan="
				+ duihuan + ", credits=" + credits + ", proName=" + proName + ", proLogoImg=" + proLogoImg + "]";
	}


}
