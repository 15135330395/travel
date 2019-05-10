package com.chinasofti.attraction.controller;

import com.alibaba.fastjson.JSONObject;
import com.chinasofti.attraction.dao.AttractionDao;
import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.entity.Price;
import com.chinasofti.attraction.entity.Type;
import com.chinasofti.attraction.service.AttractionService;
import com.chinasofti.base.PageBean;
import com.chinasofti.team.entity.Team;
import com.chinasofti.team.service.TeamService;
import com.chinasofti.utils.StringUtil;
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
    TeamService teamService;
    /**
     * 景点查询
     * @param model
     * @return
     */
    @RequestMapping("findAll")
    public String findAll(Model model) {
        List<Attraction> attractionList = attractionService.queryAll();
        List<Price> prices = attractionService.queryAttractionPrice();

        model.addAttribute("attractionList", attractionList);
        model.addAttribute("prices", prices);

        return "/background/attraction/attractionList";
    }
    /**
     * 批量删除景点信息
     * @param ids
     * @return
     */
    @RequestMapping("/deleteList")
    @ResponseBody
    public Integer deleteList(@RequestParam(name = "ids") String ids) {

        //判断ids不为空
        if (StringUtils.isNoneBlank(ids)) {
            //分割ids
            String[] split = ids.split(",");
            for (String id : split) {
                List<Attraction> attractionList = attractionService.queryAll();
                Attraction attraction = null;
                for (Attraction a : attractionList) {
                    if (a.getAttractionId().equals(Integer.valueOf(id))) {
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
    public Integer delete(@RequestParam(value = "attractionId") Integer attractionId) {

        List<Attraction> attractionList = attractionService.queryAll();
        Attraction attraction = null;
        for (Attraction a : attractionList) {
            if (a.getAttractionId().equals(attractionId)) {
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
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Integer add(Attraction attraction, HttpServletRequest request) {
        attractionService.add(attraction);
        System.out.println(attraction);
        String price1 = request.getParameter("price1");
        Price p1 = new Price();
        p1.setAttractionId(attraction.getAttractionId());
        p1.setTypeId(1);
        p1.setPrice(Double.parseDouble(price1));
        attractionService.add1(p1);
        String price2 = request.getParameter("price2");
        Price p2 = new Price();
        p2.setAttractionId(attraction.getAttractionId());
        p2.setTypeId(2);
        p2.setPrice(Double.parseDouble(price2));
        attractionService.add1(p2);
        return 1;
    }

    /**
     * 分页查询景点信息
     * @param request
     * @return
     */
    @RequestMapping("all")
    public String query(HttpServletRequest request, Map<String, Object> map) {
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

        List<Attraction> attractionList = attractionService.queryByPageBean(pageBean);

        //查询景点价格
        List<Price> prices = attractionService.queryAttractionPrice();
        //查询组团类型
        List<Type> types = attractionService.queryType();

        map.put("pageBean", pageBean);
        map.put("attractionList", attractionList);
        map.put("prices", prices);
        map.put("types", types);

        return "/background/attraction/attractionList";
    }
    /**
     * 景点信息修改
     * @param attraction
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Integer update(Attraction attraction, HttpServletRequest request) {
        attractionService.update(attraction);
        String price = request.getParameter("price1");
        String price3 = request.getParameter("price2");
        List<Price> prices = attractionService.queryAttractionPrice();
        Price price1 = null;
        Price price2 = null;
        for (Price p : prices) {
            if (p.getTypeId()==1&&p.getAttractionId().equals(attraction.getAttractionId())) {
                price1 = p;
            }else if(p.getTypeId()==2&&p.getAttractionId().equals(attraction.getAttractionId())){
                price2 = p;
            }
        }
        price1.getId();
        price1.getAttractionId();
        price1.getTypeId();
        price1.setPrice(Double.parseDouble(price));
        attractionService.update1(price1);
        price2.getId();
        price2.getAttractionId();
        price2.getTypeId();
        price2.setPrice(Double.parseDouble(price3));
        attractionService.update1(price2);

        return 1;
    }

    /**
     * 富文本编辑器图片上传
     * @param
     * @return
     */
    @RequestMapping(value = "/uploadImage")
    @ResponseBody
    public Integer uploadImage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        File savePath = new File("D:\\files\\", "image");
        savePath.mkdirs();
        String uuid = UUID.randomUUID().toString().replace("-", "");

        Part part = request.getPart("upload");//通过表单file控件(<input type="file" name="upfile">)的名字直接获取Part对象
        //Servlet3没有提供直接获取文件名的方法,需要从请求头中解析出来
        //获取请求头，请求头的格式：form-data; name="file"; filename="snmp4j--api.zip"
        String header = part.getHeader("content-disposition");
        //获取文件名
        String fileName = "";
        if (header.contains("filename")) {
            String[] strArr = header.split("\"");
            fileName = uuid + "_" + strArr[strArr.length - 1];
        }

        //把文件写到指定路径
        part.write(savePath + "/" + fileName);

        PrintWriter out = response.getWriter();
        // CKEditorFuncNum是回调时显示的位置，这个参数必须有
        JSONObject json = new JSONObject();
        json.put("uploaded", 1);
        json.put("fileName", fileName);
        json.put("url", "http://localhost/" + fileName);

        request.getSession().setAttribute("image", fileName);
        out.print(json);
        out.flush();
        out.close();
        return 1;
    }

    /**
     * 进入修改页面
     * @param id
     * @return
     */
    @RequestMapping(value = "update/{attractionId}")
    public ModelAndView toUpdate(@PathVariable(name = "attractionId") Integer id) {
        List<Attraction> attractionList = attractionService.queryAll();
        List<Type> types = attractionService.queryType();
        List<Price> prices = attractionService.queryAttractionPrice();
        Attraction attraction = null;
        Type type = null;
        Price price1 = null;
        Price price2 = null;
        for (Attraction a : attractionList) {
            if (a.getAttractionId().equals(id)) {
                attraction = a;
                break;
            }
        }
        for (Price p : prices) {
            if (p.getTypeId()==1&&p.getAttractionId().equals(attraction.getAttractionId())) {
                price1 = p;
            }else if(p.getTypeId()==2&&p.getAttractionId().equals(attraction.getAttractionId())){
                price2 = p;
            }
        }
        ModelAndView mv = new ModelAndView("/background/attraction/attractionUpdate");
        mv.addObject("attraction", attraction);
        mv.addObject("price1", price1);
        mv.addObject("price2", price2);
        return mv;
    }

    //    前台主页随机5个地点展示方法
    @RequestMapping("/changePlace")
    public ModelAndView changePlace() {

        List<Attraction> attractions = attractionService.changePlace();
        List<Price> prices = attractionService.queryAttractionPrice();
        List<Type> types = attractionService.queryType();
        ModelAndView modelAndView = new ModelAndView("/desk/index");

        modelAndView.addObject("attractions", attractions);
        modelAndView.addObject("prices", prices);
        modelAndView.addObject("types", types);
        return modelAndView;
    }

    //    前台景点列表查询方法
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

        List<Attraction> attractionList = attractionService.queryByPageBean(pageBean);

        //查询景点价格
        List<Price> prices = attractionService.queryAttractionPrice();
        //查询组团类型
        List<Type> types = attractionService.queryType();

        map.put("pageBean", pageBean);
        map.put("attractionList", attractionList);
        map.put("prices", prices);
        map.put("types", types);
        return "/desk/place";
    }

    //    搜索景点方法
    @RequestMapping("/queryOneByName")
    public ModelAndView queryOneByName(@RequestParam(name = "place") String place) {

        List<Attraction> attractionList = attractionService.queryOneByName(place);
        List<Price> prices = attractionService.queryAttractionPrice();
        List<Type> types = attractionService.queryType();

        ModelAndView modelAndView = new ModelAndView("/desk/place");
        modelAndView.addObject("attractionList", attractionList);
        modelAndView.addObject("prices", prices);
        modelAndView.addObject("types", types);

        return modelAndView;
    }

    /**
     * 前台查询一个景点得到详情信息
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/detail/{id}")
    public String findById(Model model, @PathVariable(name = "id") Integer id) {
        Attraction attraction = attractionService.query(id);
        List<Attraction> list = attractionService.changePlace();
        //查询景点价格
        List<Price> prices = attractionService.queryAttractionPrice();
        //查询组团类型
        List<Type> types = attractionService.queryType();
        model.addAttribute("attraction", attraction);
        model.addAttribute("list", list);
        model.addAttribute("prices", prices);
        model.addAttribute("types", types);
        List<Team> teams = teamService.queryByAttractionId(attraction.getAttractionId());
        if (teams.size()!=0) {
            model.addAttribute("flag", 1);
        }
        return "/single";
    }
}

