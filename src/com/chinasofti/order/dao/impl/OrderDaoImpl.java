package com.chinasofti.order.dao.impl;

import com.chinasofti.base.PageBean;
import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.order.dao.OrderDao;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.staff.entity.Staff;
import com.chinasofti.visitor.entity.Visitor;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description OrderDaoImpl
 * @Author WYR
 * @CreateTime 2019-04-29 19:09
 */
@Repository
public class OrderDaoImpl extends BaseDaoImpl<Orders> implements OrderDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List queryOrder(Integer userId) {

        return hibernateTemplate.execute(new HibernateCallback<List>() {
            @Override
            public List doInHibernate(Session session) throws HibernateException {

                String hql = "from Orders where user = " + userId +"order by createTime DESC";
                Query query = session.createQuery(hql);
                return query.list();
            }
        });
    }
    @Override
    public int deleteById(String orderId) {

        Orders orders = hibernateTemplate.get(Orders.class,Long.valueOf(orderId));

        if (orders != null) {
            orders.setState(2);
            hibernateTemplate.save(orders);
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public Orders query(Long orderId1) {

        Orders orders = hibernateTemplate.get(Orders.class, orderId1);
        return orders;
    }

    @Override
    public void changeState(Long orderId, Staff staff) {
        Orders orders = hibernateTemplate.get(Orders.class,Long.valueOf(orderId));
        orders.setState(1);
        orders.setStaff(staff);
        hibernateTemplate.save(orders);
    }

    @Override
    public void changeState(Long orderId) {
        Orders orders = hibernateTemplate.get(Orders.class,Long.valueOf(orderId));
        orders.setState(1);
        hibernateTemplate.save(orders);
    }

    @Override
    public Double total(Long id) {

        return hibernateTemplate.execute(session -> {
            String sql = "select p.price from travel.orders o,travel.price p where o.attraction_id=p.attraction_id and o.type_id=p.type_id and o.order_id=:id";
            Query id1 = session.createSQLQuery(sql).setParameter("id", id);
            return (Double) id1.uniqueResult();
        });
    }









    @Override
    public Orders queryById(Long orderId) {
        return hibernateTemplate.get(Orders.class, orderId);
    }

    @Override
    public List<Visitor> queryVisitorByOrder(Long orderId) {
        return hibernateTemplate.execute(session -> session.createQuery("from Visitor where order_id=:id")
                .setParameter("id", orderId)
                .list());
    }


    @Override
    public List<Orders> queryOrderBySid(int staffId) {
        // TODO 自动生成的方法存根
        return hibernateTemplate.execute(session -> session.createQuery("from Orders where staff_id=:id")
                .setParameter("id", staffId)
                .list());
    }


    @Override
    public List<Orders> queryByPage(PageBean pageBean,int staffId) {
        return hibernateTemplate.execute(session -> session.createQuery("from Orders where staff_id=:id" )
                .setParameter("id", staffId)
                .setFirstResult(pageBean.getPageIndex())
                .setMaxResults(pageBean.getPageCount())
                .list());
    }



}
