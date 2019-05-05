package com.chinasofti.attraction.service;

import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.base.PageBean;

import java.util.List;

public interface AttractionService {
    public List<Attraction> queryByPageBean(PageBean pageBean);
    public Attraction query( Integer id);
    public List<Attraction> queryAll();
    public void add(Attraction attraction);
    public void update(Attraction attraction);
    public void delete(Attraction attraction);
    public Integer getCount();
    public List<Attraction> changePlace();
    public List queryOneByName(String place);

}
