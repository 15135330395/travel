package com.chinasofti.order.entity;

import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.staff.entity.Staff;
import com.chinasofti.user.entity.User;

import javax.persistence.*;
import java.util.Date;

/**
 * @Description Order
 * @Author WYR
 * @CreateTime 2019-04-27 17:30
 */
@Entity
@Table(name = "orders")
public class Orders {
    /**
     * 订单编号
     */
    private Integer orderId;
    /**
     * 景点
     */
    private Attraction attraction;
    /**
     * 导游
     */
    private Staff staff;
    /**
     * 类型
     */
    private Type type;
    /**
     * 下单时间
     */
    private Date createTime;
    /**
     * 出发时间
     */
    private Date departure;
    /**
     * 集合地点
     */
    private String place;
    /**
     * 订单状态(0为未支付，1为已支付，2为退单)
     */
    private Integer state;
    /**
     * 下单用户
     */
    private User user;

    @Id
    @Column(name = "order_id")
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    @Column(name = "attraction_id")
    public Attraction getAttraction() {
        return attraction;
    }

    public void setAttraction(Attraction attraction) {
        this.attraction = attraction;
    }

    @Column(name = "staff_id")
    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    @Column(name = "staff_id")
    public Type getType() {
        return type;
    }

    public void setTypeId(Type type) {
        this.type = type;
    }

    @Column(name = "create_time")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "departure")
    public Date getDeparture() {
        return departure;
    }

    public void setDeparture(Date departure) {
        this.departure = departure;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
