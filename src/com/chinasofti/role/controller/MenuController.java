package com.chinasofti.role.controller;

import com.chinasofti.base.PageBean;
import com.chinasofti.role.entity.Menu;
import com.chinasofti.role.service.MenuService;
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
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuService service;

    @RequestMapping("all")
    public String getAllMenuByPage(HttpServletRequest request, Map<String, Object> map) {
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
        List<Menu> menuList = service.queryByPageBean(pageBean);
        map.put("pageBean", pageBean);
        map.put("menuList", menuList);
        return "/background/role/Menu/MenuList";
    }

    @RequestMapping("add")
    @ResponseBody
    public Integer addMenu(Menu menu) {
        service.addMenu(menu);
        return 1;
    }

    @RequestMapping("{id}")
    public String queryRole(@PathVariable(name = "id") String id, Map<String, Object> map) {
        Menu menu = service.queryMenu(Integer.parseInt(id));
        map.put("menu", menu);
        return "/background/role/Menu/EditMenu";
    }

    @RequestMapping("update")
    @ResponseBody
    public Integer updateMenu(Menu menu) {
        service.updateMenu(menu);
        return 1;
    }

    @RequestMapping("delete/{id}")
    @ResponseBody
    public Integer deleteMenu(@PathVariable(name = "id") Integer menuId) {
        service.deleteMenu(menuId);
        return 1;
    }

    @RequestMapping("login")
    public String findMenuByUserId(Integer userId, Map<String, Object> map) {
        List<Menu> menuList = service.findMenuByUserId(userId);
        map.put("menuList", menuList);
        return "";
    }


}
