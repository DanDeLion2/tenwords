package com.dz223.realm;

import com.dz223.pojo.User;
import com.dz223.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

public class MyRealm  extends AuthorizingRealm {

    @Resource
    private UserService userService;
    /**
     * 认证权限
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    /**
     * 登录验证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username=(String)token.getPrincipal();
        /*System.err.println("进行验证");*/
        User user=(User) userService.getLoginUser(username);
        System.err.println("----------------数数据库："+user.getUserpassword().toCharArray());
        System.err.println("----------------数数据库："+user.getUserpassword());
        /*System.err.println("数据库中的密码："+user.getUserpassword().toCharArray());*/
        if(user!=null){
            /*System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");*/
            AuthenticationInfo authenticationInfo=new SimpleAuthenticationInfo(user,user.getUserpassword(),"dz223");
            return authenticationInfo;
        }else{
           /* System.out.println("-----------------------------------------------------------");*/
            return null;
        }
    }
}
