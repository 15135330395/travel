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

/**
 * @author haoyu
 * date ：2019/4/27
 */
@RestController
@RequestMapping("/visitor")
public class VisitorController {

    @Autowired
    VisitorService visitorService;

    @RequestMapping("/queryAllVisitor")
    public ModelAndView queryAll() {
        ModelAndView modelAndView = new ModelAndView("visitor");
        modelAndView.addObject("visitorList",visitorService.queryAll());
        return modelAndView;
    }

    @RequestMapping("/visitorByPageBean")
    @ResponseBody
    public String queryByPageBean(HttpServletRequest request) {
        PageBean pageBean = new PageBean();
        String pageIndex = request.getParameter("pageIndex");
        if(pageIndex!=null){
            pageBean.setIndex(Integer.parseInt(pageIndex));
        }
        String pageCount = request.getParameter("pageCount");
        pageBean.setPageCount(Integer.parseInt(pageCount));

        visitorService.queryByPageBean(pageBean);
        return "visitorList";
    }

    @RequestMapping("/visitorById/${id}")
    public String query(@PathVariable(name = "id") Integer id) {
        visitorService.query(id);
        return "visitorUpdate";
    }

    @RequestMapping("/addVisitor")
    public String addVisitor(Visitor visitor) {
        visitorService.addVisitor(visitor);
        return "visitorAdd";
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
