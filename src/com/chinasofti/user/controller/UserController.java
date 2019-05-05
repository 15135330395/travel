package com.chinasofti.user.controller;

import com.chinasofti.base.PageBean;
import com.chinasofti.user.entity.User;
import com.chinasofti.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author haoyu
 * date ：2019/4/27
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/queryAllUser")
    public ModelAndView queryAll() {
        ModelAndView modelAndView = new ModelAndView("user");
        modelAndView.addObject("UserList",userService.queryAll());
        return modelAndView;
    }

    @RequestMapping("/userByPageBean")
    public String queryByPageBean(HttpServletRequest request) {
        PageBean pageBean = new PageBean();
        String pageIndex = request.getParameter("pageIndex");
        if(pageIndex!=null){
            pageBean.setIndex(Integer.parseInt(pageIndex));
        }
        String pageCount = request.getParameter("pageCount");
        pageBean.setPageCount(Integer.parseInt(pageCount));

        userService.queryByPageBean(pageBean);
        return "userList";
    }

    @RequestMapping("/userById/{id}")
    public String query(@PathVariable(name = "id") Integer id) {
        userService.queryById(id);
        return "userUpdate";
    }

    @RequestMapping("/queryByEmail/{email}")
    public String queryByEmail(@PathVariable(name = "email") String email) {
        userService.queryByEmail(email);
        return "userUpdate";
    }

    @RequestMapping("/addUser")
    public String addVisitor(User user) {
        userService.addUser(user);
        return "userAdd";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user) {
        userService.updateUser(user);
        return "redirect:/user/userByPageBean";
    }

    @RequestMapping("/deleteUser/{id}")
    public String deleteUser(@PathVariable("userId") Integer id) {
        userService.deleteUser(userService.queryById(id));
        return "redirect:/user/userByPageBean";
    }



}
