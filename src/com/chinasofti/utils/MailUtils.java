package com.chinasofti.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

public class MailUtils {
    /**
     * @param toMail 目的邮箱
     * @param code   验证码
     * @throws MessagingException
     * @throws GeneralSecurityException
     */
    public static void sendMail(String toMail, String code ) throws MessagingException, GeneralSecurityException {
        // 1、连接邮件服务器的参数配置
        Properties properties = new Properties();
        // 开启debug调试 设置是否显示debug信息 true会在控制台显示相关信息
        properties.setProperty("mail.debug", "true");
        // 设置用户的认证方式
        properties.put("mail.smtp.auth", "true");
        // 设置传输协议
        properties.put("mail.transport.protocol", "smtp");
        // 设置发件人的SMTP服务器地址
        properties.put("mail.smtp.host", "smtp.qq.com");
        // 开启 SSL 加密
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        // 设置是否使用ssl安全连接 (一般都使用)
        properties.put("mail.smtp.ssl.socketFactory", sf);

        // 2、创建定义整个应用程序所需的环境信息的 Session 对象
        Session session = Session.getInstance(properties);
        // 设置调试信息在控制台打印出来
        session.setDebug(true);

        // 3、创建邮件的实例对象
        // 获取邮件对象
        MimeMessage message = new MimeMessage(session);
        // 设置发件人邮箱地址
        message.setFrom(new InternetAddress("535656612@qq.com"));
        // 设置邮件的发送时间,默认立即发送
        message.setSentDate(new Date());
        // 设置邮件标题 必填
        message.setSubject("亲爱的用户，欢迎注册");
        // 设置邮件内容
        // message.setText("邮件正文");
        message.setContent("<h1>请点击以下链接址激活注册:</br><h3>（若无法点击，请复制到浏览器中打开）</h3></h1><h3><a href='http://localhost:8080/userLogin/check/" + toMail + "/" + code + "'>前往激活</a></h3>", "text/html;Charset=UTF-8");

        // 4、根据session对象获取邮件传输对象Transport
        Transport transport = session.getTransport();
        // 设置发件人的账户名（发送人的邮箱地址）和密码（发送人的邮箱的授权码）
        // 密码为在邮箱的设置中开启POP3/SMTP服务得到授权码
        transport.connect("smtp.qq.com", "535656612@qq.com", "jhdshiwougegbgih");
        // 发送给指定的人
        transport.sendMessage(message, new Address[]{new InternetAddress(toMail)});

        //5 、关闭邮件连接
        transport.close();
    }

    public static void main(String[] args) {
        try {
            MailUtils.sendMail("714404821@qq.com", "2580");
        } catch (MessagingException | GeneralSecurityException e) {
            e.printStackTrace();
        }
    }
}