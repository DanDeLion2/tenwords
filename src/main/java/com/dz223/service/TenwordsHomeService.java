package com.dz223.service;

import com.dz223.pojo.TenwordsHome;

import java.util.List;
import java.util.Map;

public interface TenwordsHomeService {
    int addTenWordsHome(TenwordsHome tenwordsHome);//新增网站内容编辑
    int addUserIpHome(Map<String,Object> map);//新增点赞或评论记录
    int updateLikeOrComment(Map<String,Object> map);//更新编辑内容的点赞数以及评论数
    int findByUserIdAndIpAndHomeIdByTime(Map<String,Object> map);//根据当天查询当前内容符合的点赞或评论记录是否存在
    int delUserIdIpHome(Map<String,Object> map);//删除点赞记录或删除评论记录
    Map<String,Object> selectTenwordsHomeByHomeid(Map<String,Object> map);//根据内容编码查询当前内容的点赞评论数
    List<Map<String,Object>> selectAllHomeListByUserOrRole(Map<String,Object> map);//查询分类列表
    Integer selectCountHomeListByUserOrRole(Map<String,Object> map);//查询内容总数
}
