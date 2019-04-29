package com.chinasofti.attraction.dao;

import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.base.BaseDao;


public interface AttractionDao extends BaseDao<Attraction> {
    
import java.util.List;

public interface AttractionDao extends BaseDao<Attraction> {

    public List<Attraction> changePlace();

}
