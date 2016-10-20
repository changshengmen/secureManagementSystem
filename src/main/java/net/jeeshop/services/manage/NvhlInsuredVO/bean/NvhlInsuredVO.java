package net.jeeshop.services.manage.NvhlInsuredVO.bean;

import java.io.Serializable;

import net.jeeshop.core.dao.QueryModel;

public class NvhlInsuredVO  extends QueryModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String InsuredCde;// 被保人编码
	private int InsuredNme;// 被保人名称
	private String B_ClntMrk;// 被保人性质
	private String B_CCertfCls;// 证件类型
	private String B_CCertfCde;// 证件号码
	private String B_ClntAddr;// 通讯地址
	private String B_ZipCde;// 邮编
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
	public String getInsuredCde() {
		return InsuredCde;
	}
	public void setInsuredCde(String insuredCde) {
		InsuredCde = insuredCde;
	}
	public int getInsuredNme() {
		return InsuredNme;
	}
	public void setInsuredNme(int insuredNme) {
		InsuredNme = insuredNme;
	}
	
	public String getB_ClntMrk() {
		return B_ClntMrk;
	}
	public void setB_ClntMrk(String b_ClntMrk) {
		B_ClntMrk = b_ClntMrk;
	}
	public String getB_CCertfCls() {
		return B_CCertfCls;
	}
	public void setB_CCertfCls(String b_CCertfCls) {
		B_CCertfCls = b_CCertfCls;
	}
	public String getB_CCertfCde() {
		return B_CCertfCde;
	}
	public void setB_CCertfCde(String b_CCertfCde) {
		B_CCertfCde = b_CCertfCde;
	}
	public String getB_ClntAddr() {
		return B_ClntAddr;
	}
	public void setB_ClntAddr(String b_ClntAddr) {
		B_ClntAddr = b_ClntAddr;
	}
	public String getB_ZipCde() {
		return B_ZipCde;
	}
	public void setB_ZipCde(String b_ZipCde) {
		B_ZipCde = b_ZipCde;
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