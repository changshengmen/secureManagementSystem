package net.jeeshop.services.common;

/**
 * 验证信息 出参用
 * @author lin
 */
public class telOperVO {
	private String id; 
	private String CPassWd;//密码
	private String accequ;//接入设备
	private String COperId; //用户名  
	private String operTm; //时间戳
	private String macAddress; //mac地址
	private String ip;
	//只需要 用户名 密码两个字段
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCPassWd() {
		return CPassWd;
	}
	public void setCPassWd(String cPassWd) {
		CPassWd = cPassWd;
	}
	public String getAccequ() {
		return accequ;
	}
	public void setAccequ(String accequ) {
		this.accequ = accequ;
	}
	public String getCOperId() {
		return COperId;
	}
	public void setCOperId(String cOperId) {
		COperId = cOperId;
	}
	public String getOperTm() {
		return operTm;
	}
	public void setOperTm(String operTm) {
		this.operTm = operTm;
	}
	public String getMacAddress() {
		return macAddress;
	}
	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
}
