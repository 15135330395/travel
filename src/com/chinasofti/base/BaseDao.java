package com.chinasofti.base;

import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * @Description BaseDao
 * @Author WYR
 * @CreateTime 2019-04-27 15:54
 */
public interface BaseDao<T> {

    /**
     * 查询全部信息
     *
     * @return
     */
    List<T> queryAll();

    /**
     * 查询全部信息的分页
     *
     * @param pageBean
     * @return
     */
    List<T> queryByPageBean(PageBean pageBean);

    /**
     * 通过id查询
     *
     * @param id 实体类中的字段
     * @return
     */
    T queryById(Integer id);

    /**
     * 单条查询
     * 底层代码为 from className where 字段名 = 查询条件
     * 在service层调用的时候可以指定字段名
     *
     * @param field 实体类中的字段
     * @param name  查询条件
     * @return
     */
    T queryByName(String field, String name);

    /**
     * 添加
     *
     * @param t
     */
    void add(T t);

    /**
     * 修改
     *
     * @param t
     */
    void update(T t);

    /**
     * 删除
     *
     * @param t
     */
    void delete(T t);

    /**
     * 查询总数
     *
     * @return
     */
    Integer getCount();


}
