package com.chinasofti.order.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.staff.entity.Staff;

import java.util.List;

public interface OrderService {

	void updateOrder(Orders orders);

	void delete(Orders orders);

	Orders query(Long orderId);

	List<Orders> queryAll();

	List<Orders> queryBypage(PageBean pageBean);

	List queryOrder(Integer userId);

	int deleteById(String orderId);

	void addorder(Orders orders,Integer count);

	void changeState(Long orderId, Staff staff);

}
