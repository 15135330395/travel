package com.chinasofti.order.dao.impl;

import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.order.dao.OrderDao;
import com.chinasofti.order.entity.Orders;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description OrderDaoImpl
 * @Author WYR
 * @CreateTime 2019-04-29 19:09
 */
@Repository
public class OrderDaoImpl extends BaseDaoImpl<Orders> implements OrderDao {
    @Override
    public List queryOrder(Integer userId) {
        return null;
    }

    @Override
    public int deleteById(Integer orderId) {
        return 0;
    }

    @Override
    public Orders query(String orderId, Integer orderId1) {
        return null;
    }
}
