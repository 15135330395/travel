package com.chinasofti.team.service;

import com.chinasofti.attraction.controller.AttractionController;
import com.chinasofti.base.PageBean;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.team.dao.TeamDao;
import com.chinasofti.team.entity.Team;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: LiGX
 * @Date: 2019-05-08 上午 9:16
 */
@Service
public class TeamServiceImpl implements TeamService {
    @Autowired
    private TeamDao teamDao;

    @Override
    public List<Team> queryByAttractionId(Integer id) {
        List<Team> teamList = teamDao.queryByAttractionId(id);
        return teamList;
    }

    @Override
    public Team queryByTeamId(Integer id) {
        return teamDao.queryById(id);
    }

    @Override
    public void addTeam(Team t) {

        t.setCurrent(0);
        teamDao.add(t);

    }

    @Override
    public void updateTeam(Team t) {

        teamDao.update(t);
    }

    @Override
    public void delete(Team t) {

        teamDao.delete(t);
    }

    @Override
    public List<Team> queryAll() {
        return teamDao.queryAll();
    }

    @Override
    public List<Team> queryBypage(PageBean pageBean) {
        return teamDao.queryByPageBean(pageBean);
    }

    @Override
    public Team queryOne(int teamId) {
        return teamDao.queryById(teamId);
    }

    @Override
    public Integer getCount() {
        return teamDao.getCount();
    }
    @Override
    public List<Orders> queryOrderByTid(int teamId) {
        return teamDao.queryOrderByTid(teamId);
    }


}
