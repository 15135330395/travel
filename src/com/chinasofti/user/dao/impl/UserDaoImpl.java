package com.chinasofti.user.dao.impl;

import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.user.dao.UserDao;
import com.chinasofti.user.entity.User;
import org.springframework.stereotype.Repository;

/**
 * @author haoyu
 * date ：2019/4/27
 */
// 持久层
@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao<User> {
}
