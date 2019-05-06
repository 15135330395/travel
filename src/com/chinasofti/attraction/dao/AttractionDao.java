package com.chinasofti.attraction.dao;

import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.entity.Price;
import com.chinasofti.attraction.entity.Type;
import com.chinasofti.base.BaseDao;
import com.chinasofti.base.PageBean;

import java.util.List;

public interface AttractionDao extends BaseDao<Attraction> {

    public List changePlace();

    public List queryOneByName(String place);

    public List<Price> queryAttractionPrice();

    public List<Type> queryType();

    public List<Attraction> queryByPageBean(PageBean pageBean);

    public void delete1(Price price);

    public void update1(Price price);

    public void add1(Price price);
}
