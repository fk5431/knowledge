package com.fk.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Tammy on 2016/5/28.
 */
public class DateUtil {
    /**
     * 获取当前时间
     *
     * @param dateFormat 时间格式
     * @return
     */
    public static String currentDate(String dateFormat) {
        SimpleDateFormat df = new SimpleDateFormat(dateFormat);
        String date = df.format(new Date());
        return date;
    }

    public static String curToTimestamp() {
        Date date = new Date();
        Long times = date.getTime();
        return times.toString();
    }

    /**
     * 将字符串转为时间戳(毫秒)
     *
     * @param user_time
     * @return
     */
    public static String dateToTimestamp(String user_time, String dateFormat) {
        String re_time = null;
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        Date d;
        try {
            d = sdf.parse(user_time);
            long l = d.getTime();
            String str = String.valueOf(l);
            re_time = str;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return re_time;
    }

    /**
     * 将字符串转为时间戳(秒)
     *
     * @param user_time
     * @return
     */
    public static String dateToTimeSecstamp(String user_time, String dateFormat) {
        String re_time = null;
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        Date d;
        try {
            d = sdf.parse(user_time);
            long l = d.getTime();
            String str = String.valueOf(l);
            re_time = str.substring(0, 10);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return re_time;
    }

    /**
     * 将字符串转为时间戳
     *
     * @param date
     * @return
     */
    public static String dateToTimestamp(Date date, String dateFormat) {
        long l = date.getTime();
        String str = String.valueOf(l);
        return str;
    }


    /**
     * @param date_str
     * @param dateFormat
     * @return
     */
    public static String formatDate(String date_str, String dateStrFormat, String dateFormat) {
        Date date = stringToDate(date_str, dateStrFormat);
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        return sdf.format(date);
    }

    /**
     * 时间戳转换为dateFormat
     *
     * @param date
     * @return
     */
    public static String timestampToDate(String date, String format) {
        int length = date.length();
        if (length == 10) {
            date += "000";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        String sd = sdf.format(new Date(Long.parseLong(date)));
        return sd;
    }

    /**
     * 字符串转换为时间
     *
     * @param date
     * @param format
     * @return
     */
    public static Date stringToDate(String date, String format) {
        SimpleDateFormat df = new SimpleDateFormat(format);
        Date time = null;
        try {
            time = df.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return time;
    }

    /**
     * 时间转字符串
     *
     * @param date
     * @param format
     * @return
     */
    public static String dateToString(Date date, String format) {
        String dateS = (new SimpleDateFormat(format)).format(date);
        return dateS;
    }

    /**
     * 判断时间是否在区间内
     *
     * @param date
     * @param dateAfter
     * @param dateBefore
     * @return
     */
    public static boolean judge(Date date, Date dateAfter, Date dateBefore) {
        boolean bool = true;
        if (date.before(dateAfter) && date.after(dateBefore)) {
            return bool;
        } else {
            bool = false;
            return bool;
        }
    }

    /**
     * 获取两个时间的时间差（毫秒）
     * (想要秒自个除1000去)
     *
     * @param dateAfter
     * @param dateBefore
     * @param format
     * @return
     */
    public static long timeDiff(String dateBefore, String dateAfter, String format) {
        Date d1 = (Date) stringToDate(dateBefore, format);
        Date d2 = (Date) stringToDate(dateAfter, format);
        long time = d2.getTime() - d1.getTime();
        return time;
    }

    /**
     * 获取两个时间的时间差（分钟）
     * (想要秒自个除1000去)
     *
     * @param dateAfter
     * @param dateBefore
     * @param format
     * @return
     */
    public static long timeDiffMin(String dateBefore, String dateAfter, String format) {
        Date d1 = (Date) stringToDate(dateBefore, format);
        Date d2 = (Date) stringToDate(dateAfter, format);
        long time = d2.getTime() - d1.getTime();
        return time / (1000 * 60);
    }

    /**
     * h获取与当前时间的时间差（毫秒）
     *
     * @param curDate
     * @param date
     * @param format
     * @return
     */
    public static long timeDiff(Date curDate, String date, String format) {
        Date d1 = (Date) stringToDate(date, format);
        long time = curDate.getTime() - d1.getTime();
        return time;
    }


    public static long getTimestamp(String time, String format) {
        long result = 0;
        try {
            SimpleDateFormat df = new SimpleDateFormat(format);
            Date date = df.parse(time);
            result = date.getTime();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    public static String addStampByDays(String stamp, String days) {
        Long time = Long.parseLong(stamp);
        Long res = time + Long.parseLong(days) * 24 * 60 * 60 * 1000;
        return res.toString();
    }


    public static String cutStampByDays(String stamp, String days) {
        Long time = Long.parseLong(stamp);
        Long res = time - Long.parseLong(days) * 24 * 60 * 60 * 1000;
        return res.toString();
    }


    /**
     * 判断某时间是否在两个时间内 0；是，1：大于，-1：小于
     *
     * @param small 时间短中较小的时间
     * @param big   时间短中较大的时间
     * @param cur   要比较的时间
     * @return
     */
    public static Integer inInterval(Long small, Long big, Long cur) {
        if (small > cur) {
            return -1;
        } else if (cur > big) {
            return 1;
        } else {
            return 0;
        }
    }


    public static Long addStampByHours(String stamp, String hours) {
        Long time = Long.parseLong(stamp);
        Long res = time + Integer.parseInt(hours) * 60 * 60 * 1000;
        return res;
    }


    public static Long addStampByMins(String stamp, String minutes) {
        Long time = Long.parseLong(stamp);
        Long res = time + Integer.parseInt(minutes) * 60 * 1000;
        return res;
    }

    public static Long cutStampByMins(String stamp, String minutes) {
        Long time = Long.parseLong(stamp);
        Long res = time - Integer.parseInt(minutes) * 60 * 1000;
        return res;
    }



    public static String mmdd(String date) {
        return date.substring(5, 10);
    }

    public static String yyyyMMdd(String date) {
        return date.substring(0, 10);
    }

    public static String hhmm(String date) {
        return date.substring(11, 16);
    }

    public static String toDate(String dateTime) {
        String date = "";
        if (dateTime.length() >= 10) {
            date = dateTime.substring(0, 10);
        }
        return date;
    }

    public static boolean judgmentDate(long startTime) throws Exception {
        long endTime = System.currentTimeMillis();
        long cha = endTime - startTime;
        if (cha < 0) {
            return false;
        }
        double result = cha * 1.0 / (1000 * 60 * 60);
        if (result <= 24) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 判断两个时间的大小  dateBefore小于dateAfter返回true
     *
     * @param dateBefore
     * @param dateAfter
     * @param format
     * @return
     */
    public static boolean twoDate(String dateBefore, String dateAfter, String format) {
        long before = Long.parseLong(dateToTimestamp(dateBefore, format));
        long after = Long.parseLong(dateToTimestamp(dateAfter, format));
        if (before < after) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * 获取当前时间指定前几天的日期
     *
     * @param format
     * @param days
     * @return
     */
    public static String preCur(String format, Integer days) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, -days);
        Date monday = c.getTime();
        String preMonday = sdf.format(monday);
        return preMonday;
    }//stringToDate(date, format)


    /**
     * 获取指定时间指定后几天的日期
     *
     * @param format
     * @param days
     * @return
     */
    public static String afterDate(String date, String format, Integer days) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(stringToDate(date, format));
        calendar.add(Calendar.DATE, +days);
        Date d = calendar.getTime();
        return sdf.format(d);
    }


    /**
     * 获取指定时间指定后几天的日期
     *
     * @param format
     * @param days
     * @return
     */
    public static String afterCur(String format, Integer days) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, days);
        Date monday = c.getTime();
        String afterCur = sdf.format(monday);
        return afterCur;
    }


    /**
     * 获取当前日期是星期几<br>
     *
     * @param date
     * @return 当前日期是星期几
     */
    public static String getWeekOfDate(String date, String format) {
        Date dt = stringToDate(date, format);
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w <= 0) {
            w = 7;
        }
        return String.valueOf(w);
    }


}
