package com.chinasofti.team.service;

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
}
