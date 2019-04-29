package com.chinasofti.attraction.controller;

import com.alibaba.fastjson.JSONObject;
import com.chinasofti.attraction.dao.AttractionDao;
import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.service.AttractionService;
import com.chinasofti.base.PageBean;
import com.chinasofti.role.entity.Role;
import com.chinasofti.utils.DateUtil;
import com.chinasofti.utils.JsonUtil;
import com.chinasofti.utils.StringUtil;
import jdk.management.resource.internal.inst.StaticInstrumentation;
import org.apache.commons.lang3.StringUtils;
import org.quartz.Job;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.ContentCachingRequestWrapper;

import javax.servlet.GenericFilter;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/attraction")
public class AttractionController {
    @Autowired
    private AttractionService attractionService;

    @Autowired
    private AttractionDao attractionDao;
    /**
     * 景点查询
     * @param model
     * @return
     */
    @RequestMapping("findAll")
    public String findAll(Model model){
        List<Attraction> attractionList = attractionService.queryAll();
        model.addAttribute("attractionList",attractionList);
        System.out.println(attractionList);
        return "attractionList";
    }
    /**
     * 批量删除景点信息
     * @param ids
     * @return
     */
    @RequestMapping("/deleteList")
    @ResponseBody
    public Integer deleteList(@RequestParam(name = "ids")String ids){
        System.out.println("========"+ids);
        //判断ids不为空
        if(StringUtils.isNoneBlank(ids)){
            //分割ids
            String[] split = ids.split(",");
            for ( String id: split ) {
                List<Attraction> attractionList = attractionService.queryAll();
                Attraction attraction = null;
                for (Attraction a:attractionList){
                    if (a.getAttractionId().equals(Integer.valueOf(id))){
                        attraction = a;
                        break;
                    }
                }
                attractionService.delete(attraction);
            }
        }
        return 1;
    }
    /**
     * 删除景点信息
     * @param attractionId
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Integer delete(@RequestParam(value = "attractionId")Integer attractionId){
        System.out.println(attractionId+"==========");
        List<Attraction> attractionList = attractionService.queryAll();
        Attraction attraction = null;
        for (Attraction a:attractionList){
            if (a.getAttractionId().equals(attractionId)){
                attraction = a;
                break;
            }
        }
        attractionService.delete(attraction);
        /*  return "redirect:/attraction/query";*/
        return 1;
    }

    /**
     * 添加景点信息
     * @param attraction
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Integer add(Attraction attraction){
        attractionService.add(attraction);
        return 1;
    }

    /**
     * 分页查询景点信息
     * @param request
     * @return
     */
    @RequestMapping("all")
    @ResponseBody
    public JSONObject getAllRoleByPage(HttpServletRequest request) {
        PageBean pageBean = new PageBean();
        // 页码
        String pageIndex = request.getParameter("page");
        if (pageIndex != null) {
            pageBean.setIndex(Integer.parseInt(pageIndex));
        }
        // 每页条数
        String pageCount = request.getParameter("limit");
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount(attractionService.getCount());
        List<Attraction> attractionList = attractionService.queryByPageBean(pageBean);
        return JsonUtil.getJsonObject(attractionList, pageBean);
    }
    /**
     * 景点信息修改
     * @param attraction
     * @return
     */
    @RequestMapping("save")
    @ResponseBody
    public Integer update(Attraction attraction){
        attractionService.update(attraction);
        return 1;
    }
    @RequestMapping(value = "update/{attractionId}")
    public ModelAndView toUpdate(@PathVariable(name="attractionId")Integer id){
        List<Attraction> attractionList = attractionService.queryAll();
        Attraction attraction = null;
        for (Attraction a:attractionList) {
            if(a.getAttractionId().equals(id)){
                attraction= a;
                break;
            }
        }
        ModelAndView mv = new ModelAndView("attractionUpdate");
        mv.addObject("attraction",attraction);
        return mv;
    }

    @RequestMapping("/changePlace")
    public ModelAndView changePlace(){

        List<Attraction> attractions = attractionService.changePlace();

        ModelAndView modelAndView = new ModelAndView("/desk/index");

        modelAndView.addObject("attractions",attractions);
        return modelAndView;
    }

    @RequestMapping("placeList")
    public ModelAndView placeList(){
        List<Attraction> attractionList = attractionService.queryAll();

        ModelAndView modelAndView = new ModelAndView("/desk/place");
        modelAndView.addObject("attractionList",attractionList);
        return modelAndView;
    }
}

