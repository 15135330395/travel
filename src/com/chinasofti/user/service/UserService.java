package com.chinasofti.user.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.user.dao.UserDao;
import com.chinasofti.user.entity.User;
import com.chinasofti.utils.CreateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author haoyu
 * date ：2019/4/27
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;
    /**
     * 查询全部用户
     */
    public List<User> queryAll() {
        return userDao.queryAll();
    }
    /**
     * 分页查询
     */
    public List<User> queryByPageBean(PageBean pageBean) {
        return userDao.queryByPageBean(pageBean);
    }
    /**
     * 按Id查询用户信息
     */
    public User queryById(Integer id) {
        return userDao.queryById(id);
    }
    /**
     * 按邮箱查询用户信息
     */
    public User queryByEmail(String email) {
        return userDao.queryByName("email",email);
    }
    /**
     * 添加用户信息
     */
    @Transactional
    public void addUser(User user) {
        CreateCode code = new CreateCode();
        user.setState(0);
        user.setCode(code.generateCode());
        userDao.add(user);
    }
    /**
     * 修改用户信息
     */
    @Transactional
    public void updateUser(User user) {
        userDao.update(user);
    }
    /**
     * 删除用户信息
     */
    @Transactional
    public void deleteUser(User user) {
        userDao.delete(user);
    }


    public Integer getCount(){
        return userDao.getCount();
    }

}
