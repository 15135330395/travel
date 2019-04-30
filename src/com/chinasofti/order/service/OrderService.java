package com.chinasofti.order.service;

import com.chinasofti.order.dao.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description OrderService
 * @Author WYR
 * @CreateTime 2019-04-29 19:10
 */
@Service
public class OrderService {
    @Autowired
    private OrderDao dao;

}
