package com.chinasofti.user.controller;

import com.chinasofti.user.dao.UserDao;
import com.chinasofti.user.entity.User;
import com.chinasofti.user.service.UserService;
import com.chinasofti.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author haoyu
 * date ：2019/4/30
 */
@Controller
@RequestMapping("/userRegister")
public class RegisterController {

    @Autowired
    private UserDao userDao;
    @Autowired
    UserService userService;

    @RequestMapping("/sendCode/{code}/{email}")
    @ResponseBody
    public Integer check(@PathVariable("code")String code, @PathVariable("email")String email){
        User user = userDao.queryByName("email", email);
        Integer state = 0;
        if(email.equals(user.getEmail())){
            if(StringUtil.isNotEmpty(code)&code.equalsIgnoreCase(user.getCode())){
                user.setState(1);
                state = 1;
            }
        }
        return state;
    }

    @RequestMapping("/registe")
    public void register(User user){
        userService.addUser(user);


    }

}
