package com.jeff.everyboo.cms.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * ShopUser generated by hbm2java
 */
@Entity
@Table(name = "shop_user", catalog = "everyboo")
public class ShopUser implements java.io.Serializable {

	private Integer id;
	private String account;
	private String phone;
	private String password;
	private String refPhone;
	private String vipLevel;
	private String address;
	private Date createDate;
	private String createBy;
	private Date updateDate;
	private String updateBy;
	private String nickName;	
	private String jiaoyimima;
	private int status;//账号状态
	private int vipStatus;//会员状态
	private ShopUserExt shopUserExts;
	private String level;
	private String recivePhone;


	public ShopUser(Integer id, String account, String phone, String password, String refPhone, String vipLevel,
			String address, Date createDate, String createBy, Date updateDate, String updateBy, String nickName,
			String jiaoyimima, int status,int vipStatus) {
		super();
		this.id = id;
		this.account = account;
		this.phone = phone;
		this.password = password;
		this.refPhone = refPhone;
		this.vipLevel = vipLevel;
		this.address = address;
		this.createDate = createDate;
		this.createBy = createBy;
		this.updateDate = updateDate;
		this.updateBy = updateBy;
		this.nickName = nickName;
		this.jiaoyimima = jiaoyimima;
		this.status = status;
		this.vipStatus = vipStatus;

	}

	public ShopUser() {
	}

	public ShopUser(String phone, String password) {
		this.phone = phone;
		this.password = password;
	}

	public ShopUser(Integer id, String account, String phone, String password, String refPhone, String vipLevel,
			String address, Date createDate, String createBy, Date updateDate, String updateBy, String nickName,
			String jiaoyimima, int status, int vipStatus, ShopUserExt shopUserExts, String level) {
		super();
		this.id = id;
		this.account = account;
		this.phone = phone;
		this.password = password;
		this.refPhone = refPhone;
		this.vipLevel = vipLevel;
		this.address = address;
		this.createDate = createDate;
		this.createBy = createBy;
		this.updateDate = updateDate;
		this.updateBy = updateBy;
		this.nickName = nickName;
		this.jiaoyimima = jiaoyimima;
		this.status = status;
		this.vipStatus = vipStatus;
		this.shopUserExts = shopUserExts;
		this.level = level;
	}
	
	public ShopUser(Integer id, String account, String phone, String password, String refPhone, String vipLevel,
			String address, Date createDate, String createBy, Date updateDate, String updateBy, String nickName,
			String jiaoyimima, int status, int vipStatus, ShopUserExt shopUserExts, String level, String recivePhone) {
		super();
		this.id = id;
		this.account = account;
		this.phone = phone;
		this.password = password;
		this.refPhone = refPhone;
		this.vipLevel = vipLevel;
		this.address = address;
		this.createDate = createDate;
		this.createBy = createBy;
		this.updateDate = updateDate;
		this.updateBy = updateBy;
		this.nickName = nickName;
		this.jiaoyimima = jiaoyimima;
		this.status = status;
		this.vipStatus = vipStatus;
		this.shopUserExts = shopUserExts;
		this.level = level;
		this.recivePhone = recivePhone;
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

	@Column(name = "account", length = 20)
	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "phone", nullable = false, length = 12)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "password", nullable = false)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "ref_phone", length = 20)
	public String getRefPhone() {
		return this.refPhone;
	}

	public void setRefPhone(String refPhone) {
		this.refPhone = refPhone;
	}

	@Column(name = "vip_level", length = 2)
	public String getVipLevel() {
		return this.vipLevel;
	}

	public void setVipLevel(String vipLevel) {
		this.vipLevel = vipLevel;
	}

	@Column(name = "address", length = 100)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	@Column(name = "update_by", length = 20)
	public String getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "shopUser",cascade = {CascadeType.MERGE,CascadeType.REFRESH})
	public ShopUserExt getShopUserExts() {
		return this.shopUserExts;
	}

	public void setShopUserExts(ShopUserExt shopUserExts) {
		this.shopUserExts = shopUserExts;
	}

	@Column(name = "status")
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	@Column(name = "nick_name")
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	@Column(name = "jiaoyimima")
	public String getJiaoyimima() {
		return jiaoyimima;
	}

	public void setJiaoyimima(String jiaoyimima) {
		this.jiaoyimima = jiaoyimima;
	}
	
	@Column(name = "vip_status")
	public int getVipStatus() {
		return vipStatus;
	}

	public void setVipStatus(int vipStatus) {
		this.vipStatus = vipStatus;
	}
	
	@Column(name = "level")
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@Column(name = "recive_phone", length = 12)
	public String getRecivePhone() {
		return recivePhone;
	}

	public void setRecivePhone(String recivePhone) {
		this.recivePhone = recivePhone;
	}

	@Override
	public String toString() {
		return "ShopUser [id=" + id + ", account=" + account + ", phone=" + phone + ", password=" + password
				+ ", refPhone=" + refPhone + ", vipLevel=" + vipLevel + ", address=" + address + ", createDate="
				+ createDate + ", createBy=" + createBy + ", updateDate=" + updateDate + ", updateBy=" + updateBy
				+ ", nickName=" + nickName + ", jiaoyimima=" + jiaoyimima + ", status=" + status + ", vipStatus="
				+ vipStatus + ", level=" + level + ", recivePhone=" + recivePhone + "]";
	}
	
}
