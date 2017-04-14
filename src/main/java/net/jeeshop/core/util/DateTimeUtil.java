package net.jeeshop.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

public class DateTimeUtil {

	private static final long m = 60 * 1000L;// 分
	private static final long hour = 3600 * 1000L;// 小时
	private static final long day = 24 * hour;// 天
	public static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	/**
	 * 日期时间转换成文字
	 * 
	 * @param date
	 * @return
	 */
	public static String getDateTimeString(Date date) {
		if (date == null) {
			throw new NullPointerException();
		}

		Date currentDate = new Date();
		long cha = Math.abs(date.getTime() - currentDate.getTime());
		// System.out.println("cha="+cha);
		long hours = cha / hour;
		// System.out.println(hours);
		if (hours < 1) {
			if (cha / m <= 0) {
				return "刚刚";
			}
			return cha / m + "分钟前";
		}
		if (hours < 24) {
			return cha / hour + "小时前";
		}
		if (hours <= 72) {
			int nn = Integer.valueOf(cha / day + "");
			if (cha % day > 0) {
				nn++;
			}
			return nn + "天前";
		}
		return sdf.format(date);
	}

	public static boolean compareDateTime(Date d1, Date d2) {
		return d1.getTime() > d2.getTime();
	}

	/**
	 * 获取促销商品活动的结束时间的字符串
	 * 
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public static String getActivityEndDateTimeString(String activityEndDateTime) {
		long nd = 1000 * 24 * 60 * 60;// 一天的毫秒数
		long nh = 1000 * 60 * 60;// 一小时的毫秒数
		long nm = 1000 * 60;// 一分钟的毫秒数
		long ns = 1000;// 一秒钟的毫秒数
		long diff;
		long day = 0;
		long hour = 0;
		long min = 0;
		long sec = 0;
		// 获得两个时间的毫秒时间差异
		try {
			diff = sdf.parse(activityEndDateTime).getTime() - (new Date()).getTime();
			day = diff / nd;// 计算差多少天
			hour = diff % nd / nh + day * 24;// 计算差多少小时
			min = diff % nd % nh / nm + day * 24 * 60;// 计算差多少分钟
			sec = diff % nd % nh % nm / ns;// 计算差多少秒

			StringBuilder buff = new StringBuilder();

			if (day > 0) {
				buff.append(day).append("天");
			}

			if ((hour - day * 24) > 0) {
				buff.append(hour - day * 24).append("小时");
			}

			if ((min - day * 24 * 60) > 0) {
				buff.append(min - day * 24 * 60).append("分钟");
			}

			if (sec > 0) {
				buff.append(sec).append("秒");
			}

			// String cha = day + "天" + (hour - day * 24) + "小时" + (min - day *
			// 24 * 60) + "分钟" + sec + "秒";

			return buff.toString();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @Description: TODO(获取当前时间字符串格式) @author lyx @date 2016年10月14日
	 * 下午2:02:51 @return String 返回类型 @throws
	 */
	public static String getDateNowByExpression(String expression) {
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(expression);
		return sdf.format(dt);
	}

	/**
	 * @param string dateTime yyyy-MM-dd hh:mm:ss （入参） 如果为空 获取当前时间 
	 * @param1 con :next 下一天 ？？？ last前一天
	 * @Description: TODO(获取第二天的零点 时分秒) 
	 * @author lyx @date
	 * 2016年11月28日 下午3:20:49 @return String 返回类型 yyyy-MM-dd hh:mm:ss （出参）
	 * @throws
	 */
	public static String getNextOrLastDay(String dt, String con) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;String dateString = "";
		if (StringUtils.isBlank(dt) || dt == "") {
			date = new Date();
		} else {
			String dtNow = dt.substring(0, 10);
			try {
				date = formatter.parse(dtNow);
				Calendar calendar = new GregorianCalendar();
				calendar.setTime(date);
				if (con == "last") {
					//calendar.add(calendar.DATE, -1);
					date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
					dateString = formatter.format(date) + " 23:59:59";
				} else {
					calendar.add(calendar.DATE, 1);
					date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
					dateString = formatter.format(date) + " 00:00:00";
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		return dateString;
	}
	
	/**
	 * @param string dateTime yyyy-MM-dd hh:mm:ss （入参） 如果为空 获取当前时间 
	 * @param1 con :next 下一天 ;
	 *              last 前一天 ;
 *    				"" 去掉字符之间的"-"、":"、空格
	 * @Description: TODO(获取第二天的零点 时分秒) 
	 * @author lyx @date
	 * 2016年11月28日 下午3:20:49 @return String 返回类型 yyyyMMddhhmmss （出参）
	 * @throws
	 */
	public static String getNextOrLastDayCombine(String dt, String con) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		Date date = null;String dateString = "";
		if (StringUtils.isBlank(dt) || dt == "") {
			date = new Date();
		} else {
			if (con == "") {
				dt = dt.replace("-", "");
				dt = dt.replace(":", "");
				dateString = dt.replace(" ", "");
				return dateString;
			}
			String dtNow = dt.replace("-", "").substring(0, 8);
			try {
				date = formatter.parse(dtNow);
				Calendar calendar = new GregorianCalendar();
				calendar.setTime(date);
				if (con == "last") {
					calendar.add(calendar.DATE, -1);
					date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
					dateString = formatter.format(date) + "235959";
				} else {
					//calendar.add(calendar.DATE, 1);
					date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
					dateString = formatter.format(date) + "000000";
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		return dateString;
	}

	/**
	 * @param yyyyMMddhhmmss
	 *            获取 yy-MM-dd hh:mm:ss 格式
	 * @Description: TODO(把时间解析成json串 供传送)
	 * @author lyx
	 * @date 2016年11月29日 上午11:02:40
	 * @return Map 返回类型
	 * @throws
	 * 
	 * 			public
	 *             static Map getDateFormat(String dateTime){
	 *             if(dateTime.indexOf("-")>-1){ String ss =
	 *             dateTime.replaceAll("(?:-|:|)", ""); dateTime =
	 *             ss.replaceAll(" ", ""); }
	 * 
	 *             SimpleDateFormat sdf1 = new
	 *             SimpleDateFormat("yyyyMMddhhmmss"); SimpleDateFormat
	 *             formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 * 
	 *             Map m = new HashMap(); Calendar ca = Calendar.getInstance();
	 * 
	 *             String hour;String minute;String second;Long times;int tz ;
	 *             int year;int dat;int day;int month;int length; try { Date
	 *             date = (Date) sdf1.parse(dateTime); String dt =
	 *             formatter.format(date); Date dtNow = formatter.parse(dt);
	 *             times = dtNow.getTime(); //time 时间戳 day = dtNow.getDay()+1;
	 *             year = dtNow.getYear()+1; tz = dtNow.getTimezoneOffset(); dat
	 *             = dtNow.getDate(); month = dtNow.getMonth(); length =
	 *             dateTime.length(); hour = dateTime.substring(length-6,
	 *             length-4); minute = dateTime.substring(length-4,length-2);
	 *             second = dateTime.substring(length-2,length);
	 * 
	 *             m.put("date", dat); m.put("day", day); m.put("hour", hour);
	 *             m.put("minutes", minute); m.put("month", month);
	 *             m.put("seconds", second); m.put("time", times);
	 *             m.put("timezoneOffset", tz); m.put("year", year); } catch
	 *             (ParseException e) { e.printStackTrace(); } return m; }
	 */ 
}
