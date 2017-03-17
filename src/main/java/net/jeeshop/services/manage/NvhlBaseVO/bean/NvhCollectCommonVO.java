package net.jeeshop.services.manage.NvhlBaseVO.bean;

import java.io.Serializable;

import net.jeeshop.core.dao.QueryModel;

/**
 * 收集页面表单提交数据实体类
 * @author Yang
 *
 */
public class NvhCollectCommonVO extends QueryModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;//主键id
	private String cAppNo;//保单编号
	private String yyxzKey;//营业性质的key
	private String yyxzVal;//营业性质的数据
	private String hylxKey;//行业类型清单的key
	private String hylxVal;//行业类型清单的数据
	private String cbqy;//承保区域
	private String yycs;//营业场所地址
	private String zip;//邮编
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getcAppNo() {
		return cAppNo;
	}
	public void setcAppNo(String cAppNo) {
		this.cAppNo = cAppNo;
	}
	public String getYyxzKey() {
		return yyxzKey;
	}
	public void setYyxzKey(String yyxzKey) {
		this.yyxzKey = yyxzKey;
	}
	public String getYyxzVal() {
		return yyxzVal;
	}
	public void setYyxzVal(String yyxzVal) {
		this.yyxzVal = yyxzVal;
	}
	public String getHylxKey() {
		return hylxKey;
	}
	public void setHylxKey(String hylxKey) {
		this.hylxKey = hylxKey;
	}
	public String getHylxVal() {
		return hylxVal;
	}
	public void setHylxVal(String hylxVal) {
		this.hylxVal = hylxVal;
	}
	public String getCbqy() {
		return cbqy;
	}
	public void setCbqy(String cbqy) {
		this.cbqy = cbqy;
	}
	public String getYycs() {
		return yycs;
	}
	public void setYycs(String yycs) {
		this.yycs = yycs;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}

	
}
