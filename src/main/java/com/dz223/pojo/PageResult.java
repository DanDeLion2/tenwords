package com.dz223.pojo;

import java.util.List;

/**
 * 分页工具类
 * @param <T> 泛型
 */
public class PageResult<T> {
    private int total;// 总条数
    private int totalPage;// 总页数
    private int currentpage;//当前页
    private int pageitem;//每页显示几条
    private List<T> items;// 当前页数据

    public PageResult() {
    }

    public PageResult(int total, int totalPage, int currentpage, List<T> items) {
        this.total = total;
        this.totalPage = totalPage;
        this.currentpage = currentpage;
        this.items = items;
    }

    public int getPageitem() {
        return pageitem;
    }

    public void setPageitem(int pageitem) {
        this.pageitem = pageitem;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentpage() {
        return currentpage;
    }

    public void setCurrentpage(int currentpage) {
        this.currentpage = currentpage;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }
}
