package com.chinasofti.attraction.dao.impl;

import com.chinasofti.attraction.dao.AttractionDao;
import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.entity.Price;
import com.chinasofti.attraction.entity.Type;
import com.chinasofti.base.impl.BaseDaoImpl;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class AttractionDaoImpl extends BaseDaoImpl<Attraction> implements AttractionDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;
    @Autowired
    private AttractionDao attractionDao;

    @Override
    public List<Attraction> changePlace() {
        List<Attraction> attractions = attractionDao.queryAll();

        Set set = new LinkedHashSet();
        Set<Attraction> list = new HashSet<>();
        for (int i = 0; list.size() < 4; i++) {
            int id = (int) (Math.random() * (attractions.size()));
            list.add(attractions.get(id));
        }
        List<Attraction> attractionList = new ArrayList<>();
        for (Attraction attraction : list) {
            attractionList.add(attraction);
        }
        return attractionList;
    }

    @Override
    public List queryOneByName(String place) {

        return hibernateTemplate.execute(new HibernateCallback<List>() {

            public List doInHibernate(Session session) throws HibernateException {

                String hql = "from Attraction where attractionName like '%" + place + "%'";

                Query query = session.createQuery(hql);
                List list = query.list();
                return list;
            }
        });
    }
    @Override
    public List<Price> queryAttractionPrice() {
        return hibernateTemplate.execute(session -> session.createQuery("from Price").list());
    }
    @Override
    public List<Type> queryType() {
        return hibernateTemplate.execute(session -> session.createQuery("from Type").list());
    }
}
