package com.chinasofti.team.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.team.dao.TeamDao;
import com.chinasofti.team.entity.Team;
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












    @Autowired
    private TeamDao teamDaoImp;


    @Override
    public void addTeam(Team t) {

        teamDaoImp.add(t);
    }

    @Override
    public void updateTeam(Team t) {

        teamDaoImp.update(t);
    }

    @Override
    public void delete(Team t) {

        teamDaoImp.delete(t);
    }

    @Override
    public List<Team> queryAll() {
        return teamDaoImp.queryAll();
    }

    @Override
    public List<Team> queryBypage(PageBean pageBean) {
        return teamDaoImp.queryByPageBean(pageBean);
    }

    @Override
    public Team queryOne(int teamId) {
        return teamDaoImp.queryById(teamId);
    }





}
