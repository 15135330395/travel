package com.chinasofti.team.dao;

import com.chinasofti.base.BaseDao;
import com.chinasofti.team.entity.Team;

import java.util.List;

public interface TeamDao extends BaseDao<Team> {
    public List<Team> queryByAttractionId(Integer id);
}
