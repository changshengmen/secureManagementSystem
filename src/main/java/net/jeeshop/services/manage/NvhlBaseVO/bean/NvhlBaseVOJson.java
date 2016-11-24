package net.jeeshop.services.manage.NvhlBaseVO.bean;

public class NvhlBaseVOJson
{ 
	private String SerialNumber;//流水号
	private String CAppNo;//投保单号
	private String CDptCde;//机构代码
	private String SysRes;//系统来源
	private String CProdName;//险种名称
	
	private String CBsnsTyp;//业务来源   19002代理业务
	private String CChaType;//渠道中级分类  1900201 专业代理
	private String CChaSubtype;//渠道子类  1900201001  专业代理
	//null
	private String COprCde;//录单人
	private String CSlsId;//业务员员工号
	private String CBrkSlsCde;//代理业务员
	private String CBrkSlsNme;//代理业务员名称
	private String CCertfNo;//代理业务职业证号
	private String CBrkrCde;//代理(经纪)人
	private String CAgtAgrNo;//代理(合作)协议
	//null
	private String CDisptSttlCde;//争议处理 
	private String AgriMak;//涉农标志
	private String CWaterMark;//是否涉海|涉水 
	
	private String FinTyp;//缴费方式 1刷卡 2支票 5 转账 默认5
	
	private String CProdNo;//产品代码（险种）  010001 财产基本险
	private String CCiMrk;//共保业务 0 非共保
	private String AppCde;//投保人编码		
	private String InsuredCde;//被保人编码	
	private String appnme;//投保人名称
	private String insurednme;//被保人名称
	
	private String NAmtRmbExch;//保额币种  01 RMB
	private String NAmt;//保额合计
	private String NPrmRmbExch;//保费币种   01 RMB
	private String NPrm;//保费合计
	
	private String TAppTm;//投保日期
	private String TInsrncBgnTm;//保险起期
	private String TInsrncEndTm;//保险止期
	
	private String CGrpMrk;//团单标志 0 个单   1团单
	private String EfcManualFlag;//是否转人工 Y转 N不转
	private String CPlyTyp;//保单形式  1电子保单   2监制保单
	private String CNeedfeeFlag;//是否规定见费出单标志   1见  2不见
	//null
	private String ICopyNum;//份数  
	
	private String deleteFlag;
	private String createAccount;
	private String username;
	private String updateAccount;
	private String createTime;
	private String updateTime;
	private String expire_days;//超期日期
	private String status ;//订单状态

	private String TInsrncEndTmStartDate;//到期日期
	private String TInsrncEndTmEndDate;//到期日期
	
