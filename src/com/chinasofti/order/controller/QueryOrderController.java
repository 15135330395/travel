package com.chinasofti.order.controller;

import com.chinasofti.base.PageBean;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.order.service.OrderService;
import com.chinasofti.staff.entity.Staff;
import com.chinasofti.staff.service.StaffInterface;
import com.chinasofti.utils.MsgUtil;
import com.chinasofti.visitor.entity.Visitor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author：Ganlan；
 * @date：2019-04-30；
 */

@Controller
@RequestMapping("/QueryOrderController")
public class QueryOrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private StaffInterface StaffService;

//    前台用户查询自己订单方法
    @RequestMapping("/queryOrder/{userId}")
    public ModelAndView queryOrder(@PathVariable(name = "userId") Integer userId){

        List list = orderService.queryOrder(userId);

        ModelAndView modelAndView = new ModelAndView("/desk/order");

        modelAndView.addObject("orderList",list);
        return modelAndView;
    }

//    前台退单方法
    @RequestMapping("/deleteOrder/{orderId}")
    @ResponseBody
    public MsgUtil deleteOrder(@PathVariable(name = "orderId") String orderId){

        int i = orderService.deleteById(orderId);

        if(i != 0){
            MsgUtil 退单成功 = new MsgUtil("退单成功");
            return 退单成功;
        }else{
            MsgUtil 退单失败 = new MsgUtil("退单失败");
            return 退单失败;
        }
    }

//    前台支付订单显示方法
    @RequestMapping("/toApply/{orderId}")
    @ResponseBody
    public ModelAndView toApply(@PathVariable(name = "orderId") String orderId){

        Orders order = orderService.query(Long.valueOf(orderId));

        ModelAndView modelAndView = new ModelAndView("/desk/apply");

        modelAndView.addObject("order",order);
        return modelAndView;
    }

//    前台用户订单支付状态修改方法
    @RequestMapping("/changeState/{orderId}")
    @ResponseBody
    public ModelAndView changeState(@PathVariable(name = "orderId") String orderId, HttpSession session){

        List<Staff> staffList = StaffService.queryAll();

        int id = (int) (Math.random() * (staffList.size()));

        Staff staff = staffList.get(id);


        orderService.changeState(Long.valueOf(orderId),staff);



        ModelAndView modelAndView = new ModelAndView("/desk/center");

        return modelAndView;
    }


















    @RequestMapping("query")
    public String qureyAll(HttpServletRequest request, Map<String,Object> map) {
        String index = request.getParameter("index");
        if (index == null) {
            index="1";
        }
        PageBean pageBean = new PageBean();
        pageBean.setIndex(Integer.parseInt(index));
        pageBean.setPageCount(10);
        pageBean.setCount(orderService.queryAll().size());
        List<Orders> orderList = orderService.queryBypage(pageBean);
        System.out.println(orderList.toString());
        map.put("pageBean", pageBean);
        map.put("orderList",orderList);
        return "/background/link/order";
    }

    @RequestMapping("queryOne")
    public String queryOne(HttpServletRequest request,Map<String,Object> map) {

        String a = request.getParameter("order_id");
        long orderId = Long.parseLong(a);
        Orders order = orderService.query(orderId);
        List<Visitor> queryVisitorByOrder = orderService.queryVisitorByOrder(orderId);
        map.put("queryVisitorByOrder", queryVisitorByOrder);
        map.put("order", order);
        return "/background/link/order_view";
    }

}
