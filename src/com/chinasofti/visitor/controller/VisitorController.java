package com.chinasofti.visitor.controller;

import com.chinasofti.base.PageBean;
import com.chinasofti.visitor.entity.Visitor;
import com.chinasofti.visitor.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author haoyu
 * date ：2019/4/27
 */
@RestController
@RequestMapping("/visitor")
public class VisitorController {

    @Autowired
    VisitorService visitorService;

    @RequestMapping("/visitorByPageBean")
    @ResponseBody
    public ModelAndView queryByPageBean(HttpServletRequest request) {
        PageBean pageBean = new PageBean();
        String index="1";
        String strIndex = request.getParameter("index");
        if(strIndex!=null){
            index=strIndex;
        }
        pageBean.setIndex(Integer.parseInt(index));
        System.out.println("index===="+index);
        Integer pageCount=5;
        pageBean.setPageCount(pageCount);
        pageBean.setCount(visitorService.getCount());
        List<Visitor> visitors = visitorService.queryByPageBean(pageBean);
        ModelAndView modelAndView = new ModelAndView("/background/user/userList");
        modelAndView.addObject("visitorList",visitors);
        modelAndView.addObject("pageBean",pageBean);
        return modelAndView;
    }

    @RequestMapping("/visitorById/${id}")
    public String query(@PathVariable(name = "id") Integer id) {
        visitorService.query(id);
        return "visitorUpdate";
    }

    @RequestMapping("/addVisitor")
    public Integer addVisitor(Visitor visitor) {
        visitorService.addVisitor(visitor);
        return 1;
    }

    @RequestMapping("/updateVisitor")
    public String updateVisitor(Visitor visitor) {
        visitorService.updateVisitor(visitor);
        return "redirect:/visitor/visitorByPageBean";
    }

    @RequestMapping("/deleteVisitor/${id}")
    public String deleteVisitor(@PathVariable("visitorId") Integer id) {
        visitorService.deleteVisitor(visitorService.query(id));
        return "redirect:/visitor/visitorByPageBean";
    }

}
