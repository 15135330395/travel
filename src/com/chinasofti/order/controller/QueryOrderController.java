package com.chinasofti.order.controller;

import com.chinasofti.order.service.OrderService;
import com.chinasofti.utils.MsgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author：Ganlan；
 * @date：2019-04-30；
 */

@Controller
@RequestMapping("/QueryOrderController")
public class QueryOrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/queryOrder")
    public ModelAndView queryOrder(@RequestParam(name = "userId") Integer userId){

        List list = orderService.queryOrder(userId);

        ModelAndView modelAndView = new ModelAndView("/desk/order");

        modelAndView.addObject("orderList",list);
        return modelAndView;
    }

    @RequestMapping("/deleteOrder")
    @ResponseBody
    public MsgUtil deleteOrder(@RequestParam(name = "orderId") Integer orderId){

        int i = orderService.deleteById(orderId);

        if(i != 0){
            return new MsgUtil("删除成功");
        }else{
            return new MsgUtil("删除失败");
        }
    }
}
