package com.chinasofti.visitor.dao.impl;

import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.visitor.dao.VisitorDao;
import com.chinasofti.visitor.entity.Visitor;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author haoyu
 * date ：2019/4/27
 */
// 持久层
@Repository
public class VisitorDaoImpl extends BaseDaoImpl<Visitor> implements VisitorDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public List<Visitor> queryByOrderId(Long id) {
        List list = hibernateTemplate.execute(session -> {
            Query query = session.createQuery("from Visitor where orders.orderId = :orderId ").setParameter("orderId", id);

            return query.list();

        });
        return list;
    }
}
