
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" /><%--http://24n883u013.zicp.vip ${pageContext.request.contextPath}--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>十句话Dz223</title>
    <%--收藏用logo图标--%>
    <link rel="bookmark"  type="image/x-icon"  href="${ctx}/static/img/favicon.ico"/>
    <%--网站显示页logo图标--%>
    <link rel="shortcut icon" href="${ctx}/static/img/home.ico"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <%--<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
    </script>--%>
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.8.3.min.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/head/head.js"></script>--%>
    <link type="text/css" href="${ctx}/static/css/home/home.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        ul{
            list-style: none;
        }
        .nav1>li{
            float: left;
        }
        .nav1 ul a{
            display: block;
            text-decoration: none;
            width: 100%;
            height: 50px;
            text-align: center;
            line-height: 50px;
            color: white;
            background-color: orchid;
        }
        .nav1>li:first-child a{
            border-radius: 10px 10px 10px 10px;
        }
        .nav1>li:last-child a{
            border-radius: 10px 10px 10px 10px;
        }
        .nav1>li>a{
            margin: 0px;
            padding: 0px;
        }
        .drop-down{
            /*position: relative;*/
            height: 50px;
            /*position:relative;*/
        }
        .drop-down-content{
            padding: 0;
            /*opacity: 1;*/
            position:relative;
            height: 0;
            overflow: hidden;
            transition: all 1s ease;
            /*position: absolute;*/
        }

        .w{
            clear: none;
            /*position: relative;*/
            z-index: -1;/*问题*/
        }
        .drop-down-content li:hover a{
            background-color:red;
            z-index: 1;
        }
        .nav1> .drop-down:hover .drop-down-content{
            opacity: 0.9;
            height: auto;
            z-index: 1;
        }
        .nav0{
            border-radius: 10px 10px 10px 10px;
            /*float: left;*/
            width: 70%;
            height: 50px;
            padding-left: 1.5%;
            padding-top: 0.5%;
            /*border: 1px solid red;*/
            margin-left:15%;
            font-size: 2.5rem;
            background-color: deepskyblue;
            /*background-color: dodgerblue;*/
        }
    </style>
</head>
<style type="text/css">
    .top0 {
        width: 100%;
        height: 5%;
        background-color: #F6F6F6;
    }
    .top0 .toplinks0 {
        float: right;
        list-style: none;
        width: 50%;
        padding-right: 0%;
        font-size: 1.4rem;
    }
</style>
<script type="text/javascript">
    $(function () {
        if (<%=session.getAttribute("uid")!=null %>){
            $('#userId').val('<%=session.getAttribute("uid")%>');
        }else $('#userId').val('-1');
        var userId=$('#userId').val();
        if (userId!="-1"&&userId!='') {
            $('.dlcd').show();
            $('.dlOrzc').hide();
            /*alert($('#userId').val())*/
        }else {$('.dlcd').hide();
            $('.dlOrzc').show();}

    })
    function jzcd() {
        var userId=$('#userId').val();
        if (userId!="-1"&&userId!='') {
            $('.dlcd').show();
            $('.dlOrzc').hide();
            /*alert($('#userId').val())*/
        }else {$('.dlcd').hide();
            $('.dlOrzc').show();}
    }
</script>
<body style="background-color: cornsilk;">
<input type="hidden" id="userId" name="userId" class="userId"value="-1" readonly="readonly" disabled="disabled"/>
<input type="hidden" id="zhanghao" name="zhanghao" class="zhanghao"value="-1" readonly="readonly" disabled="disabled"/>
<input type="hidden" id="jsr" name="jsr" class="jsr" value="-1" readonly="readonly" disabled="disabled"/>
<%--<button type="button" onclick="jzcd();" style="width: 50%">test</button>--%>

