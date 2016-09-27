package net.jeeshop.services.manage.customer.bean;

import java.io.Serializable;

public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;	
	private String id;// 编号	
	private int insurance_unit;// 投保单位名称
	private String ID_type;// 证件类型	
	private String ID_num;//证件号
	private String contacts_tel;//联系电话
	private String contacts;//联系人
	private String address;//通讯地址
	private String postCode;//邮编号码
	private String enterprise_type;//企业类型
	private String business_type;// 营业类型
	private String industry_type;//行业类型
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getInsurance_unit() {
		return insurance_unit;
	}
	public void setInsurance_unit(int insurance_unit) {
		this.insurance_unit = insurance_unit;
	}
	public String getID_type() {
		return ID_type;
	}
	public void setID_type(String iD_type) {
		ID_type = iD_type;
	}
	public String getID_num() {
		return ID_num;
	}
	public void setID_num(String iD_num) {
		ID_num = iD_num;
	}
	public String getContacts_tel() {
		return contacts_tel;
	}
	public void setContacts_tel(String contacts_tel) {
		this.contacts_tel = contacts_tel;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getEnterprise_type() {
		return enterprise_type;
	}
	public void setEnterprise_type(String enterprise_type) {
		this.enterprise_type = enterprise_type;
	}
	public String getBusiness_type() {
		return business_type;
	}
	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}
	public String getIndustry_type() {
		return industry_type;
	}
	public void setIndustry_type(String industry_type) {
		this.industry_type = industry_type;
	}
	

}