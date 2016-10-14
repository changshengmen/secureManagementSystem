package net.jeeshop.services.manage.NvhlCvrgVO.bean;

import java.io.Serializable;

public class NvhlCvrgVO implements Serializable {
	private static final long serialVersionUID = 1L;
	private String CvrgNo;// 险别代码
	private int Cresponsis;// 责任代码
	private String NOnceLamt;// 每日津贴额
	private String Amt;// 保额
	private String Rate;// 费率/基准费率
	private String TgtQty;// 数量/人数
	private String Ctraffic;//交通工具
	public String getCvrgNo() {
		return CvrgNo;
	}
	public void setCvrgNo(String cvrgNo) {
		CvrgNo = cvrgNo;
	}
	public int getCresponsis() {
		return Cresponsis;
	}
	public void setCresponsis(int cresponsis) {
		Cresponsis = cresponsis;
	}
	public String getNOnceLamt() {
		return NOnceLamt;
	}
	public void setNOnceLamt(String nOnceLamt) {
		NOnceLamt = nOnceLamt;
	}
	public String getAmt() {
		return Amt;
	}
	public void setAmt(String amt) {
		Amt = amt;
	}
	public String getRate() {
		return Rate;
	}
	public void setRate(String rate) {
		Rate = rate;
	}
	public String getTgtQty() {
		return TgtQty;
	}
	public void setTgtQty(String tgtQty) {
		TgtQty = tgtQty;
	}
	public String getCtraffic() {
		return Ctraffic;
	}
	public void setCtraffic(String ctraffic) {
		Ctraffic = ctraffic;
	}

}