package com.chinasofti.order.dao;
import com.chinasofti.base.BaseDao;
import com.chinasofti.order.entity.Orders;

import java.util.List;

public interface OrderDao extends BaseDao<Orders> {
    public Double total(Long id);

    List queryOrder(Integer userId);

    int deleteById(Integer orderId);

    Orders query(String orderId, Integer orderId1);
}
//	void addorder(Order orders);
//
//	void updateOrder(Order orders);
//
//	void delete(Order orders);
//
//	Order query(Serializable orderId);
//
//	List<Order> queryAll();
//
//	List<Order> queryBypage(int first, int max);

//	int getCounts(Order orders);

//	void addOrder(int user_id,int attraction_id,int staff_id,int type_id,Date create_time,Date departure,String place,int state);

//	public int deleteOrder(int p_rId);



