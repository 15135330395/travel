package com.chinasofti.user.controller;

import com.chinasofti.user.dao.UserDao;
import com.chinasofti.user.entity.User;
import com.chinasofti.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @RequestMapping("/register")
    @ResponseBody
    public Integer register(User user){
        User user1 = userDao.queryByName("email", user.getEmail());
        Integer i;
        if (user1 != null) {
            i = 100;
            // 邮箱已存在
        }else{
            Integer integer = userService.addUser(user);
            if (integer == 1) {
                // 1 成功
                i = 1;
            }else{
                // 0 邮箱不存在
                i = 0;
            }
        }
        return i;

    }

}
