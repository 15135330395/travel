package com.chinasofti.user.controller;// package com.chinasofti.user.controller;
//
//import com.news.entity.User;
//import com.news.service.UserService;
//import com.news.utils.UUIDUtils;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
///**
// * @Description RegisterServlet2
// * @Author WYR
// * @CreateTime 2019-04-27 18:25
// */
//@WebServlet(name = "RegisterServlet2", urlPatterns = "/RegisterServlet2")
//public class RegisterServlet2 {
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        //接收表格传进来的数据
//        request.setCharacterEncoding("utf-8");   //设置编码
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String email = request.getParameter("email");
//
//        //数据封装
//        User user = new User();
//        user.setUsername(username);
//        user.setPassword(password);
//        user.setEmail(email);
//        user.setState(0);   //0:未激活     1：已激活
//        String code = UUIDUtils.getUUID();  //得到的编码去掉所有"-"，剩32位
//        user.setCode(code);
//
//        //调用业务层传递用户信息
//        UserService userService = new UserService();
//        userService.register(user);
//
//        //页面跳转
//        request.setAttribute("msg", "您已注册成功，请去邮箱激活！");
//        request.getRequestDispatcher("/msg.jsp").forward(request, response);
//    }
//
//    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);   //记得一定要调用这个
//    }
//}
