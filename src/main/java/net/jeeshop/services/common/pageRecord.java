package net.jeeshop.services.common;

/**
 * 供出参用 的 分页信息 
 * @author lin
 *
 */
public class pageRecord {
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
