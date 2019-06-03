package com.dz223.controller;

import com.dz223.pojo.Home;
import com.dz223.pojo.User;
import com.dz223.service.HomeService;
import com.dz223.service.UserService;
import com.dz223.util.Cryptography;
import com.dz223.util.DateUtil;
import com.dz223.util.GetIpUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*@RequestMapping(value="index")*/
@Controller
public class IndexController {
    @Autowired
    private UserService userService;
    @Autowired
    private HomeService homeService;

    /**
     * 获取网站主要资讯
     * @param hometype 获取网站分类信息
     * @param homestatus 发布内容当前的状态
     * @param page 分页(当前页码)
     * @param pageitem 分页(每页显示多少条)
     * @return
     */
    @RequestMapping(value = "/homelist",method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String,Object>>  tenwords(@RequestParam(value = "hometype")int hometype,
            @RequestParam(value = "page")int page,@RequestParam(value="pageitem")int pageitem,@RequestParam(value = "status",required = false,defaultValue = "1")String homestatus){
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("todayling", DateUtil.todayling()+DateUtil.HOURMONTM);
        map.put("yesterDayDate",DateUtil.yesterDayDate()+DateUtil.HOURMONTM);
        map.put("islimit","true");
        map.put("status",homestatus);
        map.put("page",page*pageitem);
        map.put("pageitem",pageitem);
        map.put("hometype",hometype);
        List<Map<String,Object>>  homeList=homeService.findAllHome(map);
        map.put("homeList",homeList);
        /*for (Home home:homeList){
            System.err.println("网站内容："+home.getHomecontent());
        }*/
        return homeList;
    }
    @RequestMapping("/bianji")
    public String bianji(){
        return "addUpdateHome";
    }

    /**
     * 网站首页
     * @return
     */
    @RequestMapping("/home")
    public String index() {
        return "home";
    }
    @RequestMapping("/")
    public String home(@RequestParam(value = "hometype",required = false,defaultValue = "1")int hometype,Model model,HttpServletRequest request) {
        /*GetIpUtil.getIPAddress(request);*/
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("userid","null");
        map.put("rolestate", 1);
        map.put("type","menu");//菜单
        List<Map<String,Object>> menu=homeService.getUserPermissionUrl(map);//菜单
        map.put("menulist",menu);
        map.put("type","functions");//功能
        List<Map<String,Object>> function=homeService.getUserPermissionUrl(map);//功能
        map.put("functionlist",function);

        map.put("todayling", DateUtil.todayling()+DateUtil.HOURMONTM);
        map.put("yesterDayDate",DateUtil.yesterDayDate()+DateUtil.HOURMONTM);
        map.put("islimit","true");
        map.put("status",1);
        map.put("page",0);
        map.put("pageitem",10);
        map.put("hometype",hometype);
        List<Map<String,Object>> homeList=homeService.findAllHome(map);
        map.put("homeList",homeList);
        model.addAttribute("map",map);
        String Ip=GetIpUtil.getIPAddress(request);
        map.put("sitesGetIp",Ip);
        map.put("kTime",DateUtil.todayling()+DateUtil.HOURMONTM);
        map.put("zTime",DateUtil.tomorrow()+DateUtil.HOURMONTM);
        map.put("createTime",DateUtil.today());
        List<Map<String,Object>> ipList=homeService.findByIpAndTime(map);
        if(ipList.size()==0)homeService.addSitesIpCount(map);
        map.put("countIp",ipList.size()+1);
        return "home";
    }

   /* @RequestMapping("/choiceHome")
    @ResponseBody
    public Map<String,Object> choiceHome(@RequestParam(value = "hometype",required = false,defaultValue = "1")int hometype,Model model,HttpServletRequest request) {
        *//*GetIpUtil.getIPAddress(request);*//*
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("userid","null");
        map.put("rolestate", 1);
        map.put("type","menu");//菜单
        List<Map<String,Object>> menu=homeService.getUserPermissionUrl(map);//菜单
        map.put("menulist",menu);
        map.put("type","functions");//功能
        List<Map<String,Object>> function=homeService.getUserPermissionUrl(map);//功能
        map.put("functionlist",function);

        map.put("todayling", DateUtil.todayling()+DateUtil.HOURMONTM);
        map.put("yesterDayDate",DateUtil.yesterDayDate()+DateUtil.HOURMONTM);
        map.put("islimit","true");
        map.put("status",1);
        map.put("page",0);
        map.put("pageitem",10);
        map.put("hometype",hometype);
        List<Home> homeList=homeService.findAllHome(map);
        map.put("homeList",homeList);
        model.addAttribute("map",map);
        String Ip=GetIpUtil.getIPAddress(request);
        map.put("sitesGetIp",Ip);
        map.put("kTime",DateUtil.todayling()+DateUtil.HOURMONTM);
        map.put("zTime",DateUtil.tomorrow()+DateUtil.HOURMONTM);
        map.put("createTime",DateUtil.today());
        List<Map<String,Object>> ipList=homeService.findByIpAndTime(map);
        if(ipList.size()==0)homeService.addSitesIpCount(map);
        map.put("countIp",ipList.size()+1);
        return map;
    }*/

    @RequestMapping("/login.html")
    public String login() {
        return "login";
    }
    /**
     * 用户登录
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> login(@RequestParam(value = "userNumber")String usernumber, @RequestParam(value = "passWord")String password
        , Model model, HttpServletRequest request, HttpSession session) {
        UsernamePasswordToken token=new UsernamePasswordToken();
        token.setUsername(usernumber.trim());
        Map<String,Object> map=new HashMap<String,Object>();
        String salt=userService.getUserSalt(usernumber.trim());
        String pass=Cryptography.getMd5String(password,salt!=null?salt:"com.dz223");
        User user=userService.getLoginUser(usernumber.trim());
        if (user!=null) {
            if (pass.equals(user.getUserpassword())) {
                session.setAttribute("User", user);
                session.setAttribute("uid", user.getUserid());
                User er = userService.getLoginUser(usernumber.trim());
                er.setSalt(null);
                er.setUserpassword(null);
                String date=DateUtil.today();
                map.put("lastlogintime", date);
                map.put("numberstate", 0);
                map.put("userstate", 1);
                map.put("userid", er.getUserid());
                map.put("userRolename",userService.selectUserRole(map));
                er.setUserstate(1);

                er.setLastlogintime(date);
                userService.updateLastlogintimeOrNumberstateOrUserstate(map);//更新账号在线状态
                model.addAttribute("user", er);
                model.addAttribute("msg", "登录成功");
                System.err.println("登录成功");
                map.put("userinfo", er);
                map.put("msg", "登录成功！");
                map.put("result", "true");
                //查询用户对应菜单及功能
                map.put("rolestate", 1);
                map.put("type","menu");//菜单
                List<Map<String,Object>> menu=homeService.getUserPermissionUrl(map);//菜单
                map.put("menulist",menu);
                map.put("type","functions");//功能
                /*List<Map<String,Object>> function=homeService.getUserPermissionUrl(map);//功能
                map.put("functionlist",function);*/
                return map;
            } else {
                model.addAttribute("msg", "密码错误！");
                System.err.println("密码错误！");
                map.put("msg", "密码错误！");
                map.put("result", "false");
                return map;
            }
        }else{
            model.addAttribute("msg", "请检查用户名或密码是否正确！");
            System.err.println("请检查用户名或密码是否正确！");
            map.put("msg", "请检查用户名或密码是否正确！");
            map.put("result", "false");
            return map;
        }
    }

    /**
     * 退出登录
     * @return
     */
    @RequestMapping(value = "/logout",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> logout(HttpSession session,@RequestParam(value = "userId")String userid){
        Subject subject=SecurityUtils.getSubject();
        subject.logout();
        /*session.invalidate()*//*.removeAttribute("User")*/;
        /*session.removeAttribute("uid");*/
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("userid", userid);
        map.put("lastlogintime", "null");
        map.put("numberstate", 0);
        map.put("userstate", 2);
        //更改账号登录状态
        userService.updateLastlogintimeOrNumberstateOrUserstate(map);
        map.put("result","true");
        return map;
    }
}