<div id="top0" class="top0" style="border-color: bisque;font-size: 2.0rem;">
    <span class="top_span1">德智天堂娱乐网 - 每天十句话，开心一整天！</span>

    <div class="toplinks">
        <ul class="toplinks0">
            <li>
                [
                <a href="#" target='_blank'>
                    <font color=red>2018年德智天堂会所成立教案</font>
                </a>]
            </li>
            <li>
                [<a href="" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.dz223.com');">设为首页</a>]
            </li>
            <li>
                [<a href="javascript:window.external.AddFavorite('http://www.dz223.com','德智天堂娱乐网')">加入收藏</a>]
            </li>
            <li>
                [<a href="#" target=_blank>广告业务</a>]
            </li>
        </ul>
    </div>
</div>
<div style="width: 70%;margin-left: 15%">
    <div>
        <a href="#"><img src="${ctx}/static/img/dz223.png" alt="德智天堂娱乐网" title="德智天堂娱乐网"></a>
    </div>
    <script type="text/javascript">
        function clock() {
            var time = new Date().toLocaleString();
            document.getElementById("clock").innerHTML = time;
        }
        setInterval("clock()", 1000);
    </script>
    <span id="clock" style="font-family: monospace; font-size: 2.4rem; color:darkorange;"></span>
    <div id="menu_2 " class="menu_2 " style="float: right;">
        <span style="color: black; font-family:monospace; "><strong>德智娱乐官方群:</strong></span><a target="_blank " href="//shang.qq.com/wpa/qunwpa?idkey=10f136ad5d7354668c3853b1c3e12b0bbe184720876013e6870f62429144f5da"><img border="0 " src="//pub.idqqimg.com/wpa/images/group.png " alt="德智娱乐官方群 " title="德智娱乐官方群 "></a><br/><span style="color: black; font-family:monospace; "><strong>德智娱乐官方群:</strong></span><a href="# ">778918428</a>
    </div>
</div>
<%--基本登录Or注册功能--%>
<div class="nav0 dlOrzc">
    <ul class="nav1" style="background-color: deepskyblue;">
        <li class="drop-down"><a href="#">核心</a>
            <ul class="drop-down-content">
                <li><a href="#" data-toggle="modal" data-target="#myModalDly">回家-登录</a></li>
                <li><a href="#" data-toggle="modal"  onclick="UpdateUserinfo('1')">入驻-注册</a></li>
            </ul>
        </li>
    </ul>
</div>



<%--网站登录功能--%>
<div class="nav0 dlcd" style="display: none;border: 1px solid red;">
    <ul class="nav1" style="background-color: deepskyblue;">
        <li class="drop-down" style="border-radius: 50%;"><a href="#"><span class="userTop"><img src="${ctx}/static/img/动图.gif" style="border-radius: 50%;margin-top:-4%" width="50px" height="50px" title="头像" alt="头像"/></span></a><span style="border-radius: 30%;font-family: 宋体;" class="usernameinfo"></span>
            <ul class="drop-down-content">
                <li class="qiandao"><a href="#" onclick="">签到</a></li>
                <li class="yuwoxiangguan"><a href="#" onclick="">与我相关</a></li>
                <li class="bianjigerenxinxi"><a href="#" onclick="UpdateUserinfo('2')">编辑个人信息</a></li>
                <li class="xiugaimima"><a href="#" onclick="updatemima()">修改回家密码</a></li>
                <li class="tuichu"><a href="#" onclick="outlogin()">出去浪会—退出</a></li>
                <li class="yijianxiang"><a href="#" onclick="">意见箱</a></li>
                <li class="dengjitisheng"><a href="#" onclick="">等级提升</a></li>
            </ul>
        </li>
        <li class="drop-down wodeshoucang" style="border-radius: 50%;margin-left: 3%"><a href="#"><span>我的收藏</span></a></li>
        <li class="drop-down fabuneirongguanli" style="border-radius: 50%;margin-left: 3%" id="neirongbianji"><a href="#"><span>发布内容管理</span></a>
            <%--<ul class="drop-down-content">
                <li><a href="#" onclick="">趣事百科</a></li>
                <li><a href="#" onclick="">短视频</a></li>
                <li><a href="#" onclick="">福利地址</a></li>
                <li><a href="#" onclick="">网站主发布提交</a></li>
            </ul>--%>
        </li>
       <%-- <li class="drop-down fabu" style="border-radius: 50%;"><a href="#"><span class="userTop">发布</span></a><span style="border-radius: 30%;font-family: 宋体;" class="usernameinfo"></span>
            <ul class="drop-down-content">
                <li><a href="#" onclick="">趣事百科</a></li>
                <li><a href="#" onclick="">短视频</a></li>
                <li><a href="#" onclick="">福利地址</a></li>
                <li><a href="#" onclick="">网站主发布提交</a></li>
            </ul>
        </li>--%>
        <%--<li class="drop-down" style="border-radius: 50%;"><a href="#"><span class="userTop">发布内容管理</span></a><span style="border-radius: 30%;font-family: 宋体;" class="usernameinfo"></span>
        </li>--%>
        <%--<li class="drop-down bianjineirong" style="border-radius: 50%;"><a href="#"><span class="userTop">编辑内容</span></a><span style="border-radius: 30%;font-family: 宋体;" class="usernameinfo"></span>
            <ul class="drop-down-content">
                <li class="bianjifabuneirong"><a href="#" onclick="">编辑发布内容</a></li>
                <li class="bianjiwangzhancaidan"><a href="#" onclick="">编辑网站菜单</a></li>
            </ul>
        </li>--%>
        <li class="drop-down wangzhanguanli" style="border-radius: 50%;margin-left: 3%"><a href="#"><span>网站管理</span></a>
            <ul class="drop-down-content" style="opacity:0.9">
                <li class="yonghufabushenhe"><a href="#" onclick="">用户发布审核</a></li>
                <li class="dengjishenhe"><a href="#" onclick="">等级审核</a></li>
                <li class="dengjiguanli"><a href="#" onclick="">等级管理</a></li>
                <li class="dengjishenhe"><a href="#" onclick="">ip记录</a></li>
                <li class="bianjiwangzhancaidan"><a href="#" onclick="">编辑网站菜单</a></li>
            </ul>
        </li>
        <li class="drop-down renyuanguanli" style="border-radius: 50%;"><a href="#"><span>人员管理</span></a>
        </li>

    </ul>
</div>
<%--<button id="neirongbianji">内容编辑</button>--%>
<script type="text/javascript">
    function updatemima() {
        $('#upateUsernumber').val($('#zhanghao').val());
        $('#updatepassmyModal').modal('show');
    }
    $('#neirongbianji').on('click',function () {
        var path=$('#path').val();
        /*window.location.href=path+"bianji";*/
        /*var up='../addUpdateHome.jsp';*/
        $('.zhuneirong').hide();
        $('.neirongbianji').show();
        fabuneirongliebiaoye('1');
        $('#hometypeid').val('1');

    })
    function fabuneirongliebiaoye(val) {
        var path=$('#path').val();
        var userRole=$('#jsr').val();
        var pageItem=$('#pageItems').val()==undefined?'15':$('#pageItems').val();
        var page=$('#pages').val()==undefined?'0':$('#pages').val();
        var homeTitle=$('#homeTitles').val()==undefined?'-1':$('#homeTitles').val();
        var userNumber=$('#userNumbers').val()==undefined?'-1':$('#userNumbers').val();
        var homeType=$('#homeTypes').val()==undefined?'-1':$('#homeTypes').val();
        var userId=$('#userIds').val()==undefined?'-1':$('#userIds').val();
        var status=$('#statuss').val()==undefined?'-1':$('#statuss').val();
        var createTime=$('#createTimes').val()==undefined?'-1':$('#createTimes').val();
        /*alert(pageItem)*/
        $.ajax({
            url:path+'ct/selectAllHomeListByUserOrRole',
            type:'POST',
            data:{'userRole':userRole,'pageItem':pageItem,'page':page,'homeTitle':homeTitle,'userNumber':userNumber,'homeType':homeType,'userId':userId,'status':status,'createTime':createTime},
            dateType:'JSON',
            success:function (re) {
                console.info(re);
                var totalRecord=0;
                $('.trboby').html('');
                var trboby="";
                for (i=0;i<=re.length-2;i++) {
                    totalRecord=re[i+1].totalRecord;
                    var status='';
                    if (re[i].status==1) status='发布';
                    else if (re[i].status==2) status='下架';
                    else if (re[i].status==3) status='投诉举报';
                    else if (re[i].status==4) status='删除';
                    trboby+='<tr><td>'+(i+1)+'</td>';
                    trboby+='<td>'+re[i].permissionname+'</td>';
                    trboby+='<td>'+re[i].usernumber+'</td>';
                    trboby+='<td>'+re[i].hometitle+'</td>';
                    trboby+='<td>'+re[i].homecontent+'</td>';
                    trboby+='<td>'+re[i].homelike+'</td>';
                    trboby+='<td>'+re[i].homecomment+'</td>';
                    trboby+='<td><span class="xs'+re[i].homeid+(i+1)+'">'+(status)+'</span><span class="sel'+re[i].homeid+(i+1)+'" hidden="hidden"><select><option>发布</option><option>下架</option></select></span></td>';
                    trboby+='<td>'+re[i].createtime+'</td>';
                    trboby+='<td>'+re[i].updatetime+'</td></tr>';
                }
                /*$.each(re,function (idx,r) {


                })*/
                    $('.trboby').html(trboby);

                    $('.neirongfenye').html('');
                    var li='<li class="fenye"><a href="#" class="you" onclick="fenye(\'you\')">&laquo;</a></li>';
                    for(i=1;i<=parseInt(totalRecord);i++){
                        if(i==1){
                            li+='<li class="active fenye"><a href="#" class="'+i+'" onclick="fenye('+i+')">'+i+'</a></li>';
                        }else{
                            li+='<li class="fenye"><a href="#" class="'+i+'" onclick="fenye('+i+')">'+i+'</a></li>';
                        }
                    }
                    li+='<li class="fenye"><a href="#" class="zuo" onclick="fenye(\'zuo\')">&raquo;</a></li>';
                    $('.neirongfenye').html(li);
                    $('.dangqianyeshu').val('1');
                }
        })

    }
</script>
<%--<h2>登录</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalDly">
    开始演示登录模态框
</button>--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModalDly" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>--%>
                <h4 class="modal-title" id="myModalLabelDL">
                    登录页(<a href="#">dz223.com</a>)
                </h4>
            </div>
            <div class="modal-body">
                <div class="input-group">
                    <span class="input-group-addon z">账号</span>
                    <input type="text" class="form-control" placeholder="账号" value="S" onKeyUp="value=value.replace(/[\W]/g,'S')" maxlength="16" name="userNumberDl" id="userNumberDl"/>
                </div>
                <div class="input-group">
                    <span class="input-group-addon m">密码</span>
                    <input type="password" class="form-control" placeholder="密码" maxlength="18" name="userPassDl" id="userPassDl"/>
                    <span class="input-group-addon"><a href="#">忘记密码？</a></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default dlqx" data-dismiss="modal">
                    在浪一会
                </button>
                <button type="button" class="btn btn-primary userDl">
                    回家
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    $(function () { $('#myModalDly').modal('hide')});
</script>
<script>
    /*$(function () { $('#myModalDly').on('hide.bs.modal', function () {
        $('.m').css("color","#000000");
        $('.z').css("color","#000000");
        $('#userNumberDl').val('');
        $('#userPassDl').val('');
        dLmt('myModalDly');
    })
    });*/
    $('#dlqx').on('click',function () {
        $('.m').css("color","#000000");
        $('.z').css("color","#000000");
        $('#userNumberDl').val('S');
        $('#userPassDl').val('');
        dLmt('myModalDly');

    })
    function dLmt(val){
        $('#userNumberDl').val('S');
        $('#userPassDl').val('');
        $('.m').css("color","#000000");
        $('.z').css("color","#000000");
        $('#'+val).modal('hide');
    }
    $('.userDl').on('click',function(){
        var path=$('#path').val();
        var userNumber=$('#userNumberDl').val();
        var userPassDl=$('#userPassDl').val();
        var S=userNumber.substring(0,1);
        if(S!='S'){
            alert('账号格式正确，账号前缀必须以S开头');
            $('#userNumberDl').val('S'+userNumber);
            $('.z').css("color","red");
            return;
        }
        if(userNumber==""||userNumber==undefined){
            confirm('您忘记输入账号啦！');
            $('.z').css("color","red");
            return;
        }else $('.z').css("color","#000000");
        if(userPassDl==""||userPassDl==undefined){
            confirm('您忘记输入密码啦！');
            $('.m').css("color","red");
            return;
        }else $('.m').css("color","#000000");
        if(userNumber!=""||userNumber!=undefined&&userPassDl!=""||userPassDl!=undefined){
            $.ajax({
                url:path+'login',
                data:{'userNumber':userNumber,'passWord':userPassDl},
                dataType:'JSON',
                type:'POST',
                success:function(r){
                    if(r.result=='true'){
                        confirm(r.msg);
                        /*console.info(r);*/
                        dLmt('myModalDly');
                        $('.modal-backdrop').hide();
                        $('#userPassDl').val('');
                        if (r.userinfo.portrait=='默认头像'){
                            $('.userTop').html('<img src="${ctx}/static/img/动图.gif" style="border-radius: 50%;margin-top:-4%" width="50px" height="50px" title="头像" alt="头像"/>');
                        }else{
                            $('.userTop').html('<img src="${pageContext.request.contextPath}'+(r.userinfo.portrait)+'" style="border-radius: 50%;margin-top:-4%" width="50px" height="50px" title="头像" alt="头像"/>');
                        }
                        $('#userId').val(r.userinfo.userid);
                        $('#zhanghao').val(r.userinfo.usernumber);
                        $('.usernameinfo').html(r.userinfo.username);
                        $('#jsr').val(r.userRolename.rolename);
                        $('.shijuhuas').removeAttr('style','margin-left:10%');
                        $('.shijuhuas').attr('style','margin-left:20%');
                        jzcd();
                    }else{
                        $('#userPassDl').val('');
                        confirm(r.msg);
                    }
                }
            })
        }
    })
</script>
<style type="text/css">
    .red{
        color: red;
    }
</style>


<%--<h2>注册</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalZcy">
    开始演示注册模态框
</button>--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModalZcy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>--%>
                <h4 class="modal-title" id="myModalLabelZC">
                    注册页(<a href="#">dz223.com</a>)<hr/><span class="red">*</span>为必填项！
                </h4>
            </div>
            <div class="modal-body">

                <form role="form" id="uploadForm" enctype="multipart/form-data">
                    <div class="input-group">
                        <span class="input-group-addon nZC">昵称(非登录账号)</span>
                        <input type="text" class="form-control" placeholder="要不来个非主流昵称？" name="username" id="username">
                        <span class="input-group-addon red">*</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon tZC">头像</span>
                        <input type="file" class="form-control" style="border-radius:20%;" placeholder="头像" name="file" id="file">
                        <span class="input-group-addon xxx red" style="display: none;border-radius:40%;" title="取消上传">X</span>
                        <span class="input-group-addon img" style="border-radius:50%;"></span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon zZC">账号</span>
                        <input type="text" class="form-control" placeholder="账号前缀S不能少哈，账号可要记牢，你要回家的哟" onKeyUp="value=value.replace(/[\W]/g,'S')" value="S" maxlength="16" name="usernumber" id="usernumber">
                        <span class="input-group-addon red">*</span>
                    </div>
                    <div class="input-group mm1">
                        <span class="input-group-addon mZC">密码</span>
                        <input type="password" class="form-control" placeholder="密码口令要记牢，要不少于4位哈" maxlength="18" name="userpassword" maxlength="18" id="userpassword">
                        <span class="input-group-addon red">*</span>
                    </div>
                    <div class="input-group mm2">
                        <span class="input-group-addon qrmZC">确认密码</span>
                        <input type="password" class="form-control" placeholder="考验你记忆力的时候到了" maxlength="18" name="quserpassword" maxlength="18" id="quserpassword">
                        <span class="input-group-addon red">*</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon nlZC">年龄</span>
                        <input type="date" style="border-radius: 20%" class="form-control" placeholder="小可爱的芳龄几何，说不定就相上了呢？" name="age" id="age">
                        <span class="input-group-addon red">*小可爱的芳龄几何，说不定就相上了呢？</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon dhZC" maxlength="20">电话</span>
                        <input type="text" class="form-control" placeholder="便于后期密码找回及礼物联系" maxlength="16"  oninput="value=value.replace(/[^\d]/g,'')" name="phone" id="phone">
                        <span class="input-group-addon red">*</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon yxZC" maxlength="25">邮箱</span>
                        <input type="text" class="form-control" placeholder="真实邮箱可快速订阅以及提高用户体验,格式：baidu@136.com" maxlength="50" name="email" id="email">
                        <span class="input-group-addon red">*</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon xbZC">性别</span>
                        <!--<input type="text" class="form-control" placeholder="性别" name="sex" id="sex">-->
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="nan" value="1" checked> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="nv" value="2"> 女
                        </label>
                        <span class="input-group-addon">保密可不能相亲的哟(慎重哈)</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon dzZC">地址</span>
                        <input type="text" class="form-control" maxlength="100" placeholder="要不要小礼物哟！" name="address" id="address">
                        <!--<span class="input-group-addon red">*</span>-->
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon gxZC">个性签名</span>
                        <input type="text" class="form-control"  maxlength="255" placeholder="突出你的与众不同吧！" name="signature" id="signature">
                        <!--<span class="input-group-addon red">*</span>-->
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default qxzc" data-dismiss="modal">
                    再想想
                </button>
                <input name="zcOrbj" id="zcOrbj" type="hidden"/>
                <button type="button" class="btn btn-primary userZC" onclick="addOrUpdateUserinfo()">
                    注册
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    $(function () { $('#myModalZcy').modal('hide')});
</script>
<script>
    /*$(function () { $('#myModalZcy').on('hide.bs.modal', function () {
        dLmt('myModalZcy');
    })

    });*/

    $('#qxzc').on('click',function () {
        dLmt('myModalZcy');
    })
    $('#email').on('change',function(){
        var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
        var obj = document.getElementById("email"); //要验证的对象
        if(!reg.test(obj.value)){ //正则验证不通过，格式不对
            alert("邮箱验证不通过，正确邮箱如：baidu@136.com");
            $('.yxZC').css('color','red');
            $('#email').val('');
            return;
        }else{
            $('.yxZC').css('color','#33CC00');
            return;
        }
    })
    $('#usernumber').on('change',function(){
        var usernumber=$('#usernumber').val();
        var path=$('#path').val();
        var S=usernumber.substring(0,1);
        if(S!='S'){
            alert('账号格式正确，账号前缀必须以S开头');
            $('#usernumber').val('S'+usernumber);
            $('.zZC').css("color","red");
            return;
        }
        if(usernumber.length>=5){
            if(usernumber!='' && usernumber!=undefined){
                $.ajax({
                    url:path+'user/selectUserNumber',
                    data:{'userNumber':usernumber},
                    dateType:'JSON',
                    type:'POST',
                    success:function(re){
                        if(re.result=='true'){
                            $('.zZC').css("color","red");
                            $('#usernumber').val('S');
                            confirm(' 运气真好，'+usernumber+'-账号已被注册啦！');
                            return;
                        }else $('.zZC').css("color","#000000");
                    }
                })
            }
        }else{
            $('.zZC').css("color","red");
            $('#usernumber').val('S');
            alert('账号位数必须大于等于5！');
            return;
        }
    });
    $('#userpassword').on('change',function () {
        var userpassword=$('#userpassword').val();
        if (userpassword.length>=4){
            return;
        } else{
            $('#userpassword').val('');
            $('.mZC').css('color','red');
            alert('密码不能少于4位！');
            return;
        }
    })
   /* $('#phone').on('change',function(){
        var phone=$('#phone').val();
        var path=$('#path').val();
        if(phone!='' && phone!=undefined){
            $.ajax({
                url:path+'user/selectPhone',
                date:{'phone':phone},
                dateType:'JSON',
                type:'POST',
                success:function(re){
                    if(re.result=='true'){
                        $('.dhZC').css("color","red");
                        $('#phone').val('');
                        confirm(phone+'-该手机已被已绑定其他账号啦！');
                        return;
                    }else $('.dhZC').css("color","#000000");
                }
            })
        }
    });*/
    $('.xxx').on('click',function(){
        $('.img').html('');
        $('#file').val('');
        $('.xxx').hide();
    });
    $('#file').on('change',function(){
        $('.img').html('');

        /**
         * 文件预览
         */
        var url = null;
        var fileObj = document.getElementById("file").files[0];
        if (window.createObjcectURL != undefined) {
            url = window.createOjcectURL(fileObj);
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(fileObj);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(fileObj);

        }
        if(url!=''){
            $('.xxx').show();
            $('.img').html('<img src='+url+' alt="头像" title="头像" width="80px" height="80px" style="border-radius:50%;"/>');}
    })
    function dLmt(val){
        $('#file').val('');
        /*$('.xxx').hide();*/
        $('.img').html('');
        $('#username').val('');/*昵称*/
        $('#usernumber').val('');/*账号*/
        $('#userpassword').val('');/*密码*/
        $('#quserpassword').val('');/*再次密码*/
        $('#signature').val('');/*个性签名*/
        $('#age').val('');/*年龄*/
        $('#phone').val('');/*电话*/
        $('#email').val('');/*邮箱*/
        $('#address').val('');/*地址*/
        /*$("input[name='sex']").val('');*/
        $('#'+val).modal('hide');
        $('.nZC').css("color","#000000");
        $('.zZC').css("color","#000000");
        $('.mZC').css("color","#000000");
        $('.qrmZC').css("color","#000000");
        $('.nlZC').css("color","#000000");
        $('.dhZC').css("color","#000000");
        $('.yxZC').css("color","#000000");
    }
    function setnull(){
        $('#file').val('');
        /*$('.xxx').hide();*/
        $('.img').html('');
        $('#username').val('');/*昵称*/
        $('#usernumber').val('S');/*账号*/
        $('#userpassword').val('');/*密码*/
        $('#quserpassword').val('');/*再次密码*/
        $('#signature').val('');/*个性签名*/
        $('#age').val('');/*年龄*/
        $('#phone').val('');/*电话*/
        $('#email').val('');/*邮箱*/
        $('#address').val('');/*地址*/
    }
    function addOrUpdateUserinfo(){/*1:新增2：更新*/
        var val=$('#zcOrbj').val();
        if (val=='1'){
            var path=$('#path').val();
            var username=$('#username').val();
            var usernumber=$('#usernumber').val();
            var userpassword=$('#userpassword').val();
            var quserpassword=$('#quserpassword').val();
            var signature=$('#signature').val();
            var age=$('#age').val();
            var phone=$('#phone').val();
            var email=$('#email').val();
            var address=$('#address').val();
            var sex=$("input[name='sex']").val();
            var file=$('#file').val();
            var S=usernumber.substring(0,1);
            if(S!='S'){
                alert('账号格式正确，账号前缀必须以S开头');
                $('#usernumber').val('S'+usernumber);
                $('.zZC').css("color","red");
                return;
            }else if(usernumber.length<5){
                $('.zZC').css("color","red");
                return;
            }
            /*alert(file)
            console.info('昵称：'+username+'账号：'+usernumber+'密码'+userpassword+'确认密码'+quserpassword+'个性签名'+signature+age+'电话'+phone+'邮箱'+email+'地址'+address+'性别'+sex+'文件'+file)
            */if(username==""||username==undefined){
                $('.nZC').css("color","red");
                return
            }else $('.nZC').css("color","#000000");
            if(usernumber==""||usernumber==undefined){
                $('.zZC').css("color","red");
                return
            }else $('.zZC').css("color","#000000");
            if(userpassword==""||userpassword==undefined){
                $('.mZC').css("color","red");
                return
            }else $('.mZC').css("color","#000000");
            if(quserpassword==""||quserpassword==undefined){
                $('.qrmZC').css("color","red");
                return
            }else $('.qrmZC').css("color","#000000");
            if(phone==""||phone==undefined){
                $('.dhZC').css("color","red");
                return
            }else $('.dhZC').css("color","#000000");
            if(email==""||email==undefined){
                $('.yxZC').css("color","red");
                return
            }else $('.yxZC').css("color","#000000");
            if(age==""||age==undefined){
                $('.nlZC').css("color","red");
                return
            }else $('.nlZC').css("color","#000000");
            /*判断密码是否一致*/
            if(userpassword!=""||userpassword!=undefined && quserpassword!=""||quserpassword!=undefined){
                if(userpassword==quserpassword){
                    /*密码通过验证*/
                    /*提交*/
                    if(username!=""||username!=undefined && usernumber!=""||usernumber!=undefined && userpassword!=""||userpassword!=undefined
                        && quserpassword!=""||quserpassword!=undefined && phone!=""||phone!=undefined && email!=""||email!=undefined && age!=""||age!=undefined){
                        var formData = new FormData($( "#uploadForm" )[0]);
                        /*data:{'file':file,'username':username,'usernumber':usernumber,'userpassword':userpassword,'signature':signature,'age':age,'phone':phone,'email':email,'address':address,'sex':sex},*/
                        $.ajax({
                            url:path+'user/addUserNumber',
                            type:'POST',
                            data:formData,
                            async: false,
                            cache: false,
                            contentType: false,
                            processData: false,
                            dataType:'JSON',
                            success:function(r){
                                confirm(r.msg);
                                dLmt('myModalZcy');
                            }
                        })
                    }
                }else{
                    /*密码未通过*/
                    $('.mZC').css("color","red");
                    $('.qrmZC').css("color","red");
                    confirm('两次密码输入不一致哟！')
                }
            }
        } else if (val=='2'){//更新账号

            var path=$('#path').val();
            var username=$('#username').val();
            var usernumber=$('#usernumber').val();
            var userpassword=$('#userpassword').val();
            var quserpassword=$('#quserpassword').val();
            var age=$('#age').val();
            var phone=$('#phone').val();
            var email=$('#email').val();
            var sex=$("input[name='sex']").val();
            /*if(sex==""||sex==undefined){
                $('.xbZC').css("color","red");
                return
            }else $('.xbZC').css("color","#000000");*/
            if(username==""||username==undefined){
                $('.nZC').css("color","red");
                return
            }else $('.nZC').css("color","#000000");
            if(usernumber==""||usernumber==undefined){
                $('.zZC').css("color","red");
                return
            }else $('.zZC').css("color","#000000");
            if(phone==""||phone==undefined){
                $('.dhZC').css("color","red");
                return
            }else $('.dhZC').css("color","#000000");
            if(email==""||email==undefined){
                $('.yxZC').css("color","red");
                return
            }else $('.yxZC').css("color","#000000");
            if(age==""||age==undefined){
                $('.nlZC').css("color","red");
                return
            }else $('.nlZC').css("color","#000000");
                /*提交*/
                if(username!=""||username!=undefined && usernumber!=""||usernumber!=undefined && userpassword!=""||userpassword!=undefined
                    && quserpassword!=""||quserpassword!=undefined && phone!=""||phone!=undefined && email!=""||email!=undefined && age!=""||age!=undefined){
                    var formData = new FormData($( "#uploadForm" )[0]);
                    /*data:{'file':file,'username':username,'usernumber':usernumber,'userpassword':userpassword,'signature':signature,'age':age,'phone':phone,'email':email,'address':address,'sex':sex},*/
                    $.ajax({
                        url:path+'user/addUserNumber',
                        type:'POST',
                        data:formData,
                        async: false,
                        cache: false,
                        contentType: false,
                        processData: false,
                        dataType:'JSON',
                        success:function(r){
                            confirm(r.msg);
                            dLmt('myModalZcy');
                        }
                    })
                }
        }
    }
    function UpdateUserinfo(val){
        setnull();
        $('#zcOrbj').val(val);
        if (val=='1'){
            $("#myModalLabelZC").html('注册页(<a href="#">dz223.com</a>)<hr/><span class="red">*</span>为必填项！');
            $(".userZC").html('注册');
            $('.mm1').show();
            $('.mm2').show();
            $('#usernumber').removeAttr("disabled");
            $('#usernumber').removeAttr("readonly");
            $("#myModalZcy").modal('show');
        }else if(val=='2'){
            var zhangHao=$('#zhanghao').val();
            var userId=$('#userId').val();
            var path=$('#path').val();
            $.ajax({
                url:path+'user/selectUserNumber',
                data:{'userNumber':zhangHao,'userId':userId},
                dataType:'JSON',
                type:'POST',
                success:function (re) {
                    if (re.result=='true'){
                        /*console.info(re.User)*/
                        $('.mm1').hide();
                        $('.mm2').hide();
                        $("#username").val(re.User.username);
                        $("#usernumber").val(re.User.usernumber);
                        $("#userpassword").val(re.User.userpassword);
                        $("#phone").val(re.User.phone);
                        $("#email").val(re.User.email);
                        $("#age").val(re.User.age);
                        /*alert(re.User.sex)*/
                        if(re.User.portrait!="默认头像")
                        $('.img').html('<img src=${pageContext.request.contextPath}'+(re.User.portrait)+' alt="头像" title="头像" width="80px" height="80px" style="border-radius:50%;"/>');
                        $('input[name="sex"][value="'+re.User.sex+'"]').attr("checked",true);
                        /*$("#sex").val(re.User.sex);*/
                        $("#address").val(re.User.address);
                        $("#signature").val(re.User.signature);
                        /*$("#file").val(re.User.portrait);*/
                        $("#myModalLabelZC").html('基本信息编辑页(<a href="#">dz223.com</a>)<hr/><span class="red">*</span>为必填项！');
                        $(".userZC").html('更新')
                        $('#usernumber').attr("disabled","disabled");
                        $('#usernumber').attr("readonly","readonly");
                        $("#myModalZcy").modal('show');
                    } else{
                        alert('操作异常，请针对已登录账号进行更新！');
                        return;
                    }
                }
            })
        }else alert('内部问题请联系管理员！');

    }

    /*$('.userZC').on('click',function(){


    })*/
</script>

<%--<h2>更新密码</h2>

<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#updatepassmyModal">
    开始演示更新密码模态框
</button>--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="updatepassmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>--%>
                <h4 class="modal-title" id="myModalLabel">
                    更新密码(<a href="#">dz223.com</a>)
                </h4>
            </div>
            <div class="modal-body">
                <div class="input-group">
                    <span class="input-group-addon zZCup">账号</span>
                    <input type="text" class="form-control" placeholder="账号可要记牢，你要回家的哟" maxlength="15" name="upateUsernumber" id="upateUsernumber" readonly="readonly">
                    <span class="input-group-addon red">*</span>
                </div>
                <div class="input-group">
                    <span class="input-group-addon mZCup">密码</span>
                    <input type="password" class="form-control" placeholder="原密码" name="upateUserpassword" maxlength="18" id="upateUserpassword">
                    <span class="input-group-addon red">*</span>
                </div>
                <div class="input-group">
                    <span class="input-group-addon xmZCup">新密码</span>
                    <input type="password" class="form-control" placeholder="新密码,要不少于4位哈" name="newPassword" maxlength="18" id="newPassword" onchange="verificationNewPass('1')">
                    <span class="input-group-addon red">*</span>
                </div>
                <div class="input-group">
                    <span class="input-group-addon qrmZCup">确认密码</span>
                    <input type="password" class="form-control" placeholder="再次输入新密码" name="quserNewPassword" maxlength="18" id="quserNewPassword" onchange="verificationNewPass('2')">
                    <span class="input-group-addon red">*</span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default xgmm" data-dismiss="modal">
                    取消
                </button>
                <button type="button" class="btn btn-primary updatePasstj">
                    修改密码
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    $(function () { $('#updatepassmyModal').modal('hide');
        $('.shijuhuas').attr('style','margin-left:10%');});
</script>
<script>
    function verificationNewPass(val){
        var newPassword=$('#newPassword').val();
        var quserNewPassword=$('#quserNewPassword').val();
        if(newPassword.length<4){
            $('#newPassword').val('');
            $('.xmZCup').css("color","red");
            return;
        }
        if(newPassword==''&&newPassword==undefined){
            return;
        }
        if(quserNewPassword==''&&quserNewPassword==undefined){
            return;
        }
        if(newPassword==quserNewPassword){
            $('.xmZCup').css("color","#33CC00");
            $('.qrmZCup').css("color","#33CC00");
        }else{
            if(val=='1')$('.qrmZCup').css("color","red");
            else {$('.xmZCup').css("color","red");$('.qrmZCup').css("color","red");}
        }
    }
    $('.updatePasstj').on('click',function(){
        var path=$('#path').val();
        var usernumber=$('#upateUsernumber').val();
        var pass=$('#upateUserpassword').val();
        var newPassword=$('#newPassword').val();
        var quserNewPassword=$('#quserNewPassword').val();
        if(pass==""||pass==undefined){
            $('.mZCup').css("color","red");
            return
        }
        if(newPassword==""||newPassword==undefined){
            $('.xmZCup').css("color","red");
            return
        }else $('.xmZCup').css("color","#000000");
        if(quserNewPassword==""||quserNewPassword==undefined){
            $('.qrmZCup').css("color","red");
            return
        }else $('.qrmZCup').css("color","#000000");

        if(newPassword==quserNewPassword){
            $.ajax({
                url:path+'user/updateByUserNumber',
                data:{'usernumber':usernumber,'pass':pass,'newpass':newPassword},
                dataType:'JSON',
                type:'POST',
                success:function(re){
                    if(re.result=='true'){
                        confirm(re.msg);
                        $('#updatepassmyModal').modal('hide');
                    }else confirm(re.msg);
                }
            })
        }else{
            confirm('两次密码不匹配！');
            return;
        }
    })
    $('#upateUserpassword').on('change',function(){
        var path=$('#path').val();
        var usernumber=$('#upateUsernumber').val();
        var pass=$('#upateUserpassword').val();
        if(pass!='' && pass!=undefined){
            $.ajax({
                url:path+'user/findPassword',
                data:{'usernumber':usernumber,'pass':pass},
                dateType:'JSON',
                type:'POST',
                success:function(re){
                    if(re.result=='false'){
                        $('.mZCup').css("color","red");
                        $('#upateUserpassword').val('');
                        confirm('-原密码不匹配，请重新输入！');
                        return;
                    }else $('.mZCup').css("color","#33CC00");
                }
            })
        }else $('.mZCup').css("color","#000000");

    })
    /*$(function () { $('#updatepassmyModal').on('hide.bs.modal', function () {
        $('.mZCup').css("color","#000000");
        $('.xmZCup').css("color","#000000");
        $('.qrmZCup').css("color","#000000");
        $('#upateUserpassword').val('');
        $('#newPassword').val('');
        $('#quserNewPassword').val('');
    })
    });*/
    $('#xgmm').on('click',function () {
        $('.mZCup').css("color","#000000");
        $('.xmZCup').css("color","#000000");
        $('.qrmZCup').css("color","#000000");
        $('#upateUserpassword').val('');
        $('#newPassword').val('');
        $('#quserNewPassword').val('');
    })
    /*退出登录*/
    function outlogin(){
        var userId=$('#userId').val();
        $('#userId').val('-1');
        $('#zhanghao').val('-1');
        $('#jsr').val('-1');
        jzcd();
        var path=$('#path').val();
        $.ajax({
            url:path+'logout',
            data:{'userId':userId},
            dataType:'JSON',
            type:'POST',
            success:function(re){
                userId='';
                dLmt('myModalZcy');
                window.location.href=path+"";
                confirm('出去浪了，记得常回家看看！');
            }
        })
    }
</script>