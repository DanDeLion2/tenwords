package com.dz223.controller;

import com.dz223.pojo.TenwordsHome;
import com.dz223.service.TenwordsHomeService;
import com.dz223.util.DateUtil;
import com.dz223.util.FileUpload;
import com.dz223.util.GetIpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

import static com.dz223.util.FileUpload.FileUploads;

@Controller
@RequestMapping("/ct")
public class TenwordsHomeController {
    @Autowired
    private TenwordsHomeService tenwordsHomeService;

    /**
     * 新增网站内容编辑
     * @param tenwordsHome
     * @return
     */
    @RequestMapping(value = "/addTenWordsHome",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addTenWordsHome(TenwordsHome tenwordsHome, @RequestParam(value = "filehome",required = false) MultipartFile file, HttpServletRequest request){
        Map<String,Object> map =new HashMap<String,Object>();
        tenwordsHome.setHomeid(UUID.randomUUID().toString());
        tenwordsHome.setCreatetime(DateUtil.today());
        tenwordsHome.setStatus(2);
        /*String path="C://十句话/用户/"+tenwordsHome.getUserid()+"/内容编辑图/";*/
        String path=request.getSession().getServletContext().getRealPath("十句话") +"\\用户\\"+tenwordsHome.getUserid()+"\\内容编辑图\\";
        if(file!=null){
            try {
                Map<String,Object> m= FileUploads(path,file,request);
                if (m.get("result").toString().equals("true")){
                    tenwordsHome.setHomecontent(m.get("path").toString());
                }else{
                    tenwordsHome.setHomecontent("发布图上传失败");

                }
            } catch (IOException e) {
                /*e.printStackTrace();*/
                tenwordsHome.setHomecontent("发布图上传失败");

            }
        }else{
            tenwordsHome.setHomecontent("默认发布图");
        }
        System.err.println("          --------------- "+tenwordsHome.getHomeid());
        if (tenwordsHomeService.addTenWordsHome(tenwordsHome)>0){
            map.put("result","true");
            map.put("msg","新增成功！");
        }else{
            map.put("result","false");
            map.put("msg","新增失败！");
        }
        return map;
    }

    /**
     * 用户点赞评论操作记录
     * @param userid 用户编码
     * @param type 点赞Or评论(1:点赞  2:评论)
     * @param context 评论内容
     * @param homeid 操作内容编码
     * @return
     */
    @RequestMapping(value = "/likeOrComment",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> likeOrComment(@RequestParam(value = "userid",required = false,defaultValue = "")String userid,
                                            @RequestParam(value = "type")int type,HttpServletRequest request,
                                            @RequestParam(value = "homeid")String homeid,@RequestParam(value = "context",required = false,defaultValue = "")String context){
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("userid",userid.trim()==""?-1:userid.trim());
        map.put("type",type);
        map.put("homeid",homeid.trim());
        map.put("createtime",DateUtil.today());
        map.put("context",context.trim());
        map.put("status",1);
        String Ip= GetIpUtil.getIPAddress(request);
        map.put("sitesGetIp",Ip);
        map.put("kTime",DateUtil.todayling()+DateUtil.HOURMONTM);
        map.put("zTime",DateUtil.tomorrow()+DateUtil.HOURMONTM);
        if (type==1){//点赞
            if (tenwordsHomeService.findByUserIdAndIpAndHomeIdByTime(map)>0){//存在
                if (tenwordsHomeService.delUserIdIpHome(map)>0){
                    Map<String,Object> m=tenwordsHomeService.selectTenwordsHomeByHomeid(map);
                    /*int dz=Integer.parseInt(m.get("homelike").toString())-1;*/
                    /*int pl=Integer.parseInt(m.get("homecomment").toString())-1;*/
                    map.put("homelike",(Integer.parseInt(m.get("homelike").toString())-1));
                    if(tenwordsHomeService.updateLikeOrComment(map)>0){
                        map.put("msg","取消点赞成功！");
                        map.put("result","t");
                    }else{
                        map.put("msg","取消点赞失败！");
                        map.put("result","false");
                    }
                }else map.put("msg","取消点赞失败！");
            }else{//不存在
                if(tenwordsHomeService.addUserIpHome(map)>0){
                    Map<String,Object> m=tenwordsHomeService.selectTenwordsHomeByHomeid(map);
                    map.put("homelike",(Integer.parseInt(m.get("homelike").toString())+1));
                    if(tenwordsHomeService.updateLikeOrComment(map)>0){
                        map.put("msg","点赞成功！");
                        map.put("result","true");
                    }else{
                        map.put("msg","点赞失败！");
                        map.put("result","false");
                    }
                }else map.put("msg","点赞失败！");
            }

        }else if (type==2){//评论
            if (tenwordsHomeService.findByUserIdAndIpAndHomeIdByTime(map)>0){//存在
                if (tenwordsHomeService.delUserIdIpHome(map)>0){
                    Map<String,Object> m=tenwordsHomeService.selectTenwordsHomeByHomeid(map);
                    map.put("homecomment",(Integer.parseInt(m.get("homecomment").toString())-1));
                    if(tenwordsHomeService.updateLikeOrComment(map)>0){
                        map.put("msg","删除评论成功！");
                        map.put("result","true");
                    }else{
                        map.put("msg","删除评论失败！");
                        map.put("result","false");
                    }
                }else map.put("msg","删除评论失败！");
            }else{//不存在
                if(tenwordsHomeService.addUserIpHome(map)>0){
                    Map<String,Object> m=tenwordsHomeService.selectTenwordsHomeByHomeid(map);
                    map.put("homecomment",(Integer.parseInt(m.get("homecomment").toString())+1));
                    if(tenwordsHomeService.updateLikeOrComment(map)>0){
                        map.put("msg","成功发布评论！");
                        map.put("result","true");
                    }else{
                        map.put("msg","发布评论失败！");
                        map.put("result","false");
                    }
                }else map.put("msg","发布评论失败！");
            }
        }else if (type==3){//举报
            if (tenwordsHomeService.findByUserIdAndIpAndHomeIdByTime(map)>0){//存在
                map.put("result","true");
                map.put("msg","您已举报过当前内容，请无需多次操作！");
            }else{//不存在
                if(tenwordsHomeService.addUserIpHome(map)>0){
                    map.put("result","true");
                    map.put("msg","举报成功，管理员正在审核！如有疑问请联系管理员qq:1023660552");
                }else map.put("msg","举报失败！");
            }
        }else map.put("result","false");
        return map;
    }

    /**
     * 加载列表(条件查询   分页)
     * @param userRole 用户角色
     * @param pageItem 每页显示多少
     * @param page 从第几条开始
     * @param homeTitle 标题
     * @param userNumber 账号
     * @param homeType 内容类型
     * @param userId 用户id
     * @param status 内容状态
     * @param createTime 创建时间
     * @return
     */
    @RequestMapping(value = "/selectAllHomeListByUserOrRole",method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String,Object>> selectAllHomeListByUserOrRole(@RequestParam(value = "userRole")String userRole,@RequestParam(value = "pageItem",required = false,defaultValue = "15")String pageItem,
                                                                  @RequestParam(value = "page")String page,@RequestParam(value = "homeTitle")String homeTitle,
                                                                  @RequestParam(value = "userNumber")String userNumber,@RequestParam(value = "homeType")String homeType,
                                                                  @RequestParam(value = "userId")String userId,@RequestParam(value = "status")String status,
                                                                  @RequestParam(value = "createTime")String createTime){
        List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
        System.err.println("pageItem-->>{}"+pageItem.trim());
        Map<String,Object> map=new HashMap<String,Object>();
        Map<String,Object> m=new HashMap<String,Object>();
        map.put("userRole",userRole.trim());
        map.put("pageItem",Integer.parseInt(pageItem.trim()));
        map.put("page",Integer.parseInt(page.trim())*Integer.parseInt(pageItem.trim()));
        map.put("homeTitle",homeTitle.trim());
        map.put("userNumber",userNumber.trim());
        map.put("homeType",homeType.trim());
        map.put("userId",userId.trim());
        map.put("statuss",status.trim());
        map.put("createTime",createTime.trim());

        m.put("totalRecord",(tenwordsHomeService.selectCountHomeListByUserOrRole(map)+Integer.parseInt(pageItem.trim())-1)/Integer.parseInt(pageItem.trim()));//总页数

        list=tenwordsHomeService.selectAllHomeListByUserOrRole(map);

        list.add(m);

        return list;
    }


}
