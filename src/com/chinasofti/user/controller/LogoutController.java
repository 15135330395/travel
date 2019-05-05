package com.chinasofti.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: LiGX
 * @Date: 2019-05-05 上午 11:46
 */
@Controller
@RequestMapping("/userLogout")
public class LogoutController {
    @RequestMapping("/logout")
    public String userLogout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "/index";
    }
}
