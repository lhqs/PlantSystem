package cn.lhqs.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * 时间工具类， 用于时间的格式化，处理等通用方法集结地
 */
public class TimeTools {
	public static final String DATE_TYPE1 = "yyyy-MM-dd HH:mm:ss";

	public static final String DATE_TYPE2 = "yyyy-MM-dd HH:mm:ss.SSS";

	public static final String DATE_TYPE3 = "yyyyMMddHHmmssSSS";

	public static final String DATE_TYPE4 = "yyyyMMddHHmmss";

	public static final String DATE_TYPE5 = "yyyy-MM-dd";

	public static final String DATE_TYPE6 = "yy-MM-dd-HH-mm-ss";

	public static final String DATE_TYPE7 = "yyyy-MM-dd HH:mm";

	public static final String DATE_TYPE8 = "yyyyMMdd";

	public static final String DATE_TYPE9 = "yyyy-M-d H:m:s:S";

	public static final String DATE_TYPE10 = "yyyyMMddHHmm";

	public static final String DATE_TYPE11 = "yyyy-M-d H:m:s";

	public static final String DATE_TYPE12 = "yy-MM-dd HH:mm:ss";

	public static final String DATE_TYPE13 = "yyyy/MM/dd HH:mm:ss";

	public static final String DATE_TYPE14 = "MM-dd HH:mm:ss";

	public static final String DATE_TYPE15 = "yyyy年MM月dd日 HH:mm";
	public static final String DATE_TYPE16 = "MM月dd日 HH:mm";
	public static final String DATE_TYPE17 = "yyyyMM";
	public static final String DATE_TYPE18 = "HHmm";
	public static final String DATE_TYPE19 = "HHmmss";
	public static final String DATE_TYPE20 = "HHmmssSSS";

	public static TimeZone timeZoneChina = TimeZone.getTimeZone("Asia/Shanghai");// 获取时区
	
	/**
	 * 获取当前时间
	 * @param type   指定格式
	 */
	public static String getSystemDate(String type) {
		// 指定格式
		DateFormat date_format = new SimpleDateFormat(type);
		date_format.setTimeZone(timeZoneChina);
		// 范围指定格式的字符串
		return date_format.format(new Date());
	}

	/***************************************************************************
	 * 时间运算
	 * @param date
	 *            运算前时间
	 * @param min
	 *            add的分钟数
	 */
	public static Date AddMin(Date date, int min) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MINUTE, min);
		return cal.getTime();
	}

	/***************************************************************************
	 * 时间运算
	 * @param date
	 *            运算前时间
	 * @param value
	 *            add的值
	 */
	public static Date AddTime(Date date, int value, int type) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(type, value);
		return cal.getTime();
	}

	/***************************************************************************
	 * 时间运算 (月份加算)
	 * @param date
	 *            运算前时间
	 * @param value
	 *            add的值
	 * @return String
	 */
	public static String AddMonth(String dateStr, String format, int mon) {
		DateFormat dateFmt = new SimpleDateFormat(format);
		dateFmt.setTimeZone(timeZoneChina);
		java.util.Date tmpDate;

		try {
			tmpDate = dateFmt.parse(dateStr);
			Calendar cal = Calendar.getInstance();
			cal.setTime(tmpDate);
			cal.add(Calendar.MONTH, mon);

			return dateFmt.format(cal.getTime());

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}

	/***************************************************************************
	 * 取得月的最后一天
	 * @param dateStr
	 *            日期
	 * @param format
	 *            日期格式
	 * @return String 参数日期所在月份的最后一天
	 */
	public static String getMonthLastDay(String dateStr, String fromFmt,
			String toFmt) {
		DateFormat dateFmt = new SimpleDateFormat(fromFmt);
		dateFmt.setTimeZone(timeZoneChina);
		java.util.Date tmpDate;

		try {
			tmpDate = dateFmt.parse(dateStr);
			Calendar cal = Calendar.getInstance();
			cal.setTime(tmpDate);
			cal.set(Calendar.DAY_OF_MONTH, cal
					.getActualMaximum(Calendar.DAY_OF_MONTH));

			DateFormat dateToFmt = new SimpleDateFormat(toFmt);
			dateToFmt.setTimeZone(timeZoneChina);
			return dateToFmt.format(cal.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}

	/**
	 * 时间转化
	 * @param dateStr
	 * @param fromType
	 * @param toType
	 */
	public static String getFormatDate(String dateStr, String fromType, String toType) {
		try {
			DateFormat dateFromFmt = new SimpleDateFormat(fromType);
			dateFromFmt.setTimeZone(timeZoneChina);
			DateFormat dateToFmt = new SimpleDateFormat(toType);
			dateToFmt.setTimeZone(timeZoneChina);
			// 非空检查
			if (dateStr == null || dateStr.equals("")) {
				return "";
			} else {
				java.util.Date tmpDate = dateFromFmt.parse(dateStr);

				if (dateFromFmt.format(tmpDate).equals(dateStr)) {
					return dateToFmt.format(tmpDate);
				} else {
					return "";
				}
			}
		} catch (Exception e) {
			return "";
		}
	}

	public static String getFormatDate(Date date, String toType) {

		try {
			DateFormat dateToFmt = new SimpleDateFormat(toType);
			dateToFmt.setTimeZone(timeZoneChina);
			// 非空检查
			if (date == null) {
				return "";
			} else {
				return dateToFmt.format(date);
			}
		} catch (Exception e) {
			return "";
		}
	}

	public static Date getDateFromStr(String dateStr, String fromType) {

		try {
			DateFormat dateFromFmt = new SimpleDateFormat(fromType);
			dateFromFmt.setTimeZone(timeZoneChina);
			
			return dateFromFmt.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String getFormatTime(String type) {
		DateFormat dateFmt = new SimpleDateFormat(type);
		DateFormat dateFmtobj = new SimpleDateFormat(TimeTools.DATE_TYPE1);
		long time = 0;
		try {
			time = dateFmt.parse(TimeTools.DATE_TYPE2).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dateFmtobj.format(time);
	}

}
