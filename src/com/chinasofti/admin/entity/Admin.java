package com.chinasofti.admin.entity;

import com.chinasofti.role.entity.Role;
import com.chinasofti.staff.entity.Staff;

/**
 * @Description Admin
 * @Author WYR
 * @CreateTime 2019-04-27 17:29
 */
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

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }
}
