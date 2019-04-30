package com.chinasofti.foreground.controller;


import com.chinasofti.order.entity.Orders;
import com.chinasofti.utils.DateUtil;
import com.chinasofti.visitor.entity.Visitor;
import com.chinasofti.visitor.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author: LiGX
 * @Date: 2019-04-29 下午 5:44
 */
@Controller
@RequestMapping("foreground")
public class ToOrderController {
    @Autowired
    VisitorService visitorService;

    @RequestMapping("/order/{attractionId}")
    public String toOrder(Model model, @PathVariable(name = "attractionId") Integer attractionId){
        model.addAttribute("attractionId",attractionId);
        return "/order";
    }
    @ResponseBody
    @RequestMapping("/toOrder")
    public String order(Model model, Orders order, String departure, Visitor visitor){
        String[] split1 = visitor.getVisitorName().split(",");
        String[] split2 = visitor.getCardId().split(",");
        String[] split3 = visitor.getPhone().split(",");
        List<Visitor> list = new ArrayList<>();
        for (int i = 0; i < split1.length; i++) {
            visitor = new Visitor(split1[i], split2[i], split3[i]);

            list.add(visitor);
        }
        System.out.println(list);
        System.out.println(order);
        order.setCreateTime(new Date());
        order.setDeparture(DateUtil.formatString(departure,"yyyy-MM-dd HH:mm:ss"));
        if(list.size()>=20){
            order.setTypeId(1);
        }else {
            order.setTypeId(2);
        }
        return "/order";
    }
}
