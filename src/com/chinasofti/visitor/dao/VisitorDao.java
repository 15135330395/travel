package com.chinasofti.visitor.dao;

import com.chinasofti.base.BaseDao;
import com.chinasofti.visitor.entity.Visitor;

import java.util.List;

/**
 * @author haoyu
 * date ：2019/4/27
 */
public interface VisitorDao extends BaseDao<Visitor> {
    public List<Visitor> queryByOrderId(Long id);


}
