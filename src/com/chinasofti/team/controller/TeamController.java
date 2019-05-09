package com.chinasofti.team.controller;

import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.service.AttractionService;
import com.chinasofti.base.PageBean;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.staff.entity.Staff;
import com.chinasofti.staff.service.StaffInterface;
import com.chinasofti.staff.service.StaffServiceImpl;
import com.chinasofti.team.entity.Team;
import com.chinasofti.team.service.TeamService;
import com.chinasofti.utils.DateUtil;
import com.chinasofti.visitor.entity.Visitor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description TeamController
 * @Author WYR
 * @CreateTime 2019-05-08 10:20
 */
@Controller
//@RequestMapping(name = "team")
@RequestMapping("/team")
public class TeamController {

    @Autowired
    private TeamService teamService;
    @Autowired
    private AttractionService attractionService;
    @Autowired
    private StaffInterface staffService;

    @RequestMapping("teamQuery")
    public String qureyAll(HttpServletRequest request, Map<String, Object> map) {

        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        PageBean pageBean = new PageBean();
        pageBean.setIndex(Integer.parseInt(index));
        pageBean.setPageCount(10);

        pageBean.setCount(teamService.queryAll().size());

        System.out.println(teamService.queryAll().size());
        List<Team> teams = teamService.queryBypage(pageBean);


        System.out.println(teams);
        for (Team team : teams) {
            System.out.println(team);
        }
        System.out.println("3242342342423424323");

        map.put("pageBean", pageBean);
        map.put("teams", teams);
        return "/background/link/team";
    }


    @RequestMapping("queryOne")
    public String queryOne(HttpServletRequest request, Map<String, Object> map) {

        String a = request.getParameter("teamId");
        int teamId = Integer.parseInt(a);
        Team team1 = teamService.queryByTeamId(teamId);





        map.put("team1", team1);
        // map.put("orders1", orders1);
        return "/background/link/team_view";
    }


    @RequestMapping("toadd")
    public String addTeam(HttpServletRequest request, Map<String, Object> map) {

        List<Attraction> attractions = attractionService.queryAll();
        List<Staff> staff = staffService.queryAll();

        map.put("attractions", attractions);
        map.put("staff1", staff);

        return "/background/link/teamadd";
    }

    @RequestMapping("addteam")
    @ResponseBody
    public Integer addteam(HttpServletRequest request) throws ParseException {
        Team t = new Team();

        String attractionId = request.getParameter("attractionId");
        String staffId = request.getParameter("staffId");
        String goTime = request.getParameter("goTime");
        String place = request.getParameter("place");
        String predict = request.getParameter("predict");

        Attraction attraction = attractionService.query(Integer.parseInt(attractionId));
        t.setAttraction(attraction);

        Staff staff = staffService.query(Integer.parseInt(staffId));
        t.setStaff(staff);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        t.setDeparture(sdf.parse(goTime));
        t.setPlace(place);
        t.setPredict(Integer.parseInt(predict));
        teamService.addTeam(t);
        return 1;
    }

    @RequestMapping("delteam")
    @ResponseBody
    public Integer deleteteam(HttpServletRequest request){

        String teamId = request.getParameter("teamId");

        Team t = teamService.queryByTeamId(Integer.parseInt(teamId));
        if (t.getOrdersList().isEmpty()){
            teamService.delete(t);
            return 1;

        }else {
            return 2;

        }

    }


    @RequestMapping("toupdate")
    public String update(HttpServletRequest request, Map<String, Object> map) {

        String a = request.getParameter("teamId");
        Team team2 = teamService.queryByTeamId(Integer.parseInt(a));
        List<Staff> staff = staffService.queryAll();

        map.put("team2", team2);
        map.put("staff", staff);

        return "/background/link/teamupdate";
    }

    @RequestMapping("updateteam")
    @ResponseBody
    public Integer updateTeam(HttpServletRequest request) throws ParseException {

        Team t = new Team();
        String teamId = request.getParameter("teamId");
        String attractionId = request.getParameter("attractionId");
        String staffId = request.getParameter("staffId");
        String goTime = request.getParameter("goTime");
        String place = request.getParameter("place");
        String predict = request.getParameter("predict");

        t.setTeamId(Integer.parseInt(teamId));
        Attraction attraction = attractionService.query(Integer.parseInt(attractionId));
        t.setAttraction(attraction);

        Staff staff = staffService.query(Integer.parseInt(staffId));
        t.setStaff(staff);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            t.setDeparture(sdf.parse(goTime));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        t.setPlace(place);
        t.setPredict(Integer.parseInt(predict));
        teamService.updateTeam(t);
        return 1;
    }
}
