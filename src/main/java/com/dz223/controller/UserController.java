package com.dz223.controller;

import com.dz223.pojo.User;
import com.dz223.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dz223.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

import static com.dz223.util.FileUpload.FileUploads;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private UserService userservice;

	@RequestMapping(value = "/home")
	@ResponseBody
	public List<Map<String,Object>> home(){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		return list;
	}

	/**
	 * 更新密码（根据账号以及旧密码修改密码）
	 * @param newpass  新密码
	 * @param pass 原密码
	 * @param usernumber 账号
	 * @return
	 */
	@RequestMapping(value = "/updateByUserNumber",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateByUserNumber(
			@RequestParam(value = "newpass")String newpass, @RequestParam(value = "pass")String pass,
			@RequestParam(value = "usernumber")String usernumber){
		Map<String,Object> map = new HashMap<String,Object>();
		String salt=userservice.getUserSalt(usernumber.trim());
        String newsalt= RandomUtil.getrandom(6);
		map.put("newpass", Cryptography.getMd5String(newpass.trim(),newsalt));
		map.put("pass",Cryptography.getMd5String(pass.trim(),salt));
		map.put("usernumber",usernumber.trim());
        map.put("salt",newsalt);
		int result=userservice.updatePasswordByUserNumberAndPassword(map);
		if(result>0){
			map.put("msg","账号密码更新成功,请牢记密码！");
			map.put("result","true");
		}else{
			map.put("msg","账号密码更新失败，请检查账号或原密码是否正确！");
			map.put("result","false");
		}
		return map;
	}

	/**
	 * 查询用户账号密码是否匹配
	 * @param usernumber 账号
	 * @param pass 密码
	 * @return
	 */
	@RequestMapping(value = "/findPassword",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> findPassword(
			@RequestParam(value = "usernumber")String usernumber,@RequestParam(value = "pass")String pass){
		Map<String,Object> map =new HashMap<String,Object>();
		User user=userservice.getLoginUser(usernumber.trim());
		if(user!=null){
			if (user.getUserpassword().equals(Cryptography.getMd5String(pass,user.getSalt()))){
				map.put("msg","用户数据匹配！");
				map.put("result",true);
			}else{
				map.put("msg","用户密码错误！");
				map.put("result","false");
			}
		}else {
			map.put("msg","数据异常，未查询到当前账号！");
			map.put("result","false");}

		return map;
	}

	/**
	 * 查询是否存在（账号  昵称  号码公共方法）
	 * @param usernumber 账号
	 * @param phone 号码
	 * @param username 昵称
	 * @return
	 */
	/*@RequestMapping(value = "/selectUserNumberOrUserNameOrPhone")
	@ResponseBody
	public Map<String,Object> selectUserNumber(
			@RequestParam(value = "usernumber")String usernumber,@RequestParam(value = "phone")String phone
	,@RequestParam(value = "username")String username){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("usernumber",usernumber.trim());
		map.put("phone",phone.trim());
		map.put("username",username.trim());
		map.put("numberstate","3");
		User user=userservice.getUserByUserNameOrUserNumberOrPhone(map);
		if (user!=null){
			map.put("User",user);
			map.put("result","true");
			map.put("msg","账号已存在！");
		}else{
			map.put("User",null);
			map.put("result","false");
			map.put("msg","账号不存在！");
		}
		return map;
	}*/

	/**
	 * 查询账号是否存在
	 * @param usernumber 账号
	 * @return
	 */
	@RequestMapping(value = "/selectUserNumber",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectUserNumber(@RequestParam(value = "userNumber")String usernumber,
											   @RequestParam(value = "userId",required = false,defaultValue ="-1")String userId){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("usernumber",usernumber.trim());
		map.put("phone","null");
		map.put("username","null");
		map.put("numberstate","3");
		/*for (String k:map.keySet()){
			System.err.println(map.get(k));
		}*/
		User user=userservice.getUserByUserNameOrUserNumberOrPhone(map);
		if (user!=null){
			map.put("User",user);
			map.put("result","true");
			map.put("msg","账号已存在！");
		}else{
			map.put("User",null);
			map.put("result","false");
			map.put("msg","账号不存在！");
		}
		if (!userId.equals("-1")&&userId.equals(user.getUserid())){
			user.setSalt("-1");
			user.setUserpassword("-1");
			map.put("User",user);
			map.put("result","true");
		}else if (!userId.equals("-1")){
			map.put("User",null);
			map.put("result","false");
		}
		return map;
	}

	/**
	 * 查询电话是否存在
	 * @param phone 电话
	 * @return
	 */
	@RequestMapping(value = "/selectPhone")
	@ResponseBody
	public Map<String,Object> selectPhone(@RequestParam(value = "phone")String phone){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("usernumber","null");
		map.put("phone",phone.trim());
		map.put("username","null");
		map.put("numberstate","3");
		User user=userservice.getUserByUserNameOrUserNumberOrPhone(map);
		if (user!=null){
			map.put("User",user);
			map.put("result","true");
			map.put("msg","号码已存在！");
		}else{
			map.put("User",null);
			map.put("result","false");
			map.put("msg","号码不存在！");
		}
		return map;
	}

	/**
	 * 查询用户昵称是否存在
	 * @param username 昵称
	 * @return
	 */
	@RequestMapping(value = "/selectUserName")
	@ResponseBody
	public Map<String,Object> selectUserName(@RequestParam(value = "username")String username){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("usernumber", "null");
		map.put("phone","null");
		map.put("username",username.trim());
		map.put("numberstate","3");
		User user=userservice.getUserByUserNameOrUserNumberOrPhone(map);
		if (user!=null){
			map.put("User",user);
			map.put("result","true");
			map.put("msg","昵称已存在！");
		}else{
			map.put("User",null);
			map.put("result","false");
			map.put("msg","昵称不存在！");
		}
		return map;
	}


	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/addUserNumber",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addUserNumber(User user, @RequestParam(value = "file",required = false)MultipartFile file, HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
        /*System.err.println(user.getUsername()+"------------"+file+"  ____    "+file.getOriginalFilename());
        System.err.println(user.getUsername()+"    "+user.getUsernumber());*/
		/*User er=new User();*/
		String salt= RandomUtil.getrandom(6);
		String pass=user.getUserpassword();
		user.setUserpassword(Cryptography.getMd5String(pass.trim(),salt));
       /* System.err.println("pass:"+Cryptography.getMd5String(pass.trim(),salt).toCharArray());*/
        String userUUID=UUID.randomUUID().toString();
		user.setUserid(userUUID);
		user.setUserstate(2);//初始化账号未登录
		user.setNumberstate(3);//账号正常
		user.setSalt(salt);
		/*String path="C://十句话/用户/"+user.getUserid()+"/top/";*/
		/*String path=request.getContextPath() +"/十句话/用户/"+user.getUserid()+"/top/";*/
        /*request.getSession().getServletContext().getRealPath("十句话")*/
		/*"C://十句话/用户/"+user.getUserid()+"/top/";*/
		String path="C://十句话/用户/"+user.getUserid()+"/top/";
		String Ip= GetIpUtil.getIPAddress(request);//获取用户id
        user.setIp(Ip);
        /*System.err.println(file+"  ____    "+file);*/
		if(file.getOriginalFilename()!=null){
            try {
                Map<String,Object> m= FileUploads(path,file,request);
                if (m.get("result").toString().equals("true")){
                    user.setPortrait("/upload/用户/"+user.getUserid()+"/top/"+m.get("fileName").toString());
                }else{
                    user.setPortrait("默认头像");
                }
            } catch (IOException e) {
                /*e.printStackTrace();*/
                user.setPortrait("默认头像");

            }
        }else{
            user.setPortrait("默认头像");
        }
		user.setCreatetime(DateUtil.today());
		int result=userservice.addUserNumber(user);
		if (result>0){
		    map.put("userUUID",userUUID);
		    map.put("roleId","ten1004");
            userservice.addUserRole(map);//初始化用户角色
			map.put("result","true");
			map.put("msg","新增用户成功！");
		}else{
			map.put("result","false");
			map.put("msg","新增用户失败！");
		}
		return map;
	}
	/*@RequestMapping(value = "/updata",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updata(@RequestParam("file1")MultipartFile file, HttpServletRequest request, HttpSession session){
		System.err.println("上传文件");
		Map<String,Object> map =new HashMap<String,Object>();
		String path=request.getSession().getServletContext().getRealPath("十句话") +"\\用户"+"\\top\\";
		System.out.println(file.getOriginalFilename());
		if(file!=null){
			try {
				Map<String,Object> m=FileUpload.FileUploads(path,file,request);
				if (m.get("result").toString().equals("true")){
					map.put("file",m.get("path").toString());
					map.put("result","true");
				}else{
					map.put("file","头像上传失败");
					map.put("result","false");
				}
			} catch (IOException e) {
				e.printStackTrace();
				map.put("file","头像上传失败");
				map.put("result","false");

			}
		}else{
			map.put("file","默认头像");
			map.put("result","true");
		}
		return map;
	}*/

    /**
     * 修改用户资料
     * @param user
     * @return
     */
	@RequestMapping(value="/updateUserinfoOrLastState",method = RequestMethod.POST)
	public Map<String,Object> updateUserinfoOrLastState(User user, @RequestParam("file")MultipartFile file,HttpServletRequest request){
	    Map<String,Object> map =new HashMap<String,Object>();
        /*String path="C://十句话/用户/"+user.getUserid()+"/top/";*/
		/*String path=request.getContextPath() +"/十句话/用户/"+user.getUserid()+"/top/";*/
		/*request.getSession().getServletContext().getRealPath("十句话") +"\\用户\\"+user.getUserid()+"\\top\\";*/
		String path="C://十句话/用户/"+user.getUserid()+"/top/";
        if(file.getOriginalFilename()!=null){
            try {
                Map<String,Object> m= FileUploads(path,file,request);
                if (m.get("result").toString().equals("true")){
					user.setPortrait("/upload/用户/"+user.getUserid()+"/top/"+m.get("fileName").toString());
                }else map.put("msg","头像更新失败！");
            } catch (IOException e) {
                /*e.printStackTrace();*/
                map.put("msg","头像更新异常，请稍后再试！");

            }
        }
        user.setNumberstate(3);
        user.setUpdatetime(DateUtil.today());
        int result=userservice.updateUserinfoOrLastState(user);
        if (result>0){
            map.put("result","true");
            map.put("User",user);
        }else{
            map.put("result","true");
            map.put("User",null);
        }
	    return map;
    }

    /**
     * 查询分类列表
     * @return
     */
    @RequestMapping(value = "/HomeMenu")
    @ResponseBody
    public List<Map<String,Object>> selectHomeTypeGroupName(){
	    List<Map<String,Object>> map=userservice.selectHomeTypeGroupName("menu");
	    return map;
    }




}
