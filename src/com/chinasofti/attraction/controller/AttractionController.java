package com.chinasofti.attraction.controller;

import com.alibaba.fastjson.JSONObject;
import com.chinasofti.attraction.dao.AttractionDao;
import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.entity.Price;
import com.chinasofti.attraction.entity.Type;
import com.chinasofti.attraction.service.AttractionService;
import com.chinasofti.base.PageBean;
import com.chinasofti.utils.StringUtilss;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
        List<Price> prices = attractionService.queryAttractionPrice();

        model.addAttribute("attractionList",attractionList);
        model.addAttribute("prices",prices);
        System.out.println(attractionList);
        return "/background/attraction/attractionList";
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
        System.out.println(attractionId+"sdasdasd");
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
    public Integer add(Attraction attraction,Price price){
        attractionService.add(attraction);
        return 1;
    }

    /**
     * 分页查询景点信息
     * @param request
     * @return
     */
    @RequestMapping("all")
    public String query(HttpServletRequest request, Map<String, Object> map){
        PageBean pageBean = new PageBean();
        // 页码
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        pageBean.setIndex(Integer.parseInt(index));
        // 每页条数
        String pageCount = "5";
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount((int) attractionService.getCount());

        List<Attraction> attractionList = attractionService.queryByPageBean(pageBean );

        //查询景点价格
        List<Price> prices = attractionService.queryAttractionPrice();
        //查询组团类型
        List<Type> types = attractionService.queryType();
        for (Attraction attraction : attractionList) {
            System.out.println(attraction);
        }
        map.put("pageBean", pageBean);
        map.put("attractionList", attractionList);
        map.put("prices",prices);
        map.put("types",types);
//        request.setAttribute("admins", admins);
        return "/background/attraction/attractionList";
    }

    /**
     * 1
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

    /**
     * 富文本编辑器图片上传
     * @param
     * @return
     */
    @RequestMapping(value = "/uploadImage")
    @ResponseBody
    public Integer uploadImage(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        File savePath =  new File("D:\\files\\","image");
        savePath.mkdirs();
        String uuid = UUID.randomUUID().toString().replace("-", "");

        Part part = request.getPart("upload");//通过表单file控件(<input type="file" name="upfile">)的名字直接获取Part对象
        //Servlet3没有提供直接获取文件名的方法,需要从请求头中解析出来
        //获取请求头，请求头的格式：form-data; name="file"; filename="snmp4j--api.zip"
        String header = part.getHeader("content-disposition");
        //获取文件名
        String fileName ="";
        if(header.contains("filename")) {
            String[] strArr = header.split("\"");
            fileName = uuid+"_"+strArr[strArr.length-1];
        }

        System.out.println("fileName:"+fileName);
        //把文件写到指定路径
        part.write(savePath+"/"+fileName);

        PrintWriter out = response.getWriter();
        // CKEditorFuncNum是回调时显示的位置，这个参数必须有
        JSONObject json = new JSONObject();
        json.put("uploaded",1);
        json.put("fileName",fileName);
        json.put("url","http://localhost/"+fileName);

        request.getSession().setAttribute("image",fileName);
        out.print(json);
        out.flush();
        out.close();
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
        ModelAndView mv = new ModelAndView("/background/attraction/attractionUpdate");
        mv.addObject("attraction",attraction);
        return mv;
    }







    @RequestMapping("/changePlace")
    public ModelAndView changePlace(){

        List<Attraction> attractions = attractionService.changePlace();
        List<Price> prices = attractionService.queryAttractionPrice();
        List<Type> types = attractionService.queryType();
        ModelAndView modelAndView = new ModelAndView("/desk/index");

        modelAndView.addObject("attractions",attractions);
        modelAndView.addObject("prices",prices);
        modelAndView.addObject("types",types);
        return modelAndView;
    }

    @RequestMapping("/placeList")
    public String placeList(HttpServletRequest request, Map<String, Object> map){
        PageBean pageBean = new PageBean();
        // 页码
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        pageBean.setIndex(Integer.parseInt(index));
        // 每页条数
        String pageCount = "5";
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount((int) attractionService.getCount());

        List<Attraction> attractionList = attractionService.queryByPageBean(pageBean );

        //查询景点价格
        List<Price> prices = attractionService.queryAttractionPrice();
        //查询组团类型
        List<Type> types = attractionService.queryType();
        for (Attraction attraction : attractionList) {
            System.out.println(attraction);
        }
        map.put("pageBean", pageBean);
        map.put("attractionList", attractionList);
        map.put("prices",prices);
        map.put("types",types);
//        request.setAttribute("admins", admins);
        return "/desk/place";
    }

    @RequestMapping("queryOneByName")
    @ResponseBody
    public List queryOneByName(@RequestParam(name = "place") String place){

        List list = attractionService.queryOneByName(place);

        return list;
    }

    @RequestMapping("/toPlace")
    public ModelAndView toPlace(@RequestBody Attraction place){
        ModelAndView modelAndView = new ModelAndView("/desk/place");

        return modelAndView;
    }

    /**
     * 前台查询一个景点得到详情
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/detail/{id}")
    public String findById(Model model, @PathVariable(name = "id") Integer id){
        Attraction attraction = attractionService.query(id);
        List<Attraction> list = attractionService.changePlace();
        //查询景点价格
        List<Price> prices = attractionService.queryAttractionPrice();
        //查询组团类型
        List<Type> types = attractionService.queryType();
        List<Attraction> list1=new ArrayList<>();
        for (Attraction attraction1 : list) {
            String s = StringUtilss.html2Text(attraction1.getAttractionDesc());
            attraction1.setAttractionDesc(s);
            list1.add(attraction1);
        }
        model.addAttribute("attraction",attraction);
        model.addAttribute("list",list1);
        model.addAttribute("prices",prices);
        model.addAttribute("types",types);
        return "/single";
    }
}

