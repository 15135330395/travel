package com.chinasofti.order.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.staff.entity.Staff;
import com.chinasofti.visitor.entity.Visitor;

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

	void changeState(Long orderId);





	List<Visitor> queryVisitorByOrder(Long orderId);
	List<Orders> queryOrderBySid(int staffId);
	List<Orders> queryByPage(PageBean pageBean,int staffId);

    Integer getCount();
}
