package com.chinasofti.type.service;

import com.chinasofti.order.entity.Type;
import com.chinasofti.type.dao.TypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TypeServiceImp implements TypeService{

	@Autowired
	private TypeDao typeDao;

    @Override
    public Type query(Integer typeId) {
        return typeDao.queryById(typeId);
    }
}
