package com.chinasofti.attraction.service.impl;

import com.chinasofti.attraction.dao.AttractionDao;
import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.attraction.service.AttractionService;
import com.chinasofti.base.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttractionServiceImpl implements AttractionService {

    @Autowired
    private AttractionDao attractionDao;
    @Autowired
    private AttractionService attractionService;

    @Override
    public List<Attraction> queryByPageBean(PageBean pageBean) {
        return attractionDao.queryByPageBean(pageBean);
    }

    @Override
    public Attraction query(Integer id) {
        return attractionDao.queryById(id);
    }

    @Override
    public List<Attraction> queryAll(){
        return attractionDao.queryAll();
    }

    @Override
    public void add(Attraction attraction) {
        attractionDao.add(attraction);
    }

    @Override
    public void update(Attraction attraction) {
        attractionDao.update(attraction);
    }

    @Override
    public void delete(Attraction attraction){
        attractionDao.delete(attraction);
    }

    @Override
    public Integer getCount() {
        return attractionDao.getCount();
    }

    @Override
    public List<Attraction> changePlace(){
        return attractionDao.changePlace();
    }

    @Override
    public List queryOneByName(String place) {
        List list = attractionDao.queryOneByName(place);
        return list;
    }
}
