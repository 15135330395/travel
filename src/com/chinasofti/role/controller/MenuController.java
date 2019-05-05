package com.chinasofti.role.controller;

import com.chinasofti.role.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @Description RoleController
 * @Author WYR
 * @CreateTime 2019-04-28 9:55
 */
@Controller
public class MenuController {
    @Autowired
    private MenuService service;

}
