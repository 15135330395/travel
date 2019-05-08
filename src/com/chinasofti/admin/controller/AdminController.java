package com.chinasofti.admin.controller;

import com.chinasofti.admin.entity.Admin;
import com.chinasofti.admin.service.AdminInterface;
import com.chinasofti.base.PageBean;
import com.chinasofti.role.entity.Menu;
import com.chinasofti.role.entity.Role;
import com.chinasofti.role.service.MenuService;
import com.chinasofti.role.service.RoleService;
import com.chinasofti.user.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author: Iman
 * date   : 2019/4/28
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminInterface adminService;
    @Autowired
    RoleService roleService;
    @Autowired
    MenuService menuService;

    @RequestMapping("/list")
    public String query(HttpServletRequest request, Map<String, Object> map) {
        PageBean pageBean = new PageBean();
        // 页码
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        pageBean.setIndex(Integer.parseInt(index));
        // 每页条数
        String pageCount = "5";
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount(adminService.count());

        List<Admin> admins = adminService.queryByPageBean(pageBean);


        map.put("pageBean", pageBean);
        map.put("adminList", admins);
        return "/background/admin/adminlist";

    }

    @RequestMapping("/queryOne/{adminId}")
    public String queryOne(@PathVariable(name = "adminId") Integer adminId, HttpServletRequest request) {
        Admin admin = adminService.query(adminId);
        request.setAttribute("admin", admin);

        return "/background/admin/adminedit";

    }

    @RequestMapping("/to/{adminId}")
    public String toGiant(@PathVariable(name = "adminId") Integer adminId, Map<String, Object> map) {
        Admin admin = adminService.query(adminId);
        map.put("admin", admin);
        List<Role> roleList = roleService.queryAll();
        map.put("roleList", roleList);
        return "/background/role/User/GiveUsersARole";

    }

    /**
     * 给用户赋予角色
     * @param adminId
     * @param roleId
     * @return
     */

    @RequestMapping("giveUsersARole/{adminId}/{roleId}")
    @ResponseBody
    public String giant(@PathVariable(name = "adminId") Integer adminId, @PathVariable(name = "roleId") Integer roleId) {
        Admin admin = adminService.query(adminId);
        Role role = roleService.queryRoleById(roleId);
        admin.setRole(role);
        adminService.update(admin);
        return "1";

    }

    @Transactional
    @RequestMapping("/update")
    @ResponseBody
    public Integer update(Admin admin) {
        adminService.update(admin);
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
    public Integer deleteList(@RequestParam(name = "adminId") String ids) {
        //判断ids不为空
        if (StringUtils.isNoneBlank(ids)) {
            //分割ids
            String[] split = ids.split(",");
            for (String id : split) {
                List<Admin> adminList = adminService.queryAll();
                Admin admin = null;
                for (Admin a : adminList) {
                    if (a.getAdminId().equals(Integer.valueOf(id))) {
                        admin = a;
                        break;
                    }
                }
                adminService.delete(admin);
            }
        }
        return 1;
    }

    /**
     * 删除信息
     *
     * @param adminId
     * @return
     */
    @RequestMapping("/delete/{adminId}")
    @ResponseBody
    public Integer delete(@RequestParam(value = "adminId") Integer adminId) {
        List<Admin> adminList = adminService.queryAll();
        Admin admin = null;
        for (Admin a : adminList) {
            if (a.getAdminId().equals(adminId)) {
                admin = a;
                break;
            }
        }
        adminService.delete(admin);
        return 1;
    }

    @RequestMapping("/login")
    @ResponseBody
    public Integer login(Admin admin, HttpSession session) {
        Admin a = adminService.queryByName(admin.getAdminName());
        if (a == null) {
            System.out.println("用户名 " + admin.getAdminName() + " 不存在");
            // 用户名不存在
            return 0;
        } else {
            if (a.getPassword().equals(admin.getPassword())) {
                System.out.println("用户 " + admin.getAdminName() + " 登录成功");
                // 登陆成功
                session.setAttribute("admin", a);
                List<Menu> menuList = menuService.findMenuByUserId(a.getAdminId());
                session.setAttribute("menus", menuList);
                return 2;
            } else {
                // 密码错误
                System.out.println("用户 " + admin.getPassword() + " 的密码错误");
                return 1;
            }
        }
    }

    @RequestMapping("/goBack")
    public String goBack() {
        return "/background/commons/login";
    }


}
