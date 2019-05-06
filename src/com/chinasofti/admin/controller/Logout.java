package com.chinasofti.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @Description Logout
 * @Author WYR
 * @CreateTime 2019-05-06 11:09
 */
@Controller
public class Logout {
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("admin");
        return "background/commons/login";
    }
}
