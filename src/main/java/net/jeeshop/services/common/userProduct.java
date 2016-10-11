package net.jeeshop.services.common;

import java.io.Serializable;

import net.jeeshop.core.dao.page.PagerModel;

public class userProduct extends PagerModel implements Serializable{
	private String id;
	private String user_id;
	private String product_id;
	private String remark;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}






	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public void clear() {
		this.setId(null);
		remark = null;

	}
}
