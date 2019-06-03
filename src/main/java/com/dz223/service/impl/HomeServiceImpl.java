package com.dz223.service.impl;

import com.dz223.dao.home.HomeMapper;
import com.dz223.pojo.Home;
import com.dz223.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HomeServiceImpl implements HomeService {
    @Autowired
    private HomeMapper homeMapper;

    @Override
    public List<Map<String,Object>>  findAllHome(Map<String, Object> map) {
        return homeMapper.findAllHome(map);
    }

    @Override
    public List<Map<String, Object>> getUserPermissionUrl(Map<String, Object> map) {
        return homeMapper.getUserPermissionUrl(map);
    }

    @Override
    public int addSitesIpCount(Map<String, Object> map) {
        return homeMapper.addSitesIpCount(map);
    }

    @Override
    public List<Map<String, Object>> findByIpAndTime(Map<String, Object> map) {
        return homeMapper.findByIpAndTime(map);
    }
}
