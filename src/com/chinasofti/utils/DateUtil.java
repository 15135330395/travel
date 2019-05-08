package com.chinasofti.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description DateUtil
 * @Author 网络
 * @CreateTime 2019-03-26 14:46
 */
public class DateUtil {
    public static String formatDate(Date date, String format) {
        String result = "";
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        if (date != null) {
            result = sdf.format(date);
        }
        return result;
    }


    public static Date formatString(String str, String format) {
        if (StringUtil.isEmpty(str)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try {
            return sdf.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getCurrentDateStr() throws Exception {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        return sdf.format(date);
    }
}
