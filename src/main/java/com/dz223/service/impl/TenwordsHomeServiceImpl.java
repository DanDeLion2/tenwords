package com.dz223.service.impl;

import com.dz223.dao.context.TenwordsHomeMapper;
import com.dz223.pojo.TenwordsHome;
import com.dz223.service.TenwordsHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TenwordsHomeServiceImpl implements TenwordsHomeService {
    @Autowired
    private TenwordsHomeMapper tenwordsHomeMapper;

    @Override
    public int addTenWordsHome(TenwordsHome tenwordsHome) {
        return tenwordsHomeMapper.addTenWordsHome(tenwordsHome);
    }

    @Override
    public int addUserIpHome(Map<String, Object> map) {
        return tenwordsHomeMapper.addUserIpHome(map);
    }

    @Override
    public int updateLikeOrComment(Map<String, Object> map) {
        return tenwordsHomeMapper.updateLikeOrComment(map);
    }

    @Override
    public int findByUserIdAndIpAndHomeIdByTime(Map<String, Object> map) {
        return tenwordsHomeMapper.findByUserIdAndIpAndHomeIdByTime(map);
    }

    @Override
    public int delUserIdIpHome(Map<String, Object> map) {
        return tenwordsHomeMapper.delUserIdIpHome(map);
    }

    @Override
    public Map<String, Object> selectTenwordsHomeByHomeid(Map<String, Object> map) {
        return tenwordsHomeMapper.selectTenwordsHomeByHomeid(map);
    }

    @Override
    public List<Map<String, Object>> selectAllHomeListByUserOrRole(Map<String, Object> map) {
        return tenwordsHomeMapper.selectAllHomeListByUserOrRole(map);
    }

    @Override
    public Integer selectCountHomeListByUserOrRole(Map<String, Object> map) {
        return tenwordsHomeMapper.selectCountHomeListByUserOrRole(map);
    }
}
