package net.jeeshop.core.util;

import java.util.UUID;

public  class MathUtil {
	/**
	* @Description: TODO(获取序列) 
	* @author lyx
	* @date 2016年9月26日 下午2:51:03 
	* @return String    返回类型 
	* @throws
	 */
	 public static String getUUID() {
		    return UUID.randomUUID().toString().replace("-","");
		  }
}
