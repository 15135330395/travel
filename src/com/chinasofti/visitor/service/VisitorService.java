package com.chinasofti.visitor.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.visitor.dao.VisitorDao;
import com.chinasofti.visitor.entity.Visitor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author haoyu
 * date ：2019/4/27
 */
@Service
public class VisitorService {

    @Autowired
    private VisitorDao<Visitor> visitorDao;
    /**
     * 查询全部游客
     */
    public List<Visitor> queryAll() {
        return visitorDao.queryAll();
    }
    /**
     * 分页查询
     */
    public List<Visitor> queryByPageBean(PageBean pageBean) {
        return visitorDao.queryByPageBean(pageBean);
    }
    /**
     * 按Id查询游客信息
     */
    public Visitor query(Integer id) {
        return visitorDao.queryById(id);
    }
    /**
     * 添加游客信息
     */
    @Transactional
    public void addVisitor(Visitor visitor) {
        visitorDao.add(visitor);
    }
    /**
     * 修改游客信息
     */
    @Transactional
    public void updateVisitor(Visitor visitor) {
        visitorDao.update(visitor);
    }
    /**
     * 删除游客信息
     */
    @Transactional
    public void deleteVisitor(Visitor visitor) {
        visitorDao.delete(visitor);
    }

}
