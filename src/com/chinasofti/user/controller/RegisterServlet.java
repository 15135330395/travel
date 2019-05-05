package com.chinasofti.user.controller;//package com.chinasofti.user.controller;
//
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
// * @Description RegisterServlet
// * @Author WYR
// * @CreateTime 2019-04-16 8:47
// */
//@WebServlet(name = "RegisterServlet", urlPatterns = "/RegisterServlet")
//public class RegisterServlet extends HttpServlet {
//    private UserService service = new UserService();
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
//        String action = request.getParameter("action");
//        if ("findUserByEmail".equals(action)) {
//            // 注册时判断邮箱是否存在
//            String email = request.getParameter("email");
//            User user = service.findUserByEmail(email);
//            System.out.println("findUserByEmail：" + user);
//
//
//        } else if ("findUserByUsername".equals(action)) {
//            // 注册时判断用户名是否存在
//            String username = request.getParameter("username");
//            User user = service.findUserByUsername(username);
//            System.out.println("findUserByUsername：" + user);
//            if (user != null) {
//                response.getWriter().print(1);
//            } else {
//                response.getWriter().print(0);
//            }
//
//        } else if ("addUser".equals(action)) {
//            // 用户注册
//            String email = request.getParameter("email");
//            User userByEmail = service.findUserByEmail(email);
//            if (userByEmail == null) {
//                String username = request.getParameter("username");
//                User userByUsername = service.findUserByUsername(username);
//                if (userByUsername == null) {
//                    String name = request.getParameter("name");
//                    String password = request.getParameter("password");
//                    User user = new User(name, username, password, email);
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
