package net.jeeshop.services.manage.NvhlInsuredVO.bean;

import java.io.Serializable;

import net.jeeshop.core.dao.QueryModel;

public class NvhlInsuredVO  extends QueryModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String insuredCde;// 被保人编码	
	private String insuredNme;// 被保人名称
	private String clntMrk;// 被保人性质
	private String ccertfCls;// 证件类型
	private String ccertfCde;// 证件号码
	private String clntAddr;// 通讯地址
	private String zipCde;// 邮编
	private String cemail;// Email
	private String mobile;// 移动电话	
	private String country;// 国籍
//	private String Province;// 省
//	private String City;// 市
//	private String Area;// 区
//	private String Stree;// 街道
	private String custRiskRank;// 客户反洗钱风险等级
	private String cusRiskLvl;// 客户风险等级
//	private String ProfessBig;// 职业大类
//	private String ProfessIn;// 职业中类
//	private String COccupCde;// 职业子类
//	private String CDuty;// 职业类别
	//(用于显示)
//	private String insuredCdePlay;// 被保人编码	
//	private String insuredNmePlay;// 被保人编码
	private String createAccount;//创建者
	private String createtime;// 录入时间
	private String updateAccount;//更新者
	private String updatetime;//更新时间
	public String getInsuredCde()
	{
		return insuredCde;
	}
	public String getInsuredNme()
	{
		return insuredNme;
	}
	public String getClntMrk()
	{
		return clntMrk;
	}
	public String getCcertfCls()
	{
		return ccertfCls;
	}
	public String getCcertfCde()
	{
		return ccertfCde;
	}
	public String getClntAddr()
	{
		return clntAddr;
	}
	public String getZipCde()
	{
		return zipCde;
	}
	public String getCemail()
	{
		return cemail;
	}
	public String getMobile()
	{
		return mobile;
	}
	public String getCountry()
	{
		return country;
	}
	public String getCustRiskRank()
	{
		return custRiskRank;
	}
	public String getCusRiskLvl()
	{
		return cusRiskLvl;
	}
	public String getCreateAccount()
	{
		return createAccount;
	}
	public String getCreatetime()
	{
		return createtime;
	}
	public String getUpdateAccount()
	{
		return updateAccount;
	}
	public String getUpdatetime()
	{
		return updatetime;
	}
	public void setInsuredCde(String insuredCde)
	{
		this.insuredCde = insuredCde;
	}
	public void setInsuredNme(String insuredNme)
	{
		this.insuredNme = insuredNme;
	}
	public void setClntMrk(String clntMrk)
	{
		this.clntMrk = clntMrk;
	}
	public void setCcertfCls(String ccertfCls)
	{
		this.ccertfCls = ccertfCls;
	}
	public void setCcertfCde(String ccertfCde)
	{
		this.ccertfCde = ccertfCde;
	}
	public void setClntAddr(String clntAddr)
	{
		this.clntAddr = clntAddr;
	}
	public void setZipCde(String zipCde)
	{
		this.zipCde = zipCde;
	}
	public void setCemail(String cemail)
	{
		this.cemail = cemail;
	}
	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}
	public void setCountry(String country)
	{
		this.country = country;
	}
	public void setCustRiskRank(String custRiskRank)
	{
		this.custRiskRank = custRiskRank;
	}
	public void setCusRiskLvl(String cusRiskLvl)
	{
		this.cusRiskLvl = cusRiskLvl;
	}
	public void setCreateAccount(String createAccount)
	{
		this.createAccount = createAccount;
	}
	public void setCreatetime(String createtime)
	{
		this.createtime = createtime;
	}
	public void setUpdateAccount(String updateAccount)
	{
		this.updateAccount = updateAccount;
	}
	public void setUpdatetime(String updatetime)
	{
		this.updatetime = updatetime;
	}	
}