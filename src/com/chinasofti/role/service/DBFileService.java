package com.chinasofti.role.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.role.dao.DBFileDao;
import com.chinasofti.role.entity.DBFile;
import com.chinasofti.role.entity.Menu;
import com.chinasofti.role.entity.MenuRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description RoleService
 * @Author WYR
 * @CreateTime 2019-04-28 9:52
 */
@Service
public class DBFileService {
    @Autowired
    private DBFileDao dao;

    public List<DBFile> queryByPageBean(PageBean pageBean) {
        return dao.queryByPageBean(pageBean);
    }

    public Integer getCount() {
        return dao.getCount();
    }

    public void addDBFile(DBFile dbFile) {
        dao.add(dbFile);
    }

    public DBFile queryById(Integer recoverId) {
        DBFile dbFile = dao.queryById(recoverId);
        return dbFile;
    }

    public void deleteDBFile(Integer fileId) {
        DBFile dbFile = dao.queryById(fileId);
        dao.delete(dbFile);
    }
}
