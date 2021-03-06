package com.chinasofti.foreground.controller;


import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.service.AttractionService;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.order.entity.Type;
import com.chinasofti.order.service.OrderService;
import com.chinasofti.team.entity.Team;
import com.chinasofti.team.service.TeamService;
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
    @Autowired
    TeamService teamService;

    /**
     * 去下订单页面
     *
     * @param model
     * @param attractionId
     * @return
     */
    @RequestMapping("/order/{attractionId}")
    public String toOrder(Model model, @PathVariable(name = "attractionId") Integer attractionId) {
        Attraction attraction = attractionService.query(attractionId);
        model.addAttribute("attraction", attraction);
        return "/order";
    }

    /**
     * 去组团信息表
     *
     * @param model
     * @param attractionId
     * @return
     */
    @RequestMapping("/team/{attractionId}")
    public String team(Model model, @PathVariable(name = "attractionId") Integer attractionId) {
        List<Team> teamList = teamService.queryByAttractionId(attractionId);
        model.addAttribute("teamList", teamList);
        return "/team";
    }

    /**
     * 组团下订单
     *
     * @param model
     * @param teamId
     * @return
     */
    @RequestMapping("/teamOrder/{teamId}")
    public String teamOrder(Model model, @PathVariable(name = "teamId") Integer teamId) {
        Team team = teamService.queryByTeamId(teamId);
        model.addAttribute("team", team);
        return "/teamOrder";
    }

    /**
     * 获取订单信息，写入数据库，并返回自己订单列表
     *
     * @param request
     * @param order
     * @param goTime
     * @param visitor
     * @return
     */
    @ResponseBody
    @RequestMapping("/toOrder")
    public ModelAndView order(HttpServletRequest request, Orders order, String goTime, Visitor visitor) {
        order.setOrderId(IdUtil.genItemId());
        order.setCreateTime(new Date());
        order.setDeparture(DateUtil.formatString(goTime, "yyyy-MM-dd HH:mm:ss"));
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
            visitor = new Visitor(split1[i], split2[i], split3[i], order);
            visitorService.addVisitor(visitor);
            list.add(visitor);
        }
        orderService.addorder(order, list.size());
        ModelAndView modelAndView = new ModelAndView("/desk/center");
        return modelAndView;
    }

    /**
     * 获取组团信息，写入数据库,并返回自己订单列表
     * @param request
     * @param team
     * @param order
     * @param goTime
     * @param visitor
     * @param typeId
     * @return
     */
    @ResponseBody
    @RequestMapping("/toTeamOrder")
    public Integer teamOrder(HttpServletRequest request, Team team, Orders order, String goTime, Visitor visitor, Integer typeId) {
        Team queryTeam = teamService.queryByTeamId(team.getTeamId());
        order.setOrderId(IdUtil.genItemId());
        User user = (User) request.getSession().getAttribute("user");
        order.setUser(user);
        order.setAttraction(queryTeam.getAttraction());
        Type type = typeService.query(typeId);
        order.setType(type);
        order.setStaff(queryTeam.getStaff());
        order.setCreateTime(new Date());
        order.setDeparture(DateUtil.formatString(goTime, "yyyy-MM-dd HH:mm:ss"));
        order.setPlace(queryTeam.getPlace());
        order.setState(0);
        String[] split1 = visitor.getVisitorName().split(",");
        String[] split2 = visitor.getCardId().split(",");
        String[] split3 = visitor.getPhone().split(",");
        List<Visitor> list = new ArrayList<>();
        for (int i = 0; i < split1.length; i++) {
            visitor = new Visitor(split1[i], split2[i], split3[i], order);
            list.add(visitor);
        }
        int predict = queryTeam.getPredict();
        int current = queryTeam.getCurrent();
        int sum = current + list.size();
        if (sum <= predict) {
            for (Visitor v : list) {
                visitorService.addVisitor(v);
            }
            queryTeam.setCurrent(sum);
            teamService.updateTeam(queryTeam);
            order.setTeam(queryTeam);
            orderService.addorder(order, list.size());
            return  1;
        }else {
            return 0;
        }
    }
}
