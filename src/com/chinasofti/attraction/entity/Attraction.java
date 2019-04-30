package com.chinasofti.attraction.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @Description Attraction
 * @Author WYR
 * @CreateTime 2019-04-27 17:29
 */
@Entity
@Table(name = "attraction")
public class Attraction {
    /**
     * 景点编号
     */
    private Integer attractionId;
    /**
     * 景点名称
     */
    private String attractionName;
    /**
     * 景点介绍
     */
    private String route;
    /**
     * 景点图片
     */
    private String imageUrl;
    /**
     * 旅游路线
     */
    private String attractionDesc;
    @Id
    @GeneratedValue(generator = "_native")
    @GenericGenerator(name = "_native",strategy = "native")
    @Column(name = "attraction_id")
    public Integer getAttractionId() {
        return attractionId;
    }

    public void setAttractionId(Integer attractionId) {
        this.attractionId = attractionId;
    }
    @Column(name = "attraction_name")
    public String getAttractionName() {
        return attractionName;
    }

    public void setAttractionName(String attractionName) {
        this.attractionName = attractionName;
    }
    @Column
    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }
    @Column(name = "image_url")
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Column(name = "attraction_desc")
    public String getAttractionDesc() {
        return attractionDesc;
    }

    public void setAttractionDesc(String attractionDesc) {
        this.attractionDesc = attractionDesc;
    }

    @Override
    public String toString() {
        return "Attraction{" +
                "attractionId=" + attractionId +
                ", attractionName='" + attractionName + '\'' +
                ", route='" + route + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", attractionDesc='" + attractionDesc + '\'' +
                '}';
    }
}
