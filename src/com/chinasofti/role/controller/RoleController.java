package com.chinasofti.role.controller;

import com.chinasofti.base.PageBean;
import com.chinasofti.role.entity.Menu;
import com.chinasofti.role.entity.MenuRole;
import com.chinasofti.role.entity.Role;
import com.chinasofti.role.service.MenuRoleService;
import com.chinasofti.role.service.MenuService;
import com.chinasofti.role.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @Description RoleController
 * @Author WYR
 * @CreateTime 2019-04-28 9:55
 */
@Controller
@RequestMapping("role")
public class RoleController {
    @Autowired
    private RoleService service;
    @Autowired
    private MenuService menuService;
    @Autowired
    private MenuRoleService menuRoleService;

    /* layui数据表格无法获得行信息，改为普通表格
    @RequestMapping("all")
    @ResponseBody
    public JSONObject getAllRoleByPage(HttpServletRequest request) {
        PageBean pageBean = new PageBean();
        // 页码
        String pageIndex = request.getParameter("page");
        if (pageIndex != null) {
            pageBean.setIndex(Integer.parseInt(pageIndex));
        }
        // 每页条数
        String pageCount = request.getParameter("limit");
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount(service.getCount());
        List<Role> roleList = service.queryByPageBean(pageBean);
        System.out.println(JsonUtil.getJsonObject(roleList, pageBean));
        return JsonUtil.getJsonObject(roleList, pageBean);
    }
    */
    @RequestMapping("all")
    public String getAllRoleByPage(HttpServletRequest request, Map<String, Object> map) {
        PageBean pageBean = new PageBean();
        // 页码
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        pageBean.setIndex(Integer.parseInt(index));
        // 每页条数
        String pageCount = "10";
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount(service.getCount());
        List<Role> roleList = service.queryByPageBean(pageBean);
        map.put("pageBean", pageBean);
        map.put("roleList", roleList);
        return "/background/role/Role/RoleList";
    }
/*
    @RequestMapping("query/{place}")
    public String getAllRoleByPlace(@PathVariable(name = "place") String place, HttpServletRequest request, Map<String, Object> map) {
        PageBean pageBean = new PageBean();
        // 页码
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        pageBean.setIndex(Integer.parseInt(index));
        // 每页条数
        String pageCount = "10";
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount(service.getCountByPlace(place));
        System.out.println(service.getCountByPlace(place));
        List<Role> roleList = service.queryByPageBeanAndPlace(pageBean, place);
        for (Role role : roleList) {
            System.out.println(role);
        }
        map.put("pageBean", pageBean);
        map.put("roleList", roleList);
        return "/background/role/Role/RoleList" ;
    }
*/

    @RequestMapping(value = "add")
    @ResponseBody
    public Integer add(Role role) {
        service.addRole(role);
        return 1;
    }

    @RequestMapping("{id}")
    public String queryRole(@PathVariable(name = "id") String id, Map<String, Object> map) {
        Role role = service.queryRoleById(Integer.parseInt(id));
        map.put("role", role);
        return "/background/role/Role/EditRole";
    }

    @RequestMapping("update")
    @ResponseBody
    public Integer updateRole(Role role) {
        service.updateRole(role);
        return 1;
    }

    @RequestMapping("delete/{id}")
    @ResponseBody
    public Integer deleteRole(@PathVariable(name = "id") String id) {
        menuRoleService.deleteMenuRoleByRoleId(Integer.parseInt(id));
        service.delete(Integer.parseInt(id));
        return 1;
    }

    @RequestMapping("to/{id}")
    public String toGrant(@PathVariable(name = "id") Integer id, Map<String, Object> map) {
        Role role = service.queryRoleById(id);
        map.put("role", role);

        List<Menu> menuList = menuService.query();
        map.put("menus", menuList);

        return "/background/role/Role/GrantRole";
    }

    @RequestMapping("grant/{roleId}")
    @ResponseBody
    public Integer grant(@PathVariable(name = "roleId") String roleId, HttpServletRequest request) {
        menuRoleService.deleteMenuRoleByRoleId(Integer.parseInt(roleId));
        String ids = request.getParameter("menuIds");
        String[] menuIds = ids.split(",");
        int success = 0;
        for (String menuId : menuIds) {
            int id = Integer.parseInt(menuId);
            menuRoleService.addMenuRole(new MenuRole(id, Integer.parseInt(roleId)));
            success += 1;
        }
        return success;
    }
}
