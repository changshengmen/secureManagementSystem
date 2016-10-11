package net.jeeshop.services.common;

import java.io.Serializable;

import net.jeeshop.core.dao.QueryModel;
import net.jeeshop.core.dao.page.PagerModel;

/**
 * 订单对象
 * @author jqsl2012@163.com
 *
 */
public class SecureOrder extends QueryModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String product_id;
	private String customer_id;
	private String insuredCurrency; //保额币种
	private Double sumInsured;
	private String feeCurrency; //保费币种
	private Double sumFee;
	private String premiums;
	private String purchase_time;
	private String valid_time;
	private String expire_time;
	private String payStatus;
	private String remark;
	private String isExpire;
	private String createAccount;
	private Integer expire_days;
	
	public String getCreateAccount() {
		return createAccount;
	}
	public void setCreateAccount(String createAccount) {
		this.createAccount = createAccount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	
	public Double getSumInsured() {
		return sumInsured;
	}
	public void setSumInsured(Double sumInsured) {
		this.sumInsured = sumInsured;
	}
	public String getInsuredCurrency() {
		return insuredCurrency;
	}
	public void setInsuredCurrency(String insuredCurrency) {
		this.insuredCurrency = insuredCurrency;
	}
	public Double getSumFee() {
		return sumFee;
	}
	public void setSumFee(Double sumFee) {
		this.sumFee = sumFee;
	}
	public String getFeeCurrency() {
		return feeCurrency;
	}
	public void setFeeCurrency(String feeCurrency) {
		this.feeCurrency = feeCurrency;
	}
	public String getPremiums() {
		return premiums;
	}
	public void setPremiums(String premiums) {
		this.premiums = premiums;
	}
	public String getPurchase_time() {
		return purchase_time;
	}
	public void setPurchase_time(String purchase_time) {
		this.purchase_time = purchase_time;
	}
	public String getValid_time() {
		return valid_time;
	}
	public void setValid_time(String valid_time) {
		this.valid_time = valid_time;
	}
	public String getExpire_time() {
		return expire_time;
	}
	public void setExpire_time(String expire_time) {
		this.expire_time = expire_time;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getExpire_days() {
		return expire_days;
	}
	public void setExpire_days(Integer expire_days) {
		this.expire_days = expire_days;
	}

}
