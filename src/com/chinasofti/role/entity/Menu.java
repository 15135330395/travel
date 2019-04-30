package com.chinasofti.role.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @Description Menu
 * @Author WYR
 * @CreateTime 2019-04-27 17:30
 */
@Entity
@Table(name = "menu")
public class Menu {
    /**
     * 权限编号
     */
    private Integer menuId;
    /**
     * 权限名
     */
    private String menuName;
    /**
     * 父节点编号
     */
    private Integer parentId;
    /**
     * 显示图标
     */
    private String img;
    /**
     * 访问路径
     */
    private String url;

    @Id
    @GeneratedValue(generator = "_native")
    @GenericGenerator(name = "_native", strategy = "native")
    @Column(name = "menu_id")
    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    @Column(name = "menu_name")
    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    @Column(name = "parent_id")
    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @Column(name = "img")
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Column(name = "url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
