package com.chinasofti.utils;

import java.util.Random;

/**
 * @Description IdUtil
 * @Author WYR
 * @CreateTime 2019-04-27 17:22
 */
public class IdUtil {

    /**
     * 图片名生成
     */
    public static String genImageName() {
        //取当前时间的长整形值包含毫秒
        long millis = System.currentTimeMillis();
        //long millis = System.nanoTime();
        //加上三位随机数
        Random random = new Random();
        int end3 = random.nextInt(999);
        //如果不足三位前面补0
        return millis + String.format("%03d", end3);
    }

    /**
     * 订单id生成
     */
    public static long genItemId() {
        try {
            // 加上两位随机数
            Random random = new Random();
            int end2 = random.nextInt(99);
            String str = DateUtil.getCurrentDateStr() + String.format("%02d", end2);
            return new Long(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1L;
    }

}
