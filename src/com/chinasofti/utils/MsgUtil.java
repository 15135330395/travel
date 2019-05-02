package com.chinasofti.utils;

/**
 * @author：Ganlan；
 * @date：2019-04-30；
 */


public class MsgUtil {

    private String msg;

    public MsgUtil(String name) {
        this.msg = name;
    }

    public MsgUtil() {
    }

    public String getName() {
        return msg;
    }

    public void setName(String name) {
        this.msg = name;
    }

    @Override
    public String toString() {
        return "MsgUtil{" +
                "msg='" + msg + '\'' +
                '}';
    }
}
