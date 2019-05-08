package com.chinasofti.user.controller;

import com.chinasofti.base.PageBean;
import com.chinasofti.user.entity.User;
import com.chinasofti.user.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author haoyu
 * date ：2019/4/27
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/userByPageBean")
    @ResponseBody
    public ModelAndView queryByPageBean( HttpServletRequest request ) {
//        System.out.println("userByPageBean...");
        PageBean pageBean = new PageBean();
        String index="1";
        String strIndex = request.getParameter("index");
        if(strIndex!=null){
            index=strIndex;
        }
        pageBean.setIndex(Integer.parseInt(index));
//        System.out.println("index===="+index);
        Integer pageCount=5;
        pageBean.setPageCount(pageCount);
        pageBean.setCount(userService.getCount());
        List<User> users = userService.queryByPageBean(pageBean);
        ModelAndView modelAndView = new ModelAndView("/background/user/userList");
        modelAndView.addObject("userList",users);
        modelAndView.addObject("pageBean",pageBean);
        return modelAndView;
    }
    @RequestMapping("/addUser")
    @ResponseBody
    public Integer addUser(User user) {
        System.out.println("add...."+user);
        Integer i = userService.addUser(user);
        return i;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Integer updateUser(User user) {
        System.out.println("updateUser...."+user);

        userService.updateUser(user);
        return 1;
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public Integer deleteUser(@RequestParam(name = "userId") Integer id) {
//        System.out.println("delete....."+id);
        List<User> list = userService.queryAll();
        User user=null;
        for(User u:list){
            if(u.getUserId().equals(id)){
               user=u;
               break;
            }
        }
        userService.deleteUser(user);
//        System.out.println("toupdate..."+user);
        return 1;
    }

    @RequestMapping("/toupdate/{userId}")
    public ModelAndView toupdate(@PathVariable(name = "userId")Integer userId){
//        System.out.println("toupdate...."+userId);
        List<User> list = userService.queryAll();
        User user=null;
        for(User u:list){
            if(u.getUserId().equals(userId)){
                user=u;
                break;
            }
        }
        ModelAndView mv=new ModelAndView("/background/user/userUpdate");
        mv.addObject("user",user);
        return mv;
    }

    @RequestMapping("/deleteAll")
    @ResponseBody
    public Integer deleteAll(@RequestParam(value = "ids") String ids){
//        System.out.println("deleteALl..."+ids);
        int sum=0;
        if(StringUtils.isNoneBlank(ids)) {
            String[] idArr = ids.split(",");
            for (String id : idArr) {
                User user = null;
                List<User> list = userService.queryAll();
                for (User u : list) {
                    if (u.getUserId().equals(Integer.valueOf(id))) {
                        user = u;
                        break;
                    }
                }
                userService.deleteUser(user);
                sum += 1;
            }
        }

       return sum;
    }



}
