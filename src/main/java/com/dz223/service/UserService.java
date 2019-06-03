package com.dz223.service;

import com.dz223.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    User getLoginUser(String usernumber);//查询账号信息
    String getUserSalt(String usernumber);//查询账号盐
    int updatePasswordByUserNumberAndPassword(Map<String,Object> map);//根据用户名密码更新账号密码
    User getUserByUserNameOrUserNumberOrPhone(Map<String,Object> map);//根据昵称、账号、电话查询用户
    int addUserNumber(User user);//注册新用户
    int updateUserinfoOrLastState(User user);//修改用户以及更新账号信息
    int updateLastlogintimeOrNumberstateOrUserstate(Map<String,Object> map);//更新用户登录状态 登录时间 账号状态
    int addUserRole(Map<String,Object> map);//初始化注册用户身份为用户角色
    Map<String,Object> selectUserRole(Map<String,Object> map);//查询角色name
    List<Map<String,Object>> selectHomeTypeGroupName(String types);//查询内容分类

}
