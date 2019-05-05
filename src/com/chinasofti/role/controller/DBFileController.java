package com.chinasofti.role.controller;

import com.chinasofti.base.PageBean;
import com.chinasofti.role.entity.DBFile;
import com.chinasofti.role.service.DBFileService;
import com.chinasofti.utils.DBRecover;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @Description DBFileController
 * @Author WYR
 * @CreateTime 2019-04-28 9:52
 */
@Controller
@RequestMapping("db")
public class DBFileController {
    @Autowired
    private DBFileService service;

    @RequestMapping("all")
    public String getAllMenuByPage(HttpServletRequest request, Map<String, Object> map) {
        PageBean pageBean = new PageBean();
        // 页码
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        pageBean.setIndex(Integer.parseInt(index));
        // 每页条数
        String pageCount = "10";
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount(service.getCount());
        List<DBFile> dbFileList = service.queryByPageBean(pageBean);
        map.put("pageBean", pageBean);
        map.put("dbFileList", dbFileList);
        return "/background/role/DB/DBFileList";
    }

    @RequestMapping("backup")
    @ResponseBody
    public String backup() {
        DBRecover recover = new DBRecover("172.16.4.25", "root", "1234");
        String travel = null;
        try {
            travel = recover.backup("C:\\", "travel");
            service.addDBFile(new DBFile(travel));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return travel;
    }

    @RequestMapping("restore/{id}")
    @ResponseBody
    public Integer restore(@PathVariable(name = "id") String id) {
        DBFile dbFile = service.queryById(Integer.parseInt(id));
        DBRecover recover = new DBRecover("172.16.4.25", "root", "1234");
        try {
            recover.restore(dbFile.getFileName(), "travel");
        } catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    @RequestMapping("delete/{id}")
    @ResponseBody
    public Integer deleteDBFile(@PathVariable(name = "id") String id) {
        service.deleteDBFile(Integer.parseInt(id));
        return 1;
    }
}
