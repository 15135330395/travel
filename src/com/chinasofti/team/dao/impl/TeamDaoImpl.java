package com.chinasofti.team.dao.impl;

import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.team.dao.TeamDao;
import com.chinasofti.team.entity.Team;
import com.chinasofti.visitor.entity.Visitor;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeamDaoImpl extends BaseDaoImpl<Team> implements TeamDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    public List<Team> queryByAttractionId(Integer id) {
        List list = hibernateTemplate.execute(session -> {
            Query query = session.createQuery("from Team where attraction.attractionId = :attractionId order by departure desc ").setParameter("attractionId", id);
            return query.list();
        });
        return list;
    }
}
