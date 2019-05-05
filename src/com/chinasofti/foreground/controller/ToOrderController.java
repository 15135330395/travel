package com.chinasofti.foreground.controller;


import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.service.AttractionService;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.order.entity.Type;
import com.chinasofti.order.service.OrderService;
import com.chinasofti.type.service.TypeService;
import com.chinasofti.utils.DateUtil;
import com.chinasofti.utils.IdUtil;
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
    @Autowired
    AttractionService attractionService;
    @Autowired
    OrderService orderService;
    @Autowired
    TypeService typeService;

    @RequestMapping("/order/{attractionId}")
    public String toOrder(Model model, @PathVariable(name = "attractionId") Integer attractionId){
        Attraction attraction = attractionService.query(attractionId);
        model.addAttribute("attraction",attraction);
        return "/order";
    }
    @ResponseBody
    @RequestMapping("/toOrder")
    public String order(Model model, Orders order, String goTime, Visitor visitor){
//        String[] visitorName = request.getParameterValues("visitorName");
//        String[] cardId = request.getParameterValues("cardId");
//        String[] phone = request.getParameterValues("phone");

        order.setOrderId(IdUtil.genItemId());
        order.setCreateTime(new Date());
        order.setDeparture(DateUtil.formatString(goTime,"yyyy-MM-dd HH:mm:ss"));
        order.setState(0);
        Attraction attraction = attractionService.query(order.getAttraction().getAttractionId());
        order.setAttraction(attraction);
        Type type = typeService.query(order.getType().getTypeId());
        order.setType(type);
//        order.setUser();
        String[] split1 = visitor.getVisitorName().split(",");
        String[] split2 = visitor.getCardId().split(",");
        String[] split3 = visitor.getPhone().split(",");
        List<Visitor> list = new ArrayList<>();

        for (int i = 0; i < split1.length; i++) {
            visitor = new Visitor(split1[i], split2[i], split3[i],order);
            visitorService.addVisitor(visitor);
            list.add(visitor);
        }
        orderService.addorder(order,list.size());

        return "/order";
    }
}
