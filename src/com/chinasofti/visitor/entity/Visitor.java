package com.chinasofti.visitor.entity;

/**
 * @Description Visitor
 * @Author WYR
 * @CreateTime 2019-04-27 17:33
 */

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

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
     * 身份证号
     */
    private String cardId;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 订单编号
     */
    private Long orderId;

    @Id
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
    @Column(name = "card_id")
    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    @Column(name = "order_id")
    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Visitor() {
    }

    public Visitor(String visitorName, String cardId, String phone) {
        this.visitorName = visitorName;
        this.cardId = cardId;
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Visitor{" +
                "visitorId=" + visitorId +
                ", visitorName='" + visitorName + '\'' +
                ", cardId='" + cardId + '\'' +
                ", phone='" + phone + '\'' +
                ", orderId=" + orderId +
                '}';
    }
}