	private String appCdePlay;//投保人编码页面显示用
	private String insuredCdePlay;//被保人编码页面显示用
	public String getSerialNumber()
	{
		return SerialNumber;
	}
	public String getCAppNo()
	{
		return CAppNo;
	}
	public String getCDptCde()
	{
		return CDptCde;
	}
	public String getSysRes()
	{
		return SysRes;
	}
	public String getCProdName()
	{
		return CProdName;
	}
	public String getCBsnsTyp()
	{
		return CBsnsTyp;
	}
	public String getCChaType()
	{
		return CChaType;
	}
	public String getCChaSubtype()
	{
		return CChaSubtype;
	}
	public String getCOprCde()
	{
		return COprCde;
	}
	public String getCSlsId()
	{
		return CSlsId;
	}
	public String getCBrkSlsCde()
	{
		return CBrkSlsCde;
	}
	public String getCBrkSlsNme()
	{
		return CBrkSlsNme;
	}
	public String getCCertfNo()
	{
		return CCertfNo;
	}
	public String getCBrkrCde()
	{
		return CBrkrCde;
	}
	public String getCAgtAgrNo()
	{
		return CAgtAgrNo;
	}
	public String getCDisptSttlCde()
	{
		return CDisptSttlCde;
	}
	public String getAgriMak()
	{
		return AgriMak;
	}
	public String getCWaterMark()
	{
		return CWaterMark;
	}
	public String getFinTyp()
	{
		return FinTyp;
	}
	public String getCProdNo()
	{
		return CProdNo;
	}
	public String getCCiMrk()
	{
		return CCiMrk;
	}
	public String getAppCde()
	{
		return AppCde;
	}
	public String getInsuredCde()
	{
		return InsuredCde;
	}
	public String getAppnme()
	{
		return appnme;
	}
	public String getInsurednme()
	{
		return insurednme;
	}
	public String getNAmtRmbExch()
	{
		return NAmtRmbExch;
	}
	public String getNAmt()
	{
		return NAmt;
	}
	public String getNPrmRmbExch()
	{
		return NPrmRmbExch;
	}
	public String getNPrm()
	{
		return NPrm;
	}
	public String getTAppTm()
	{
		return TAppTm;
	}
	public String getTInsrncBgnTm()
	{
		return TInsrncBgnTm;
	}
	public String getTInsrncEndTm()
	{
		return TInsrncEndTm;
	}
	public String getCGrpMrk()
	{
		return CGrpMrk;
	}
	public String getEfcManualFlag()
	{
		return EfcManualFlag;
	}
	public String getCPlyTyp()
	{
		return CPlyTyp;
	}
	public String getCNeedfeeFlag()
	{
		return CNeedfeeFlag;
	}
	public String getICopyNum()
	{
		return ICopyNum;
	}
	public String getDeleteFlag()
	{
		return deleteFlag;
	}
	public String getCreateAccount()
	{
		return createAccount;
	}
	public String getUsername()
	{
		return username;
	}
	public String getUpdateAccount()
	{
		return updateAccount;
	}
	public String getCreateTime()
	{
		return createTime;
	}
	public String getUpdateTime()
	{
		return updateTime;
	}
	public String getExpire_days()
	{
		return expire_days;
	}
	public String getStatus()
	{
		return status;
	}
	public String getTInsrncEndTmStartDate()
	{
		return TInsrncEndTmStartDate;
	}
	public String getTInsrncEndTmEndDate()
	{
		return TInsrncEndTmEndDate;
	}
	public String getAppCdePlay()
	{
		return appCdePlay;
	}
	public String getInsuredCdePlay()
	{
		return insuredCdePlay;
	}
	public void setSerialNumber(String serialNumber)
	{
		SerialNumber = serialNumber;
	}
	public void setCAppNo(String cAppNo)
	{
		CAppNo = cAppNo;
	}
	public void setCDptCde(String cDptCde)
	{
		CDptCde = cDptCde;
	}
	public void setSysRes(String sysRes)
	{
		SysRes = sysRes;
	}
	public void setCProdName(String cProdName)
	{
		CProdName = cProdName;
	}
	public void setCBsnsTyp(String cBsnsTyp)
	{
		CBsnsTyp = cBsnsTyp;
	}
	public void setCChaType(String cChaType)
	{
		CChaType = cChaType;
	}
	public void setCChaSubtype(String cChaSubtype)
	{
		CChaSubtype = cChaSubtype;
	}
	public void setCOprCde(String cOprCde)
	{
		COprCde = cOprCde;
	}
	public void setCSlsId(String cSlsId)
	{
		CSlsId = cSlsId;
	}
	public void setCBrkSlsCde(String cBrkSlsCde)
	{
		CBrkSlsCde = cBrkSlsCde;
	}
	public void setCBrkSlsNme(String cBrkSlsNme)
	{
		CBrkSlsNme = cBrkSlsNme;
	}
	public void setCCertfNo(String cCertfNo)
	{
		CCertfNo = cCertfNo;
	}
	public void setCBrkrCde(String cBrkrCde)
	{
		CBrkrCde = cBrkrCde;
	}
	public void setCAgtAgrNo(String cAgtAgrNo)
	{
		CAgtAgrNo = cAgtAgrNo;
	}
	public void setCDisptSttlCde(String cDisptSttlCde)
	{
		CDisptSttlCde = cDisptSttlCde;
	}
	public void setAgriMak(String agriMak)
	{
		AgriMak = agriMak;
	}
	public void setCWaterMark(String cWaterMark)
	{
		CWaterMark = cWaterMark;
	}
	public void setFinTyp(String finTyp)
	{
		FinTyp = finTyp;
	}
	public void setCProdNo(String cProdNo)
	{
		CProdNo = cProdNo;
	}
	public void setCCiMrk(String cCiMrk)
	{
		CCiMrk = cCiMrk;
	}
	public void setAppCde(String appCde)
	{
		AppCde = appCde;
	}
	public void setInsuredCde(String insuredCde)
	{
		InsuredCde = insuredCde;
	}
	public void setAppnme(String appnme)
	{
		this.appnme = appnme;
	}
	public void setInsurednme(String insurednme)
	{
		this.insurednme = insurednme;
	}
	public void setNAmtRmbExch(String nAmtRmbExch)
	{
		NAmtRmbExch = nAmtRmbExch;
	}
	public void setNAmt(String nAmt)
	{
		NAmt = nAmt;
	}
	public void setNPrmRmbExch(String nPrmRmbExch)
	{
		NPrmRmbExch = nPrmRmbExch;
	}
	public void setNPrm(String nPrm)
	{
		NPrm = nPrm;
	}
	public void setTAppTm(String tAppTm)
	{
		TAppTm = tAppTm;
	}
	public void setTInsrncBgnTm(String tInsrncBgnTm)
	{
		TInsrncBgnTm = tInsrncBgnTm;
	}
	public void setTInsrncEndTm(String tInsrncEndTm)
	{
		TInsrncEndTm = tInsrncEndTm;
	}
	public void setCGrpMrk(String cGrpMrk)
	{
		CGrpMrk = cGrpMrk;
	}
	public void setEfcManualFlag(String efcManualFlag)
	{
		EfcManualFlag = efcManualFlag;
	}
	public void setCPlyTyp(String cPlyTyp)
	{
		CPlyTyp = cPlyTyp;
	}
	public void setCNeedfeeFlag(String cNeedfeeFlag)
	{
		CNeedfeeFlag = cNeedfeeFlag;
	}
	public void setICopyNum(String iCopyNum)
	{
		ICopyNum = iCopyNum;
	}
	public void setDeleteFlag(String deleteFlag)
	{
		this.deleteFlag = deleteFlag;
	}
	public void setCreateAccount(String createAccount)
	{
		this.createAccount = createAccount;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public void setUpdateAccount(String updateAccount)
	{
		this.updateAccount = updateAccount;
	}
	public void setCreateTime(String createTime)
	{
		this.createTime = createTime;
	}
	public void setUpdateTime(String updateTime)
	{
		this.updateTime = updateTime;
	}
	public void setExpire_days(String expire_days)
	{
		this.expire_days = expire_days;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}
	public void setTInsrncEndTmStartDate(String tInsrncEndTmStartDate)
	{
		TInsrncEndTmStartDate = tInsrncEndTmStartDate;
	}
	public void setTInsrncEndTmEndDate(String tInsrncEndTmEndDate)
	{
		TInsrncEndTmEndDate = tInsrncEndTmEndDate;
	}
	public void setAppCdePlay(String appCdePlay)
	{
		this.appCdePlay = appCdePlay;
	}
	public void setInsuredCdePlay(String insuredCdePlay)
	{
		this.insuredCdePlay = insuredCdePlay;
	}
	
}
