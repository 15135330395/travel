package com.chinasofti.admin.entity;

import com.chinasofti.role.entity.Role;
import com.chinasofti.staff.entity.Staff;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @Description Admin
 * @Author WYR
 * @CreateTime 2019-04-27 17:29
 */
@Entity
@Table(name = "admin")
public class Admin {
    /**
     * 后台用户编号
     */
    private Integer adminId;
    /**
     * 用户名
     */
    private String adminName;
    /**
     * 密码
     */
    private String password;
    /**
     * 角色
     */
    private Role role;
    /**
     * 员工
     */
    private Staff staff;

    @Id
    @GeneratedValue(generator = "_native")
    @GenericGenerator(name = "_native", strategy = "native")
    @Column(name = "admin_id")
    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    @Column(name = "admin_name")
    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @ManyToOne(cascade =CascadeType.ALL )
    @JoinColumn(name = "role_id")
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @OneToOne(cascade =CascadeType.ALL )
    @JoinColumn(name = "staff_id")
    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", password='" + password + '\'' +
                ", role=" + role +
                '}';
    }
}
