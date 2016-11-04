package net.jeeshop.services.manage.NvhlInsuredVO.bean;

import java.io.Serializable;

import net.jeeshop.core.dao.QueryModel;

public class NvhlInsuredVO  extends QueryModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String InsuredCde;// 被保人编码	
	private String InsuredNme;// 被保人名称
	private String ClntMrk;// 被保人性质
	private String CCertfCls;// 证件类型
	private String CCertfCde;// 证件号码
	private String ClntAddr;// 通讯地址
	private String ZipCde;// 邮编
	private String CEmail;// Email
	private String Mobile;// 移动电话	
	private String Country;// 国籍
	private String Province;// 省
	private String City;// 市
	private String Area;// 区
	private String Stree;// 街道
	private String CustRiskRank;// 客户反洗钱风险等级
	private String CusRiskLvl;// 客户风险等级
	private String ProfessBig;// 职业大类
	private String ProfessIn;// 职业中类
	private String COccupCde;// 职业子类
	private String CDuty;// 职业类别
	//(用于显示)
	private String insuredCdePlay;// 被保人编码	
	private String insuredNmePlay;// 被保人编码
	private String createAccount;//创建者
	private String createtime;// 录入时间
	private String updateAccount;//更新者
	private String updatetime;//更新时间
	
	public String getCreateAccount() {
		return createAccount;
	}
	public void setCreateAccount(String createAccount) {
		this.createAccount = createAccount;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getUpdateAccount() {
		return updateAccount;
	}
	public void setUpdateAccount(String updateAccount) {
		this.updateAccount = updateAccount;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	public String getInsuredNmePlay() {
		return insuredNmePlay;
	}
	public void setInsuredNmePlay(String insuredNmePlay) {
		this.insuredNmePlay = insuredNmePlay;
	}
	public String getInsuredCde() {
		return InsuredCde;
	}
	public void setInsuredCde(String insuredCde) {
		InsuredCde = insuredCde;
	}
	
	
	public String getInsuredCdePlay() {
		return insuredCdePlay;
	}
	public void setInsuredCdePlay(String insuredCdePlay) {
		this.insuredCdePlay = insuredCdePlay;
	}
	public String getInsuredNme() {
		return InsuredNme;
	}
	public void setInsuredNme(String insuredNme) {
		InsuredNme = insuredNme;
	}
	public String getClntMrk() {
		return ClntMrk;
	}
	public void setClntMrk(String clntMrk) {
		ClntMrk = clntMrk;
	}
	public String getCCertfCls() {
		return CCertfCls;
	}
	public void setCCertfCls(String cCertfCls) {
		CCertfCls = cCertfCls;
	}
	public String getCCertfCde() {
		return CCertfCde;
	}
	public void setCCertfCde(String cCertfCde) {
		CCertfCde = cCertfCde;
	}
	public String getClntAddr() {
		return ClntAddr;
	}
	public void setClntAddr(String clntAddr) {
		ClntAddr = clntAddr;
	}
	public String getZipCde() {
		return ZipCde;
	}
	public void setZipCde(String zipCde) {
		ZipCde = zipCde;
	}
	public String getCEmail() {
		return CEmail;
	}
	public void setCEmail(String cEmail) {
		CEmail = cEmail;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getProvince() {
		return Province;
	}
	public void setProvince(String province) {
		Province = province;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getArea() {
		return Area;
	}
	public void setArea(String area) {
		Area = area;
	}
	public String getStree() {
		return Stree;
	}
	public void setStree(String stree) {
		Stree = stree;
	}
	public String getCustRiskRank() {
		return CustRiskRank;
	}
	public void setCustRiskRank(String custRiskRank) {
		CustRiskRank = custRiskRank;
	}
	public String getCusRiskLvl() {
		return CusRiskLvl;
	}
	public void setCusRiskLvl(String cusRiskLvl) {
		CusRiskLvl = cusRiskLvl;
	}
	public String getProfessBig() {
		return ProfessBig;
	}
	public void setProfessBig(String professBig) {
		ProfessBig = professBig;
	}
	public String getProfessIn() {
		return ProfessIn;
	}
	public void setProfessIn(String professIn) {
		ProfessIn = professIn;
	}
	public String getCOccupCde() {
		return COccupCde;
	}
	public void setCOccupCde(String cOccupCde) {
		COccupCde = cOccupCde;
	}
	public String getCDuty() {
		return CDuty;
	}
	public void setCDuty(String cDuty) {
		CDuty = cDuty;
	}
	

}