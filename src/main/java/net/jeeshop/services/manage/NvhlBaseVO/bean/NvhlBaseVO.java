package net.jeeshop.services.manage.NvhlBaseVO.bean;import java.io.Serializable;import net.jeeshop.core.dao.QueryModel;import net.jeeshop.services.manage.NvhlApplicantVO.bean.NvhlApplicantVO;import net.jeeshop.services.manage.NvhlInsuredVO.bean.NvhlInsuredVO;/** * base表 * @author lin */public class NvhlBaseVO extends QueryModel implements Serializable {	private static final long serialVersionUID = 1L;    	private String id;//流水号	private String CDptCde;//机构代码	private String SysRes;//系统来源	private String CProdName;//险种名称		private String CBsnsTyp;//业务来源   19002代理业务	private String CChaType;//渠道中级分类  1900201 专业代理	private String CChaSubtype;//渠道子类  1900201001  专业代理	//null	private String COprCde;//录单人	private String CSlsId;//业务员员工号	private String CBrkSlsCde;//代理业务员	private String CBrkSlsNme;//代理业务员名称	private String CCertfNo;//代理业务职业证号	private String CBrkrCde;//代理(经纪)人	private String CAgtAgrNo;//代理(合作)协议	//null	private String CDisptSttlCde;//争议处理 	private String AgriMak;//涉农标志	private String CWaterMark;//是否涉海|涉水 		private String FinTyp;//缴费方式 1刷卡 2支票 5 转账 默认5		private String CProdNo;//产品代码（险种）  010001 财产基本险	private String CCiMrk;//共保业务 0 非共保	private String AppCde;//投保人编码	private String InsuredCde;//被保人编码	private String appnme;//投保人名称	private String insurednme;//被保人名称		private String NAmtRmbExch;//保额币种  01 RMB	private Double NAmt;//保额合计	private String NPrmRmbExch;//保费币种   01 RMB	private Double NPrm;//保费合计		private String TAppTm;//投保日期	private String TInsrncBgnTm;//保险起期	private String TInsrncEndTm;//保险止期		private String CGrpMrk;//团单标志 0 个单   1团单	private String EfcManualFlag;//是否转人工 Y转 N不转	private String CPlyTyp;//保单形式  1电子保单   2监制保单	private String CNeedfeeFlag;//是否规定见费出单标志   1见  2不见	//null	private Integer ICopyNum;//份数  		private String deleteFlag;	private String createAccount;	private String updateAccount;	private String createTime;	private String updateTime;	private Integer expire_days;//超期日期	private String status ;//订单状态	/*	 * 查询条件	 */	private String TInsrncEndTmStartDate;//到期日期	private String TInsrncEndTmEndDate;//到期日期				public String getAppCde() {		return AppCde;	}	public void setAppCde(String appCde) {		AppCde = appCde;	}	public String getInsuredCde() {		return InsuredCde;	}	public void setInsuredCde(String insuredCde) {		InsuredCde = insuredCde;	}	public String getId() {		return id;	}	public void setId(String id) {		this.id = id;	}	public String getCDptCde() {		return CDptCde;	}	public void setCDptCde(String cDptCde) {		CDptCde = cDptCde;	}	public String getSysRes() {		return SysRes;	}	public void setSysRes(String sysRes) {		SysRes = sysRes;	}	public String getCBsnsTyp() {		return CBsnsTyp;	}	public void setCBsnsTyp(String cBsnsTyp) {		CBsnsTyp = cBsnsTyp;	}	public String getCChaType() {		return CChaType;	}	public void setCChaType(String cChaType) {		CChaType = cChaType;	}	public String getCChaSubtype() {		return CChaSubtype;	}	public void setCChaSubtype(String cChaSubtype) {		CChaSubtype = cChaSubtype;	}	public String getCOprCde() {		return COprCde;	}	public void setCOprCde(String cOprCde) {		COprCde = cOprCde;	}	public String getCSlsId() {		return CSlsId;	}	public void setCSlsId(String cSlsId) {		CSlsId = cSlsId;	}	public String getCBrkSlsCde() {		return CBrkSlsCde;	}	public void setCBrkSlsCde(String cBrkSlsCde) {		CBrkSlsCde = cBrkSlsCde;	}	public String getCBrkSlsNme() {		return CBrkSlsNme;	}	public void setCBrkSlsNme(String cBrkSlsNme) {		CBrkSlsNme = cBrkSlsNme;	}	public String getCCertfNo() {		return CCertfNo;	}	public void setCCertfNo(String cCertfNo) {		CCertfNo = cCertfNo;	}	public String getCBrkrCde() {		return CBrkrCde;	}	public void setCBrkrCde(String cBrkrCde) {		CBrkrCde = cBrkrCde;	}	public String getCAgtAgrNo() {		return CAgtAgrNo;	}	public void setCAgtAgrNo(String cAgtAgrNo) {		CAgtAgrNo = cAgtAgrNo;	}	public String getCDisptSttlCde() {		return CDisptSttlCde;	}	public void setCDisptSttlCde(String cDisptSttlCde) {		CDisptSttlCde = cDisptSttlCde;	}	public String getAgriMak() {		return AgriMak;	}	public void setAgriMak(String agriMak) {		AgriMak = agriMak;	}	public String getCWaterMark() {		return CWaterMark;	}	public void setCWaterMark(String cWaterMark) {		CWaterMark = cWaterMark;	}	public String getFinTyp() {		return FinTyp;	}	public void setFinTyp(String finTyp) {		FinTyp = finTyp;	}	public String getCProdNo() {		return CProdNo;	}	public void setCProdNo(String cProdNo) {		CProdNo = cProdNo;	}	public String getCCiMrk() {		return CCiMrk;	}	public void setCCiMrk(String cCiMrk) {		CCiMrk = cCiMrk;	}	public String getNAmtRmbExch() {		return NAmtRmbExch;	}	public void setNAmtRmbExch(String nAmtRmbExch) {		NAmtRmbExch = nAmtRmbExch;	}	public String getNPrmRmbExch() {		return NPrmRmbExch;	}	public void setNPrmRmbExch(String nPrmRmbExch) {		NPrmRmbExch = nPrmRmbExch;	}		public String getTAppTm() {		return TAppTm;	}	public void setTAppTm(String tAppTm) {		TAppTm = tAppTm;	}	public String getTInsrncBgnTm() {		return TInsrncBgnTm;	}	public void setTInsrncBgnTm(String tInsrncBgnTm) {		TInsrncBgnTm = tInsrncBgnTm;	}	public String getTInsrncEndTm() {		return TInsrncEndTm;	}	public void setTInsrncEndTm(String tInsrncEndTm) {		TInsrncEndTm = tInsrncEndTm;	}	public String getCGrpMrk() {		return CGrpMrk;	}	public void setCGrpMrk(String cGrpMrk) {		CGrpMrk = cGrpMrk;	}	public String getEfcManualFlag() {		return EfcManualFlag;	}	public void setEfcManualFlag(String efcManualFlag) {		EfcManualFlag = efcManualFlag;	}	public String getCPlyTyp() {		return CPlyTyp;	}	public void setCPlyTyp(String cPlyTyp) {		CPlyTyp = cPlyTyp;	}	public String getCNeedfeeFlag() {		return CNeedfeeFlag;	}	public void setCNeedfeeFlag(String cNeedfeeFlag) {		CNeedfeeFlag = cNeedfeeFlag;	}	public Integer getICopyNum() {		return ICopyNum;	}	public void setICopyNum(Integer iCopyNum) {		ICopyNum = iCopyNum;	}	public Double getNAmt() {		return NAmt;	}	public void setNAmt(Double nAmt) {		NAmt = nAmt;	}	public Double getNPrm() {		return NPrm;	}	public void setNPrm(Double nPrm) {		NPrm = nPrm;	}	public String getDeleteFlag() {		return deleteFlag;	}	public void setDeleteFlag(String deleteFlag) {		this.deleteFlag = deleteFlag;	}	public String getCreateAccount() {		return createAccount;	}	public void setCreateAccount(String createAccount) {		this.createAccount = createAccount;	}	public String getUpdateAccount() {		return updateAccount;	}	public void setUpdateAccount(String updateAccount) {		this.updateAccount = updateAccount;	}	public String getCreateTime() {		return createTime;	}	public void setCreateTime(String createTime) {		this.createTime = createTime;	}	public String getUpdateTime() {		return updateTime;	}	public void setUpdateTime(String updateTime) {		this.updateTime = updateTime;	}	public Integer getExpire_days() {		return expire_days;	}	public void setExpire_days(Integer expire_days) {		this.expire_days = expire_days;	}	public String getCProdName() {		return CProdName;	}	public void setCProdName(String cProdName) {		CProdName = cProdName;	}	public String getTInsrncEndTmStartDate() {		return TInsrncEndTmStartDate;	}	public void setTInsrncEndTmStartDate(String tInsrncEndTmStartDate) {		TInsrncEndTmStartDate = tInsrncEndTmStartDate;	}	public String getTInsrncEndTmEndDate() {		return TInsrncEndTmEndDate;	}	public void setTInsrncEndTmEndDate(String tInsrncEndTmEndDate) {		TInsrncEndTmEndDate = tInsrncEndTmEndDate;	}	public String getStatus() {		return status;	}	public void setStatus(String status) {		this.status = status;	}	public String getAppnme() {		return appnme;	}	public void setAppnme(String appnme) {		this.appnme = appnme;	}	public String getInsurednme() {		return insurednme;	}	public void setInsurednme(String insurednme) {		this.insurednme = insurednme;	}	}