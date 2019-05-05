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
    private Long orderId;
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
    /**
     * 订单总价
     */
    private Double total;

    @Id
    @Column(name = "order_id")
    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
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

    @ManyToOne
    @JoinColumn(name = "type_id")
    public Type getType() {
        return type;
    }

    public void setType(Type type) {
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

    @Column(name = "place")
    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    @Column(name = "state")
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @ManyToOne
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderId=" + orderId +
                ", attraction=" + attraction +
                ", staff=" + staff +
                ", type=" + type +
                ", createTime=" + createTime +
                ", departure=" + departure +
                ", place='" + place + '\'' +
                ", state=" + state +
                ", user=" + user +
                ", total=" + total +
                '}';
    }
}
