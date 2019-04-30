package com.chinasofti.order.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.order.entity.Orders;

import java.util.List;

public interface OrderService {

	void addorder(Orders orders);
	
	void updateOrder(Orders orders);	
	
	void delete(Orders orders);
	
	Orders query(Integer orderId);
	
	List<Orders> queryAll();
	
	List<Orders> queryBypage(PageBean pageBean);

	List queryOrder(Integer userId);

	int deleteById(Integer orderId);
}
