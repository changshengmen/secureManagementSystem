package net.jeeshop.services.manage.DetailsVO.bean;

import java.io.Serializable;

public class DetailsVO implements Serializable {
	private static final long serialVersionUID = 1L;
	private String Custseq;//流水号
	private String ApplicantNo;//投保单号
	private String ApplicantName;//投保人名称
	private String ApplicantCode;// 投保人代码
	private String InsuredName;// 被保人名称
	private String InsuredCode;// 被保人代码 	
	private String StartDate;//起保（生效）日期
	private String DataSource;//数据来源
	private String installmenrsTimes;//分期缴费期次
	private String entryObjList[];//扩展信息
	
	public String getCustseq() {
		return Custseq;
	}
	public void setCustseq(String custseq) {
		Custseq = custseq;
	}
	public String getApplicantNo() {
		return ApplicantNo;
	}
	public void setApplicantNo(String applicantNo) {
		ApplicantNo = applicantNo;
	}
	public String getApplicantName() {
		return ApplicantName;
	}
	public void setApplicantName(String applicantName) {
		ApplicantName = applicantName;
	}
	public String getApplicantCode() {
		return ApplicantCode;
	}
	public void setApplicantCode(String applicantCode) {
		ApplicantCode = applicantCode;
	}
	public String getInsuredName() {
		return InsuredName;
	}
	public void setInsuredName(String insuredName) {
		InsuredName = insuredName;
	}
	public String getInsuredCode() {
		return InsuredCode;
	}
	public void setInsuredCode(String insuredCode) {
		InsuredCode = insuredCode;
	}
	public String getStartDate() {
		return StartDate;
	}
	public void setStartDate(String startDate) {
		StartDate = startDate;
	}
	public String getDataSource() {
		return DataSource;
	}
	public void setDataSource(String dataSource) {
		DataSource = dataSource;
	}
	public String getInstallmenrsTimes() {
		return installmenrsTimes;
	}
	public void setInstallmenrsTimes(String installmenrsTimes) {
		this.installmenrsTimes = installmenrsTimes;
	}
	public String[] getEntryObjList() {
		return entryObjList;
	}
	public void setEntryObjList(String[] entryObjList) {
		this.entryObjList = entryObjList;
	}
}