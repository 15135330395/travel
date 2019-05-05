package com.chinasofti.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description DBRecover
 * @Author WYR
 * @CreateTime 2019-05-05 9:46
 */
public class DBRecover {
    /**
     * 访问MySQL数据库服务器所在的IP地址
     */
    private String serverUrl;
    /**
     * 访问MySQL数据库的用户名
     */
    private String username;
    /**
     * 访问MySQL数据库的密码
     */
    private String password;

    public String getServerUrl() {
        return serverUrl;
    }

    public void setServerUrl(String serverUrl) {
        this.serverUrl = serverUrl;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public DBRecover(String serverUrl, String username, String password) {
        super();
        this.serverUrl = serverUrl;
        this.username = username;
        this.password = password;
    }

    public String backup(String backupPath, String dbName) throws IOException {
        String backupFile = backupPath + new SimpleDateFormat("yyyyMMdd-HHmmss").format(new Date()) + ".sql";
        String mysql = "mysqldump " + "--host=" + serverUrl + " --user=" + username + " --password=" + password + " --opt " + dbName + "> " + backupFile;
        System.out.println("备份" + mysql);
        java.lang.Runtime.getRuntime().exec("cmd /c " + mysql);
        System.out.println("备份成功!");
        return backupFile;
    }

    public void restore(String restoreFile, String dbName) throws IOException {
        String mysql = "mysql " + "-h" + serverUrl + " -u" + username + " -p" + password + " " + dbName + " < " + restoreFile;
        System.out.println("还原" + mysql);
        java.lang.Runtime.getRuntime().exec("cmd /c " + mysql);
        System.out.println("还原成功!");
    }

    public static void main(String[] args) {
        String serverUrl = "localhost";
        String userName = "root";
        String pwd = "root";
        DBRecover backup = new DBRecover(serverUrl, userName, pwd);
        try {
            backup.backup("C:\\", "travel");
            // backup.restore(  "C:\\20190505-114732.sql","travel");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
