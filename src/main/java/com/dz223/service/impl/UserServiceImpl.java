package com.dz223.service.impl;

import com.dz223.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dz223.dao.user.UserMapper;
import com.dz223.service.UserService;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userDao;

	@Override
	public User getLoginUser(String usernumber) {
		return userDao.getLoginUser(usernumber);
	}

	@Override
	public String getUserSalt(String usernumber) {
		return userDao.getUserSalt(usernumber);
	}

	@Override
	public int updatePasswordByUserNumberAndPassword(Map<String, Object> map) {
		return userDao.updatePasswordByUserNumberAndPassword(map);
	}

	@Override
	public User getUserByUserNameOrUserNumberOrPhone(Map<String, Object> map) {
		return userDao.getUserByUserNameOrUserNumberOrPhone(map);
	}

	@Override
	public int addUserNumber(User user) {
		return userDao.addUserNumber(user);
	}

	@Override
	public int updateUserinfoOrLastState(User user) {
		return userDao.updateUserinfoOrLastState(user);
	}

	@Override
	public int updateLastlogintimeOrNumberstateOrUserstate(Map<String, Object> map) {
		return userDao.updateLastlogintimeOrNumberstateOrUserstate(map);
	}

	@Override
	public int addUserRole(Map<String, Object> map) {
		return userDao.addUserRole(map);
	}

    @Override
    public Map<String, Object> selectUserRole(Map<String, Object> map) {
        return userDao.selectUserRole(map);
    }

    @Override
    public List<Map<String, Object>> selectHomeTypeGroupName(String types) {
        return userDao.selectHomeTypeGroupName(types);
    }
}
