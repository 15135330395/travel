package com.chinasofti.visitor.entity;

import com.chinasofti.order.entity.Orders;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @Description Visitor
 * @Author WYR
 * @CreateTime 2019-04-27 17:33
 */
@Entity
@Table(name = "visitor")
public class Visitor {
    /**
     * 游客编号
     */
    private Integer visitorId;
    /**
     * 游客姓名
     */
    private String visitorName;
    /**
     * 游客性别
     */
    private String visitorSex;
    /**
     * 身份证号
     */
    private String cardId;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 订单
     */
    private Orders orders;

    @Id
    @GeneratedValue(generator = "_native")
    @GenericGenerator(name = "_native", strategy = "native")
    @Column(name = "visitor_id")
    public Integer getVisitorId() {
        return visitorId;
    }

    public void setVisitorId(Integer visitorId) {
        this.visitorId = visitorId;
    }

    @Column(name = "visitor_name")
    public String getVisitorName() {
        return visitorName;
    }

    public void setVisitorName(String visitorName) {
        this.visitorName = visitorName;
    }

    @Column(name = "visitor_sex")
    public String getVisitorSex() {
        return visitorSex;
    }

    public void setVisitorSex(String visitorSex) {
        this.visitorSex = visitorSex;
    }

    @Column(name = "card_id")
    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @ManyToOne
    @JoinColumn(name = "order_id")
    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }
}
