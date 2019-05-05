package com.chinasofti.order.controller;

import com.chinasofti.order.service.OrderService;
import com.chinasofti.utils.MsgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping("/queryOrder/{userId}")
    public ModelAndView queryOrder(@PathVariable(name = "userId") Integer userId){

        List list = orderService.queryOrder(userId);

        ModelAndView modelAndView = new ModelAndView("/desk/order");

        modelAndView.addObject("orderList",list);
        return modelAndView;
    }

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
}
