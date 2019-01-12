package com.jeff.everyboo.cms.entity;
// Generated 2018-11-9 10:43:37 by Hibernate Tools 4.3.5.Final

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ShopTrade generated by hbm2java
 */
@Entity
@Table(name = "shop_trade", catalog = "everyboo")
public class ShopTrade implements java.io.Serializable {

	private Integer id;
	private String tradeNo;
	private int userId;
	private int jtype;
	private BigDecimal duihuan;
	private BigDecimal price;
	private int status;
	private int credits;
	private String remark;
	private Date createDate;
	private String createBy;
	private Date updateDate;
	private Set<ShopTradeDetail> shopTradeDetails = new HashSet<ShopTradeDetail>(0);

	public ShopTrade() {
	}

	public ShopTrade(Integer id, String tradeNo, int userId, int jtype, BigDecimal duihuan, BigDecimal price,
			int status, int credits, String remark, Date createDate, String createBy, Date updateDate,
			Set<ShopTradeDetail> shopTradeDetails) {
		super();
		this.id = id;
		this.tradeNo = tradeNo;
		this.userId = userId;
		this.jtype = jtype;
		this.duihuan = duihuan;
		this.price = price;
		this.status = status;
		this.credits = credits;
		this.remark = remark;
		this.createDate = createDate;
		this.createBy = createBy;
		this.updateDate = updateDate;
		this.shopTradeDetails = shopTradeDetails;
	}

	public ShopTrade(Integer id, String tradeNo, int userId, int jtype, BigDecimal duihuan, BigDecimal price,
			int status, int credits, String remark, Date createDate, String createBy, Date updateDate) {
		super();
		this.id = id;
		this.tradeNo = tradeNo;
		this.userId = userId;
		this.jtype = jtype;
		this.duihuan = duihuan;
		this.price = price;
		this.status = status;
		this.credits = credits;
		this.remark = remark;
		this.createDate = createDate;
		this.createBy = createBy;
		this.updateDate = updateDate;
	}
	public ShopTrade(Integer id, String tradeNo, int userId, int jtype, BigDecimal duihuan, BigDecimal price,
			int status, int credits,  Date createDate) {
		super();
		this.id = id;
		this.tradeNo = tradeNo;
		this.userId = userId;
		this.jtype = jtype;
		this.duihuan = duihuan;
		this.price = price;
		this.status = status;
		this.credits = credits;
		this.createDate = createDate;
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

	@Column(name = "trade_no", nullable = false, length = 32)
	public String getTradeNo() {
		return this.tradeNo;
	}

	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}

	@Column(name = "user_id", nullable = false)
	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(name = "type", nullable = false)
	public int getJtype() {
		return this.jtype;
	}

	public void setJtype(int type) {
		this.jtype = type;
	}

	@Column(name = "price", nullable = false)
	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	@Column(name = "status")
	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Column(name = "credits")
	public int getCredits() {
		return this.credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "create_by", length = 20)
	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date", length = 19)
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "shopTrade",cascade = {CascadeType.MERGE,CascadeType.REFRESH})
	public Set<ShopTradeDetail> getShopTradeDetails() {
		return this.shopTradeDetails;
	}

	public void setShopTradeDetails(Set<ShopTradeDetail> shopTradeDetails) {
		this.shopTradeDetails = shopTradeDetails;
	}
	
	@Column(name = "remark", length = 512)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Column(name = "duihuan", length = 12)
	public BigDecimal getDuihuan() {
		return duihuan;
	}

	public void setDuihuan(BigDecimal duihuan) {
		this.duihuan = duihuan;
	}

}
