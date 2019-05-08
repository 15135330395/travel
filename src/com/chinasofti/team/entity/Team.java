package com.chinasofti.team.entity;

import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.order.entity.Orders;
import com.chinasofti.staff.entity.Staff;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * @Description Team
 * @Author WYR
 * @CreateTime 2019-05-07 19:49
 */
@Entity
@Table(name = "team")
public class Team {
    /**
     * 组团编号
     */
    private Integer teamId;
    /**
     * 景点信息
     */
    private Attraction attraction;
    /**
     * 导游信息
     */
    private Staff staff;
    /**
     * 出发时间
     */
    private Date departure;
    /**
     * 预计人数
     */
    private Integer predict;
    /**
     * 当前人数
     */
    private Integer current;
    /**
     * 当前订单
     */
    private List<Orders> ordersList;

    @Id
    @GeneratedValue(generator = "_native")
    @GenericGenerator(name = "_native", strategy = "native")
    @Column(name = "team_id")
    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    @ManyToOne
    @JoinColumn(name = "attraction_id")
    public Attraction getAttraction() {
        return attraction;
    }

    public void setAttraction(Attraction attraction) {
        this.attraction = attraction;
    }

    @ManyToOne
    @JoinColumn(name = "staff_id")
    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    @Column(name = "departure")
    public Date getDeparture() {
        return departure;
    }

    public void setDeparture(Date departure) {
        this.departure = departure;
    }

    @Column(name = "predict")
    public Integer getPredict() {
        return predict;
    }

    public void setPredict(Integer predict) {
        this.predict = predict;
    }

    @Column(name = "current")
    public Integer getCurrent() {
        return current;
    }

    public void setCurrent(Integer current) {
        this.current = current;
    }

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "team_id")
    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }
}
