<%@include file="commonality/commonalitytop.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<div style="width: 70%;margin-left: 15%;background-color: azure;" class="w" >


    <ul id="myTab" class="nav nav-tabs">
        <c:forEach var="m" items="${map.menulist}">
            <c:if test="${m.permissionname=='十句话'}">
                <li class="active shijuhuas">
                    <a href="#${m.permissionid}" data-toggle="tab" onclick="tenwordtype('${m.permissionname}')">
                            ${m.permissionname}
                    </a>
                </li>
            </c:if>
            <c:if test="${m.permissionname !='十句话'}">
                <li>
                    <a href="#${m.permissionid}" data-toggle="tab" onclick="tenwordtype('${m.permissionname}')">
                        ${m.permissionname}
                    </a>
                </li>
            </c:if>
        </c:forEach>
    </ul>
    <script type="text/javascript">
        $(function () {
            $('#myModaljubao').modal('hide');
            $('#myModalpinglun').modal('hide');
        })
        function context(val) {
            var path=$('#path').val();
            var myTabContent=$('#myTabContent');
            $.ajax({
                url:path+'homelist',
                data:{'hometype':val,'page':0,'pageitem':10},
                dataType:'JSON',
                type:'POST',
                success:function (re) {
                    myTabContent.html('');
                    if (val==2){//加载图片
                        $.each(re,function (ide,homelist) {
                            myTabContent.append('<div style="border: 1.5px solid #e263ff;border-radius: 5%;text-align: center;">'+
                                '<div style="width: 50%;padding-left: 5%;padding-right: 5%;border: 1.2px dashed #e263ff;border-radius: 10%;text-align: center;margin-left:25%">'+
                                '<p style="margin-top:4%;font-family: 楷体;font-size:1.9rem;"><img src="${pageContext.request.contextPath}'+homelist.homecontent+'" style=""/><br/>作者:'+homelist.username+'</p>'+
                                '</div?'+
                                '<div style="border: 1px solid silver;height: 0px; width: 100%"></div>'+
                                '<p>'+
                                '<span class="'+homelist.homeid+''+1+'"style="margin-left: 3%"><a href="#" onclick="tenworddianzanpinglun('+homelist.homeid+','+1+')"><img src="${ctx}/static/img/dianzan.png" title="点赞" alt="点赞" style="width:4%;height:4%;border-radius: 50%"/></a><span>'+homelist.homelike+'</span></span>'+
                                '<span class="'+homelist.homeid+''+2+'"style="margin-left: 3%">&nbsp;&nbsp;<a href="#" onclick="tenworddianzanpinglun('+homelist.homeid+','+2+')"><img src="${ctx}/static/img/pinglun.png" title="评论" alt="评论" style="width:4%;height:4%;border-radius: 50%"/></a><span>'+homelist.homecomment+'</span></span>'+
                                '<span class="'+homelist.homeid+''+5+'"style="margin-left: 3%">&nbsp;&nbsp;<a onclick="tenworddianzanpinglun('+homelist.homeid+','+5+')"><img src="${ctx}/static/img/shoucang.png" title="收藏" alt="收藏" style="width:4%;height:4%;border-radius: 50%"/></a>&nbsp;&nbsp;</span>'+
                                '<span class="'+homelist.homeid+''+3+'"style="margin-left: 3%">&nbsp;&nbsp;<a href="#" onclick="tenworddianzanpinglun('+homelist.homeid+','+3+')"><img src="${ctx}/static/img/fenxiang.png" title="分享" alt="分享" style="width:4%;height:4%;border-radius: 50%"/></a>&nbsp;&nbsp;</span>'+
                                '<span class="'+homelist.homeid+''+4+'"><span style="color: #676767; margin-left: 10%;border-radius: 40%"><a href="#" onclick="tenworddianzanpinglun('+homelist.homeid+','+4+')">举报</a></span></span>'+
                                '</p>'+
                                '</div>');
                        })
                    }else if(val==1||val==3){
                        $.each(re,function (ide,homelist) {
                            myTabContent.append('<div style="border: 1.5px solid #e263ff;border-radius: 5%;text-align: center">'+
                                '<div style="width: 50%;padding-left: 5%;padding-right: 5%;border: 1.2px dashed #e263ff;border-radius: 10%;text-align: center;margin-left:25%">'+
                                '<p style="margin-top:4%;font-family: 楷体;font-size:1.9rem;">'+homelist.homecontent+'<br/>作者:'+homelist.username+'</p>'+
                                '</div?'+
                                '<div style="border: 1.4px solid silver;height: 0px; width: 100%"></div>'+
                                '<p>'+
                                '<span class="'+homelist.homeid+''+1+'"style="margin-left: 3%"><a onclick="tenworddianzanpinglun('+homelist.homeid+','+1+')"><img src="${ctx}/static/img/dianzan.png" title="点赞" alt="点赞"  style="width:4%;height:4%;border-radius: 50%"/></a><span>'+homelist.homelike+'</span></span>'+
                                '<span class="'+homelist.homeid+''+2+'"style="margin-left: 3%">&nbsp;&nbsp;<a onclick="tenworddianzanpinglun('+homelist.homeid+','+2+')"><img src="${ctx}/static/img/pinglun.png" title="评论" alt="评论" style="width:4%;height:4%;border-radius: 50%"/></a><span>'+homelist.homecomment+'</span></span>'+
                                '<span class="'+homelist.homeid+''+5+'"style="margin-left: 3%">&nbsp;&nbsp;<a onclick="tenworddianzanpinglun('+homelist.homeid+','+5+')"><img src="${ctx}/static/img/shoucang.png" title="收藏" alt="收藏" style="width:4%;height:4%;border-radius: 50%"/></a>&nbsp;&nbsp;</span>'+
                                '<span class="'+homelist.homeid+''+3+'"style="margin-left: 3%">&nbsp;&nbsp;<a onclick="tenworddianzanpinglun('+homelist.homeid+','+3+')"><img src="${ctx}/static/img/fenxiang.png" title="分享" alt="分享" style="width:4%;height:4%;border-radius: 50%"/></a>&nbsp;&nbsp;</span>'+
                                '<span class="'+homelist.homeid+''+4+'"><span style="color: #676767; margin-left: 10%;border-radius: 40%"><a onclick="tenworddianzanpinglun('+homelist.homeid+','+4+')">举报</a></span></span>'+
                                '</p>'+
                                '</div>');
                        })
                    }
                    console.info(re)
                }
            })
        }
        function tenwordtype(val) {
            var myTabContent=$('#myTabContent');
            var userId=$('#userId').val();
            if (val=='十句话'){//1
                binajishijian();
                $('.zhuneirong').show();
                /*alert('你点击了'+val+',正在为你跳转！')*/
                context(1);
            } else if (val=='十副图') {//2
                binajishijian();
                $('.zhuneirong').show();
                /*alert('你点击了'+val+',正在为你跳转！')*/
                context(2);
            }else if (val=='十糗事') {//3
                binajishijian();
                $('.zhuneirong').show();
                alert('你点击了'+val+',正在为你跳转！')
                context(3);
            }else if (val=='趣事百科') {//4
                binajishijian();
                $('.zhuneirong').show();
                alert('你点击了'+val+',正在为你跳转！')
                context(4);
            }else if (val=='新闻网') {//5
                binajishijian();
                $('.zhuneirong').show();
                alert('你点击了'+val+',正在为你跳转！')
                context(5);
            }else if (val=='广告赞助') {//6
                binajishijian();
                $('.zhuneirong').show();
                alert('你点击了'+val+',暂未开放！')
                myTabContent.html('');
                myTabContent.html('<p style="color: red;">抱歉，此功能暂未开放！</p>');
                /*context(6);*/
            }else if (val=='短视频') {//7
                binajishijian();
                $('.zhuneirong').show();
                if (userId!='-1'){
                    context(7);
                }else{
                    alert('你点击了'+val+',__只针对登录用户开放！')
                }

            }else if (val=='福利地址') {//8
                binajishijian();
                $('.zhuneirong').show();
                if (userId!='-1'){
                    context(8);
                }else{
                    alert('你点击了'+val+'__只针对登录用户开放！')
                }
            }

        }
        function tenworddianzanpinglun(val,type) {
            var path=$('#path').val();
            var t=$('.'+val+type).find('span').html();
            var uid=$('#userid').val()==undefined?'':$('#userid').val();
            var tp=type;
            var homeid=val;
            var context=$('#context').val()==undefined?null:$('#context').val();
            if (type=='1'){/*点赞*/
                $.ajax({
                    url:path+'ct/likeOrComment',
                    data:{'userid':uid,'type':tp,'homeid':homeid,'context':context},
                    dataType:'JSON',
                    type:'POST',
                    success:function (result) {
                        console.info(result);
                        if (result.result=='true'){
                            $('.'+val+type).find('span').html((parseInt(t)+1));
                        }else if (result.result=='t'){
                            $('.'+val+type).find('span').html((parseInt(t)+1));
                            $('.'+val+type).find('span').html((parseInt(t)-1));
                        } else{
                            alert('网络状态不佳，请稍后再试！');
                        }
                    }
                })
                /*alert("你点赞了该文章"+t);*/
            } else if (type=='2'){/*评论*/
                $('.'+val+type).find('span').html((parseInt(t)+1));
                /*alert("你评论了该文章"+t);*/
            } else if (type=='3'){/*分享*/
                alert("该功能维护中，请手动复制分享！");
            }else if (type=='4'){/*举报*/
                $('#myModaljubao').modal('show');
                if ($('#hid').val()=='-1'){
                    $('#hid').val(val);
                }
                if (context!=''&&context!=undefined&&context!='-1'){
                    var hid=$('#hid').val();
                    $.ajax({
                        url:path+'ct/likeOrComment',
                        data:{'userid':uid,'type':tp,'homeid':hid,'context':context},
                        dataType:'JSON',
                        type:'POST',
                        success:function (result) {
                            if (result.result=='true'){
                                $('#myModaljubao').modal('hide');
                                $('#context').val('');
                                alert(result.msg);
                            }else{
                                alert(result.msg);
                            }
                        }
                    })
                }

            }else if (type=='5'){//收藏
                alert('该功能正在紧张维护中...')
            }
        }
        $(function () {
            $('#myModaljubao').on('hide.bs.modal',
                function() {
                    $('#hid').val('-1');
                })
            $('#myModalpinglun').on('hide.bs.modal',
                function() {
                })
        })
    </script>

    <!-- 评论模态框（Modal） -->
    <div class="modal fade" id="myModalpinglun" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelpinglun" style="color: red;">举报</h4>
                </div>
                <div class="modal-body">
                    1111
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="tenworddianzanpinglun('-1','2')">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 举报模态框（Modal） -->
    <div class="modal fade" id="myModaljubao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabeljubao" style="color: red;">举报</h4>
                </div>
                <div class="modal-body">
                    <input id="hid" value="-1" type="hidden"/>
                    <textarea id="context" rows="5" maxlength="50" placeholder="举报描述（必填）..." style="resize: none;">
                    </textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="tenworddianzanpinglun('-1','4')">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <div id="myTabContent" class="tab-content zhuneirong">
            <c:forEach items="${map.homeList}" var="h">
                <div style="border: 1.5px solid #e263ff;border-radius: 5%;text-align: center;">
                    <div style="width: 50%;padding-left: 5%;border: 1.2px dashed #e263ff;padding-right: 5%;border-radius: 10%;text-align: center;margin-left:25%">
                        <p style="margin-top:4%;font-family: 楷体;font-size:1.9rem;">${h.homecontent}</p>
                    </div>
                    <div style="border: 0px solid silver;height: 0px; width: 100%"></div>
                    <p>  <%--style="border: 1px solid #5998ff;border-radius: 20%"--%>
                        <span class="${h.homeid}1"style="margin-left: 3%"><a onclick="tenworddianzanpinglun('${h.homeid}','1')"><img src="${ctx}/static/img/dianzan.png" title="点赞" alt="点赞"  style="width:4%;height:4%;border-radius: 50%"/></a><span>${h.homelike}</span></span>
                        <span class="${h.homeid}2"style="margin-left: 3%">&nbsp;&nbsp;<a onclick="tenworddianzanpinglun('${h.homeid}','2')"><img src="${ctx}/static/img/pinglun.png" title="评论" alt="评论" style="width:4%;height:4%;border-radius: 50%"/></a><span>${h.homecomment}</span></span>
                        <span class="${h.homeid}5"style="margin-left: 3%">&nbsp;&nbsp;<a onclick="tenworddianzanpinglun('${h.homeid}','5')"><img src="${ctx}/static/img/shoucang.png" title="收藏" alt="收藏" style="width:4%;height:4%;border-radius: 50%"/></a>&nbsp;&nbsp;</span>
                        <span class="${h.homeid}3"style="margin-left: 3%">&nbsp;&nbsp;<a onclick="tenworddianzanpinglun('${h.homeid}','3')"><img src="${ctx}/static/img/fenxiang.png" title="分享" alt="分享" style="width:4%;height:4%;border-radius: 50%"/></a>&nbsp;&nbsp;</span>
                        <span class="${h.homeid}4"><span style="color: #676767; margin-left: 10%;border-radius: 30%"><a onclick="tenworddianzanpinglun('${h.homeid}','4')">举报</a></span></span>
                    </p>
                </div>
            </c:forEach>
        <%--<img src="${pageContext.request.contextPath}/static/img/jubao.png" style="width:4%;height:4%"/>--%>
    </div>
    <div id="myTabContent1" class="tab-content neirongbianji" hidden="hidden">
        <%@include file="addUpdateHome.jsp"%>
    </div>

</div>
<script>
    $(function () {/*alert("加载成功")*/})
</script>





<%@include file="commonality/commonalityend.jsp"%>