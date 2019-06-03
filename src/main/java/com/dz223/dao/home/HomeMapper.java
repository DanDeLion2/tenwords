package com.dz223.dao.home;


import com.dz223.pojo.Home;

import java.util.List;
import java.util.Map;

public interface HomeMapper {
    List<Map<String,Object>> findAllHome(Map<String,Object> map);//根据条件筛选网站内容
    List<Map<String,Object>> getUserPermissionUrl(Map<String,Object> map);//查询用户菜单以及功能权限
    int addSitesIpCount(Map<String,Object> map);//记录网站访问记录
    List<Map<String,Object>> findByIpAndTime(Map<String,Object> map);//根据id当前时间查询记录
}
