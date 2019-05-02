package com.chinasofti.order.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.order.dao.OrderDao;
import com.chinasofti.order.entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderServiceImp implements OrderService{

	@Autowired
	private OrderDao orderDaoImp;
	
	@Override
	public void addorder(Orders orders,Integer count) {
        Double total = orderDaoImp.total(orders.getOrderId());
        orders.setTotal(total*count);
        orderDaoImp.update(orders);
	}

	@Override
	public void updateOrder(Orders orders) {
		// TODO 自动生成的方法存根
		orderDaoImp.update(orders);
	}

	@Override
	public void delete(Orders orders) {
		// TODO 自动生成的方法存根
		orderDaoImp.delete(orders);
	}

	@Override
	public Orders query(Integer orderId) {
		// TODO 自动生成的方法存根
		
		return orderDaoImp.query("orderId",orderId);
	}

	@Override
	public List<Orders> queryAll() {
		// TODO 自动生成的方法存根
		return orderDaoImp.queryAll();
	}

	@Override
	public List<Orders> queryBypage(PageBean pageBean) {
		// TODO 自动生成的方法存根
		
		return orderDaoImp.queryByPageBean(pageBean);
	}

	@Override
	public List queryOrder(Integer userId) {
		List list = orderDaoImp.queryOrder(userId);

		return list;
	}

	@Override
	public int deleteById(String orderId) {
		int i = orderDaoImp.deleteById(orderId);
		return i;
	}

}
