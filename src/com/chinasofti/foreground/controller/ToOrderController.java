package com.chinasofti.foreground.controller;


import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.service.AttractionService;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.order.entity.Type;
import com.chinasofti.order.service.OrderService;
import com.chinasofti.type.service.TypeService;
import com.chinasofti.user.entity.User;
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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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

    /**
     * 去下订单页面
     * @param model
     * @param attractionId
     * @return
     */
    @RequestMapping("/order/{attractionId}")
    public String toOrder(Model model, @PathVariable(name = "attractionId") Integer attractionId){
        Attraction attraction = attractionService.query(attractionId);
        model.addAttribute("attraction",attraction);
        return "/order1";
    }

    /**
     * 获取订单信息，写入数据库，并返回自己订单列表
     * @param request
     * @param order
     * @param goTime
     * @param visitor
     * @return
     */
    @ResponseBody
    @RequestMapping("/toOrder")
    public ModelAndView order(HttpServletRequest request, Orders order, String goTime, Visitor visitor){
        order.setOrderId(IdUtil.genItemId());
        order.setCreateTime(new Date());
        order.setDeparture(DateUtil.formatString(goTime,"yyyy-MM-dd HH:mm:ss"));
        order.setState(0);
        Attraction attraction = attractionService.query(order.getAttraction().getAttractionId());
        order.setAttraction(attraction);
        Type type = typeService.query(order.getType().getTypeId());
        order.setType(type);
        User user = (User) request.getSession().getAttribute("user");
        order.setUser(user);
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
        ModelAndView modelAndView = new ModelAndView("/desk/center");
        return modelAndView;
    }
}
