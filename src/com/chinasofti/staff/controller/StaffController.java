package com.chinasofti.staff.controller;


import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.PageBean;
import com.chinasofti.staff.entity.Staff;
import com.chinasofti.staff.service.StaffInterface;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author: Iman
 * date   : 2019/4/28
 */
@Controller
@RequestMapping("/staff")
public class StaffController {
    @Autowired
    StaffInterface staffService;
    @Autowired
//    AdminInterface adminService;


    @RequestMapping("/list")
    public String list(HttpServletRequest request, Map<String, Object> map) {
        PageBean pageBean = new PageBean();
        // 页码
//        String index = request.getParameter("index");
//        if (index == null) {
//            index = "1";
//        }
//        pageBean.setIndex(Integer.parseInt(index));
        // 每页条数
        String pageCount = "5";
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount(staffService.getCount());
//        List<Staff> staffList = staffService.queryByPageBean(pageBean);
//        for (Staff staff : staffList) {
//            System.out.println(staff);
//        }
        map.put("pageBean", pageBean);
//        map.put("staffList", staffList);


        return "/background/staff/stafflist";
    }


    @RequestMapping("/queryOne/{staffId}")
    public String queryOne(@PathVariable(name = "staffId") Integer staffId, HttpServletRequest request) {
        Staff staff = staffService.query(staffId);
        request.setAttribute("staff", staff);
        return "/background/staff/staffedit";

    }

    @RequestMapping("/to/{staffId}")
    public String to(@PathVariable(name = "staffId") Integer staffId, Map<String, Object> map) {
        Staff staff = staffService.query(staffId);
        System.out.println(staff + "========");
        map.put("staff", staff);
        System.out.println(staff + "========");
        return "/background/admin/adminadd";

    }

    @RequestMapping("/addAdmin")
    @ResponseBody
    public Integer addAdmin(Admin admin, Staff staff) {
        admin.setStaff(staff);
        staff.setAdmin(admin);
//        adminService.save(admin);
        staffService.save(staff);
        return 1;
    }


    @Transactional
    @RequestMapping("/add")
    @ResponseBody
    public Integer add(Staff staff) {
        staffService.save(staff);
        return 1;
    }

    @Transactional
    @RequestMapping("/update")
    @ResponseBody
    public Integer update(Staff staff) {

        staffService.update(staff);
        return 1;

    }

    /**
     * 批量删除信息
     *
     * @param ids
     * @return
     */
    @RequestMapping("/deleteAll")
    @ResponseBody
    public Integer deleteList(@RequestParam(name = "staffId") String ids) {

        //判断ids不为空
        if (StringUtils.isNoneBlank(ids)) {
            //分割ids
            String[] split = ids.split(",");
            for (String id : split) {
                List<Staff> staffList = staffService.queryAll();
                Staff staff = null;
                for (Staff a : staffList) {
                    if (a.getStaffId().equals(Integer.valueOf(id))) {
                        staff = a;
                        break;
                    }
                }
                staffService.delete(staff);
            }
        }
        return 1;
    }

    /**
     * 删除信息
     *
     * @param staffId
     * @return
     */
    @RequestMapping("/delete/{staffId}")
    @ResponseBody
    public Integer delete(@PathVariable(value = "staffId") Integer staffId) {
        Staff staff = staffService.query(staffId);
        staffService.delete(staff);
        return 1;
    }


}
