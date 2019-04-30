package com.chinasofti.order.dao;

import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.order.entity.Orders;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImp extends BaseDaoImpl<Orders> implements OrderDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List queryOrder(Integer userId) {

        return hibernateTemplate.execute(new HibernateCallback<List>() {
            @Override
            public List doInHibernate(Session session) throws HibernateException {

                String hql = "from Orders where user = "+userId;
                Query query = session.createQuery(hql);
                return query.list();
            }
        });
    }

    @Override
    public int deleteById(Integer orderId) {

        Orders orders = hibernateTemplate.get(Orders.class, orderId);

        if(orders != null){
            hibernateTemplate.delete(orders);
            return 1;
        }else{
            return 0;
        }
    }
	
/*
	@Override
	public void addorder(Order orders) {
		// TODO 自动生成的方法存根
		hibernateTemplate.save(orders);
	}

	@Override
	public void updateOrder(Order orders) {
		// TODO 自动生成的方法存根
		hibernateTemplate.update(orders);
	}
 
	@Override
	public void delete(Order orders) {
		// TODO 自动生成的方法存根
		hibernateTemplate.delete(orders);
	}

	@Override
	public Order query(Serializable orderId) {
		// TODO 自动生成的方法存根
		
		return hibernateTemplate.load(Order.class, orderId);
	}

	@Override
	public List<Order> queryAll() {
		// TODO 自动生成的方法存根
		
		return hibernateTemplate.execute(new QueryHibernateCallback());
	}

	@Override
	public List<Order> queryBypage(int first, int max) {
		// TODO 自动生成的方法存根
		DetachedCriteria criteria=DetachedCriteria.forClass(Order.class);
		List<Order> list = (List<Order>) hibernateTemplate.findByCriteria(criteria,first,max);
		
		
		return list;
	}


	
	
	
	
	
	
	
	

	
	class QueryHibernateCallback implements HibernateCallback<List<Order>>{
		@Override
		public List<Order> doInHibernate(Session session) throws HibernateException {
			return session.createQuery(" from Order").list();
		}
	}	
	
	
	*/
	
	
}