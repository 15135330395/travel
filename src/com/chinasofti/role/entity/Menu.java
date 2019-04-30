package com.chinasofti.role.entity;

/**
 * @Description Menu
 * @Author WYR
 * @CreateTime 2019-04-27 17:30
 */
public class Menu {
    /**
     * 权限编号
     */
    private Integer menuId;
    /**
     * 权限名
     */
    private String menuName;

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }
}
