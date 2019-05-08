package com.chinasofti.staff.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.staff.entity.Staff;


import java.util.List;

/**
 * @author: Iman
 * date   : 2019/4/28
 */
public interface StaffInterface {
    /**
     * 获得分页的员工列表
     * @param pageBean
     * @return
     */
    public List<Staff> queryByPageBean(PageBean pageBean);
    /**
     * 保存员工
     * @param staff
     * @return
     */
    public void save(Staff staff);
    /**
     * 通过id查询员工
     * @param id
     * @return
     */
    public Staff query(Integer id);
    /**
     * 更新员工信息
     * @param staff
     * @return
     */
    public void update(Staff staff);
    /**
     * 删除员工
     * @param staff
     * @return
     */
    public void delete(Staff staff);
    /**
     * 查询全部员工
     * @return
     */
    public List<Staff> queryAll();
    /**
     * 获得员工总数
     * @return
     */
    public Integer getCount();
    /**
     * 获得分页的区域员工列表
     * @param pageBean
     * @param workspace
     * @return
     */
    List<Staff> queryByPageBeanAndWorkspace(PageBean pageBean, String workspace);
    /**
     * 获得区域员工的数量
     * @param workspace
     * @return
     */
    public Integer getCountByWorkspace(String workspace);


    public Integer queryByJob(String job);
}
