package net.jeeshop.services.manage.pageRecord.bean;

import java.io.Serializable;

public class PageRecord implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cursorPos;//
	private String orderField;//
	private String orderFlag;//
	private String pageFlag;// 
	private String pageLNum;// 
	private String retCount;// 	
	public String getCursorPos() {
		return cursorPos;
	}
	public void setCursorPos(String cursorPos) {
		this.cursorPos = cursorPos;
	}
	public String getOrderField() {
		return orderField;
	}
	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}
	public String getOrderFlag() {
		return orderFlag;
	}
	public void setOrderFlag(String orderFlag) {
		this.orderFlag = orderFlag;
	}
	public String getPageFlag() {
		return pageFlag;
	}
	public void setPageFlag(String pageFlag) {
		this.pageFlag = pageFlag;
	}
	public String getPageLNum() {
		return pageLNum;
	}
	public void setPageLNum(String pageLNum) {
		this.pageLNum = pageLNum;
	}
	public String getRetCount() {
		return retCount;
	}
	public void setRetCount(String retCount) {
		this.retCount = retCount;
	}
	
	
}