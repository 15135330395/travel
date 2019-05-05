package com.chinasofti.attraction.dao;

import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.base.BaseDao;

import java.util.List;

public interface AttractionDao extends BaseDao<Attraction> {

    public List changePlace();

    public List queryOneByName(String place);

}
