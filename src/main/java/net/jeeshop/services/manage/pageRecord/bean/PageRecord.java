package net.jeeshop.services.manage.pageRecord.bean;

import java.io.Serializable;

public class PageRecord implements Serializable {
	private static final long serialVersionUID = 1L;
	private int retCount = 0; 
	private int pageFlag = 0;
	private String orderFlag = "ASC";
	private int pageLNum = 0; 
	private int cursorPos = 0; 
	private String orderField = "";
	
	public int getRetCount() {
		return retCount;
	}
	public void setRetCount(int retCount) {
		this.retCount = retCount;
	}
	public int getPageFlag() {
		return pageFlag;
	}
	public void setPageFlag(int pageFlag) {
		this.pageFlag = pageFlag;
	}
	public String getOrderFlag() {
		return orderFlag;
	}
	public void setOrderFlag(String orderFlag) {
		this.orderFlag = orderFlag;
	}
	public int getPageLNum() {
		return pageLNum;
	}
	public void setPageLNum(int pageLNum) {
		this.pageLNum = pageLNum;
	}
	public int getCursorPos() {
		return cursorPos;
	}
	public void setCursorPos(int cursorPos) {
		this.cursorPos = cursorPos;
	}
	public String getOrderField() {
		return orderField;
	}
	public void setOrderField(String orderField) {
		this.orderField = orderField;
	} 
	
}