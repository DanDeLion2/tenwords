<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/4/11
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>登录</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
    </script>
</head>

<body>
    <input name="usernumber" id="usernumber" placeholder="用户名"/><br/>
    <input type="password" name="userpassword" id="userpassword" placeholder="密码"/><br/>
    <button id="denglu">登录</button>
    <script type="text/javascript">
        $(function () {
           $("#denglu").click(function(){
               $.ajax({
                   url:$("#path").val()+"login",
                   data:{usernumber:$('#usernumber').val(),password:$('#userpassword').val()},
                   type:'POST',
                   dataType:'json',
                   success:function(result){
                       console.info(result);
                       if(result.msg=='登录成功！'){
                           alert("你好 "+result.userinfo.username);
                       }else{
                           alert(result.msg);
                       }
                   }
               });
           });
        });
    </script>
    <input value="${msg}">
<input id="path" name="path" class="path" value="${pageContext.request.contextPath}/" type="hidden"/>
</body>
</html>