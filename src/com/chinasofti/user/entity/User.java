package com.chinasofti.user.entity;

import javax.persistence.*;

/**
 * @Description User
 * @Author WYR
 * @CreateTime 2019-04-27 17:32
 */
@Entity
@Table(name = "user")
public class User {
    /**
     * 普通用户编号
     */
    private Integer userId;
    /**
     * 电子邮箱(用户名)
     */
    private String email;
    /**
     * 登录密码
     */
    private String password;
    /**
     * 激活状态(0为未激活，1为已激活)
     */
    private Integer state;
    /**
     * 激活码 邮箱注册时根据邮箱验证
     */
    private String code;

    @Id
    @Column(name = "user_id")
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "state")
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Column(name = "code")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", state=" + state +
                ", code='" + code + '\'' +
                '}';
    }
}
