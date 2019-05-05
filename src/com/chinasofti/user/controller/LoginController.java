package com.chinasofti.user.controller;

import com.chinasofti.user.dao.UserDao;
import com.chinasofti.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author haoyu
 * date ：2019/4/30
 */
@Controller
@RequestMapping("/userLogin")
public class LoginController {

    @Autowired
    private UserDao userDao;

    @RequestMapping("/getCode")
    public void getCode(){

    }

    @RequestMapping("/login/{email}/{password}")
    @ResponseBody
    public Integer login(HttpSession session, @PathVariable("email")String email, @PathVariable("password")String password){
        Integer i = 0;
        User user = userDao.queryByName("email", email);
        if(email.equals(user.getEmail())){
            if(password.equals(user.getPassword())){
                i = 1;
                session.setAttribute("user",user);
            }else{
                i = 2;
            }
        }else{
            i = 3;
        }
        return i;
    }



}
