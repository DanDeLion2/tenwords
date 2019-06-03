package com.dz223.pojo;

/**
 * 资源实体类
 */
public class Home {
    private int id;//内容主键id
    private String homeid;//网站内容编号
    private int hometype;//内容归属(1:十句话  2:十副图  3:十糗事 4:趣事百科  5:新闻网 6:广告)
    private String hometitle;//内容标题
    private String homecontent;//具体内容(含图片)
    private int homelike;//当前内容点赞总数
    private int homecomment;//当前评论总数
    private String createtime;//内容创建时间
    private String updatetime;//内容更新时间
    private int status;//当前内容状态(1发布 2下架 3投诉举报 4删除)


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHomeid() {
        return homeid;
    }

    public void setHomeid(String homeid) {
        this.homeid = homeid;
    }

    public int getHometype() {
        return hometype;
    }

    public void setHometype(int hometype) {
        this.hometype = hometype;
    }

    public String getHometitle() {
        return hometitle;
    }

    public void setHometitle(String hometitle) {
        this.hometitle = hometitle;
    }

    public String getHomecontent() {
        return homecontent;
    }

    public void setHomecontent(String homecontent) {
        this.homecontent = homecontent;
    }

    public int getHomelike() {
        return homelike;
    }

    public void setHomelike(int homelike) {
        this.homelike = homelike;
    }

    public int getHomecomment() {
        return homecomment;
    }

    public void setHomecomment(int homecomment) {
        this.homecomment = homecomment;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
