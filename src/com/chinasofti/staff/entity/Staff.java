package com.chinasofti.staff.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

import com.chinasofti.admin.entity.Admin;
import com.sun.deploy.util.UpdateCheck;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.sql.Update;

import javax.persistence.*;

/**
 * @Description Staff
 * @Author WYR
 * @CreateTime 2019-04-27 17:32
 */
@Entity
@Table(name = "staff")
public class Staff {
    /**
     * 员工编号
     */
    private Integer staffId;
    /**
     * 员工姓名
     */
    private String staffName;
    /**
     * 员工性别
     */
    private String staffSex;
    /**
     * 身份证号
     */
    private String cardId;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 职务
     */
    private String job;
    /**
     * 工作地
     */
    private String workplace;
    /**
     * 用户
     */
    private Admin admin;

    @Id
    @GeneratedValue(generator = "_native")
    @GenericGenerator(name = "_native", strategy = "native")
    @Column(name = "staff_id")
    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    @Column(name = "staff_name")
    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    @Column(name = "staff_sex")
    public String getStaffSex() {
        return staffSex;
    }

    public void setStaffSex(String staffSex) {
        this.staffSex = staffSex;
    }

    @Column(name = "card_id")
    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "job")
    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    @Column(name = "workplace")
    public String getWorkplace() {
        return workplace;
    }

    public void setWorkplace(String workplace) {
        this.workplace = workplace;
    }

    @OneToOne(cascade= CascadeType.ALL)
    @JoinColumn(name = "admin_id")
    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "staffId=" + staffId +
                ", staffName='" + staffName + '\'' +
                ", staffSex='" + staffSex + '\'' +
                ", cardId='" + cardId + '\'' +
                ", phone='" + phone + '\'' +
                ", job='" + job + '\'' +
                ", workplace='" + workplace + '\'' +
                ", admin=" + admin +
                '}';
    }
}
