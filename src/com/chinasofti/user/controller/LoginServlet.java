package com.chinasofti.user.controller;//package com.chinasofti.user.controller;
//
//import com.chinasofti.user.entity.User;
//import com.chinasofti.user.service.UserService;
//import com.news.entity.User;
//import com.news.service.UserService;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
///**
// * @Description LoginServlet
// * @Author WYR
// * @CreateTime 2019-04-16 8:47
// */
//@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")
//public class LoginServlet extends HttpServlet {
//    private UserService service = new UserService();
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
//        String action = request.getParameter("action");
//        if ("findUserByEmail".equals(action)) {
//            // 用户重置密码
//            // 注册时判断邮箱是否存在
//            String email = request.getParameter("email");
//            User user = service.findUserByEmail(email);
//            System.out.println("findUserByEmail：" + user);
//
//
//        } ("addUser".equals(action)) {
//            // 用户注册
//            String email = request.getParameter("email");
//            User userByEmail = service.findUserByEmail(email);
//            if (userByEmail == null) {
//                String username = request.getParameter("username");
//                User userByUsername = service.findUserByUsername(username);
//                if (userByUsername == null) {
//                    String password = request.getParameter("password");
//                    User user = new User(username, password, email);
//                    Integer i = service.register(user);
//                    response.getWriter().print(i);
//                } else {
//                    System.out.println(username + " 用户名已被使用");
//                    response.getWriter().print(3);
//                }
//            } else {
//                System.out.println(email + " 邮箱已被使用");
//                response.getWriter().print(2);
//            }
//
//
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);
//    }
//}
