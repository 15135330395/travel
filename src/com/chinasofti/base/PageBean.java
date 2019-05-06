package com.chinasofti.base;

/**
 * @Description PageBean
 * @Author WYR
 * @CreateTime 2019-04-27 16:17
 */
public class PageBean {
    /**
     * 当前页
     */
    private Integer index;
    /**
     * 总条数
     */
    private Integer count;
    /**
     * 每页条数
     */
    private Integer pageCount;

    /**
     * select 索引
     */
    public Integer getPageIndex() {
        return (index - 1) * pageCount;
    }

    /**
     * 总页数
     */
    public Integer getPages() {
        return (count + pageCount - 1) / pageCount;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public Integer getCount() {
        return count;
    }

    public Integer getIndex() {
        return index;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "index=" + index +
                ", count=" + count +
                ", pageCount=" + pageCount +
                '}';
    }
}

