package com.chinasofti.visitor.controller;

import com.chinasofti.base.PageBean;
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
import java.util.List;

/**
 * @author haoyu
 * date ：2019/4/27
 */
@Controller
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
        ModelAndView modelAndView = new ModelAndView("/background/visitor/visitorList");
        modelAndView.addObject("visitorList",visitors);
        modelAndView.addObject("pageBean",pageBean);
        return modelAndView;
    }

    @RequestMapping("/addVisitor")
    @ResponseBody
    public Integer addVisitor(Visitor visitor) {
        visitorService.addVisitor(visitor);
        return 1;
    }

    @RequestMapping("/updateVisitor")
    @ResponseBody
    public Integer updateVisitor(Visitor visitor) {
        visitorService.updateVisitor(visitor);
        return 1;
    }

    @RequestMapping("/deleteVisitor")
    @ResponseBody
    public Integer deleteVisitor(@RequestParam(name ="visitorId") Integer id) {
        List<Visitor> list = visitorService.queryAll();
        Visitor visitor=null;
        for(Visitor v:list){
            if(v.getVisitorId().equals(id)){
                visitor=v;
                break;
            }
        }
        visitorService.deleteVisitor(visitor);
        return 1;
    }

    @RequestMapping("/toupdate/{visitorId}")
    public ModelAndView toupdate(@PathVariable(name = "visitorId")Integer visitorId){
        List<Visitor> list = visitorService.queryAll();
        Visitor visitor=null;
        for(Visitor v:list){
            if(v.getVisitorId().equals(visitorId)){
                visitor=v;
                break;
            }
        }
        ModelAndView mv=new ModelAndView("/background/visitor/visitorUpdate");
        mv.addObject("visitor",visitor);
        return mv;

    }

}
