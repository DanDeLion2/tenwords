package com.dz223.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 日期工具类
 */
public class DateUtil {

    public static final String HOURMONTM=" 00:00:00";
    /**
     * 获取昨日日期
     * @return
     */
    public static final String yesterDayDate(){
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar=new GregorianCalendar();
        calendar.setTime(new Date());
        calendar.add(calendar.DATE,-1);
        return format.format(calendar.getTime());
    }

    /**
     * 获取当前日期
     */
    public static final String today(){
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(new Date());
    }
    /**
     * 获取当天0点日期
     */
    public static final String todayling(){
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        return format.format(new Date());
    }


    /**
     * 获取明日日期
     */
    public static final String tomorrow(){
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar=new GregorianCalendar();
        calendar.setTime(new Date());
        calendar.add(calendar.DATE,1);
        return format.format(calendar.getTime());
    }

    public static void main(String[] args) {
    }
}
