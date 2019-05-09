package com.chinasofti.order.controller;

import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.PageBean;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.order.service.OrderService;
import com.chinasofti.staff.entity.Staff;
import com.chinasofti.staff.service.StaffInterface;
import com.chinasofti.visitor.entity.Visitor;
import com.chinasofti.visitor.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    private VisitorService visitorService;

    @Autowired
    private StaffInterface StaffService;

    //    前台用户查询自己订单方法
    @RequestMapping("/queryOrder/{userId}")
    public ModelAndView queryOrder(@PathVariable(name = "userId") Integer userId, HttpServletRequest request) {

        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }

        int startIndex = (Integer.parseInt(index)-1)*10;
        int endIndex = (startIndex+9);

        List<Orders> list = orderService.queryOrder(userId);

        for (Orders orders : list) {
            List<Visitor> visitors = visitorService.queryByOrderId(orders.getOrderId());
            orders.setVisitorList(visitors);
        }

        ArrayList<Object> arrayList = new ArrayList<>();

        for (int i = startIndex; i <= endIndex; i++) {

            if(i>list.size()-1){
                break;
            }else {
                Orders orders = list.get(i);
                arrayList.add(orders);
            }
        }

        int pageNum = list.size() % 10 == 0 ? list.size() / 10 : list.size()/ 10 + 1;

        ModelAndView modelAndView = new ModelAndView("/desk/order");

        modelAndView.addObject("orderList", arrayList);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("index", index);
        return modelAndView;
    }

    //    前台退单方法
    @RequestMapping("/deleteOrder/{orderId}")
    @ResponseBody
    public int deleteOrder(@PathVariable(name = "orderId") String orderId) {

        int i = orderService.deleteById(orderId);

        return 1;
    }

    //    前台支付订单显示方法
    @RequestMapping("/toApply/{orderId}")
    @ResponseBody
    public ModelAndView toApply(@PathVariable(name = "orderId") String orderId) {

        Orders order = orderService.query(Long.valueOf(orderId));

        ModelAndView modelAndView = new ModelAndView("/desk/apply");

        modelAndView.addObject("order", order);
        return modelAndView;
    }

    //    前台用户订单支付状态修改方法
    @RequestMapping("/changeState")
    @ResponseBody
    public ModelAndView changeState(@RequestParam(name = "orderId") String orderId, @RequestParam(name = "typeName") String typeName) {

        if("散客游".equals(typeName)){
            List<Staff> staffList = StaffService.queryAll();

            int id = (int) (Math.random() * (staffList.size()));

            Staff staff = staffList.get(id);

            orderService.changeState(Long.valueOf(orderId), staff);
        }else{
            orderService.changeState(Long.valueOf(orderId));
        }

        ModelAndView modelAndView = new ModelAndView("/desk/center");

        return modelAndView;
    }

    @RequestMapping("query")
    public String qureyAll(HttpServletRequest request, Map<String, Object> map) {
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        PageBean pageBean = new PageBean();
        pageBean.setIndex(Integer.parseInt(index));
        pageBean.setPageCount(10);
        pageBean.setCount(orderService.queryAll().size());
        List<Orders> orderList = orderService.queryBypage(pageBean);

        map.put("pageBean", pageBean);
        map.put("orderList", orderList);
        return "/background/link/order";
    }

    @RequestMapping("queryOne")
    public String queryOne(HttpServletRequest request, Map<String, Object> map) {

        String a = request.getParameter("order_id");
        long orderId = Long.parseLong(a);
        Orders order = orderService.query(orderId);
        List<Visitor> queryVisitorByOrder = orderService.queryVisitorByOrder(orderId);
        map.put("queryVisitorByOrder", queryVisitorByOrder);
        map.put("order", order);
        return "/background/link/order_view";
    }


    @RequestMapping("queryBySid")
    public String queryList(HttpServletRequest request, HttpSession session, Map<String, Object> map) {

        Admin attribute = (Admin) session.getAttribute("admin");

        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        PageBean pageBean = new PageBean();
        pageBean.setIndex(Integer.parseInt(index));
        pageBean.setPageCount(10);

        Integer staffId = attribute.getStaff().getStaffId();
        List<Orders> queryBySid = orderService.queryOrderBySid(staffId);

        pageBean.setCount(queryBySid.size());

//        Integer staffId = attribute.getStaff().getStaffId();
//        List<Orders> queryOrderBySid = orderService.queryOrderBySid(staffId);

        List<Orders> queryOrderBySid = orderService.queryByPage(pageBean, staffId);

        System.out.println(queryOrderBySid.toString());

        map.put("pageBean", pageBean);
        map.put("queryOrderBySid", queryOrderBySid);

        return "/background/link/order2";
    }

}
