package com.chinasofti.admin.dao;




import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.PageBean;
import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.role.entity.Role;
import com.chinasofti.staff.entity.Staff;
import com.chinasofti.user.entity.User;
import net.sf.ehcache.hibernate.HibernateUtil;
import org.hibernate.*;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.List;

@Repository
public class AdminDaoImp extends BaseDaoImpl<Admin> implements AdminDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;
//    public List queryName(){
//
//
//        String sql=" select a.* ,s.*,r.* from admin a ,staff s,role r where s.staff_id=a.staff_id and a.role_id=r.role_id";
//        return  hibernateTemplate.execute((HibernateCallback<List<Admin>>) session -> session.createSQLQuery(sql).list());
//    }
    public List queryName(){


        String hql="  select s.staff_name from admin a ,staff s where s.staff_id=a.staff_id";
        return  hibernateTemplate.execute((HibernateCallback<List<String>>) session -> session.createSQLQuery(hql).list());
    }

    public List queryRoleName(){
        String hql="  select r.role_name from admin a ,role r where r.role_id=a.role_id";
        return  hibernateTemplate.execute((HibernateCallback<List<String>>) session -> session.createSQLQuery(hql).list());


    }
   /* @Override
    public List<Admin> queryByPageBean(PageBean pageBean) {
        return hibernateTemplate.execute(session ->
                session.createSQLQuery("select a.* from admin a,role r,staff s where r.role_id = a.role_id and a.staff_id = s.staff_id ")
                        .addEntity(Admin.class).addEntity(Role.class).addEntity(Staff.class).list());

    }
*/
    @Override
    public List<Admin> queryByPageBean(PageBean pageBean) {
        return hibernateTemplate.execute(session -> session.createQuery("from Admin")
                .setFirstResult(pageBean.getPageIndex())
                .setMaxResults(pageBean.getPageCount())
                .list());
    }

    @Override
    public Admin queryBySid(Integer id) {

        return hibernateTemplate.execute(session -> {
            Query query = session.createQuery("from Admin where staffId =:" +id).setParameter("id", id);
            return (Admin) query.uniqueResult();
        });
    }
}
