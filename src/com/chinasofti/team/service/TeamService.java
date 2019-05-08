package com.chinasofti.team.service;

import com.chinasofti.team.entity.Team;

import java.util.List;

/**
 * @author: LiGX
 * @Date: 2019-05-08 上午 9:14
 */
public interface TeamService {
    public List<Team> queryByAttractionId(Integer id);
    public Team queryByTeamId(Integer id);
}
