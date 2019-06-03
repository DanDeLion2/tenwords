<%--<%@include file="commonality/commonalitytop.jsp"%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input id="hometypeid" name="hometypeid" class="hometypeid" type="hidden" value="-1">
<ul id="myTab1" class="nav nav-tabs">
    <li class="active fabuneirongliebiaoye">
        <a href="#homelistliebiao" data-toggle="tab">
            发布内容列表
        </a>
    </li>
    <li><a href="#xinzengfabuneirong" data-toggle="tab">新增发布内容</a></li>
</ul>
<script type="text/javascript">

</script>
<div id="myTabContent1" class="tab-content">
    <div class="tab-pane fade in active" id="homelistliebiao">
        <input type="hidden" class="dangqianyeshu" value="1"/>
        <%--列表--%>
            <table class="table table-hover" style="width: 80%">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>类型</th>
                    <th>账号</th>
                    <th>标题</th>
                    <th style="width: 10%">内容</th>
                    <th>点赞数</th>
                    <th>评论数</th>
                    <th>状态</th>
                    <th>创建日期</th>
                    <th>更新日期</th>
                </tr>
                </thead>
                <tbody class="trboby">
                <tr>
                    <td>1</td>
                    <td>十副图</td>
                    <td>Sroot</td>
                    <td>无</td>
                    <td>.....</td>
                    <td>1526</td>
                    <td>5454</td>
                    <td>发布</td>
                    <td>2019-05-14 18:20:03</td>
                    <td>2019-05-14 18:20:13</td>
                </tr>
                </tbody>
            </table>
            <%--<button class="dianjifenye" >test分页</button>--%>
            <ul class="pagination neirongfenye">
                <li class="fenye"><a href="#" class="you" onclick="fenye('you')">&laquo;</a></li>
                <li class="active fenye"><a href="#" class="1" onclick="fenye('1')">1</a></li>
                <li class="fenye"><a href="#" class="2" onclick="fenye('2')">2</a></li>
                <li class="fenye"><a href="#" class="3" onclick="fenye('3')">3</a></li>
                <li class="fenye"><a href="#" class="4" onclick="fenye('4')">4</a></li>
                <li class="fenye"><a href="#" class="5" onclick="fenye('5')">5</a></li>
                <li class="fenye"><a href="#" class="zuo" onclick="fenye('zuo')">&raquo;</a></li>
            </ul>
            <script type="text/javascript">
                $('.dianjifenye').on('click',function(){
                    $('.neirongfenye').html('');
                    var li='<li class="fenye"><a href="#" class="you" onclick="fenye(\'you\')">&laquo;</a></li>';
                    for(i=1;i<=10;i++){
                        if(i==1){
                            li+='<li class="active fenye"><a href="#" class="'+i+'" onclick="fenye('+i+')">'+i+'</a></li>';
                        }else{
                            li+='<li class="fenye"><a href="#" class="'+i+'" onclick="fenye('+i+')">'+i+'</a></li>';
                        }
                    }
                    li+='<li class="fenye"><a href="#" class="zuo" onclick="fenye(\'zuo\')">&raquo;</a></li>';
                    $('.neirongfenye').html(li);
                })
                function fenye(val){
                    $('.fenye').removeAttr('class','active');
                    $('.'+val).parent('li').attr('class','active fenye');
                   /* alert(val);*/
                }
            </script>
    </div>
    <div class="tab-pane fade" id="xinzengfabuneirong">
        <%--新增--%>
        <div style="">
            <form method="post" enctype="multipart/form-data" id="uploadHome">
                <p>内容编辑区(<a href="#">dz223.com</a>)</p><hr/>
                <div class="input-group">
                    <span class="input-group-addon">标题</span>
                    <input type="text" class="form-control" placeholder="标题" name="hometitle" id="hometitle" class="hometitle">
                    <span class="input-group-addon">*</span>
                </div>
                <div class="form-group">
                    <label>类型</label>
                    <select class="form-control" name="hometype" id="hometype" style="border-radius: 20%" name="" class="">
                        <option value="十句话">十句话</option>
                        <option value="十糗事">十糗事</option>
                        <option value="十副图">十副图</option>
                        <option value="趣事百科">趣事百科</option>
                        <option value="短视频">短视频</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>内容</label>
                    <textarea class="form-control" name="homecontent" id="homecontent" class="homecontent" rows="6" placeholder="主内容"style="resize: none;border-radius: 10%;font-family: 楷体"></textarea>
                </div>
                <div class="input-group">
                    <span class="input-group-addon tZC">资源</span>
                    <input type="file" class="form-control" style="border-radius:20%;" placeholder="头像" name="file1" id="file1">
                    <span class="input-group-addon xxxx red" style="display: none;border-radius:40%;" title="取消上传">X</span>
                    <%--<span class="input-group-addon imgOrvedio" style="border-radius:50%;"></span>--%>
                </div>
                <div class="input-group">
                    <span class="input-group-addon imgOrvedio" style="border-radius:50%;"></span>
                </div>
                <div class="form-group">
                    <label>状态</label>
                    <select class="form-control" style="border-radius: 20%" name="status" id="status" class="status">
                        <option>发布</option>
                        <option>下架</option>
                    </select>
                </div>
                <button type="button" class="btn btn-default" style="border-radius: 50%;float: right;">提交</button>
            </form>
        </div>
        <script type="text/javascript">
            $(function () {
                $('.imgOrvedio').html('');
                $('#file1').val('');
                $('.xxxx').hide();
                $('#hometitle').val('');
                $('#hometype').val('趣事百科');
                $('#homecontent').val('');
                $('#status').val('下架');

            })
            $('.xxxx').on('click',function(){
                binajishijian();
            });
            function binajishijian(){
                $('.imgOrvedio').html('');
                $('#file1').val('');
                $('.xxxx').hide();
            }
            function imgOrMp4(){
                $('.imgOrvedio').html('');
                /**
                 * 文件预览
                 */
                var url = null;
                var fileObj = document.getElementById("file1").files[0];
                if (window.createObjcectURL != undefined) {
                    url = window.createOjcectURL(fileObj);
                } else if (window.URL != undefined) {
                    url = window.URL.createObjectURL(fileObj);
                } else if (window.webkitURL != undefined) {
                    url = window.webkitURL.createObjectURL(fileObj);

                }
                if(url!=''){
                    $('.xxxx').show();
                    var hometype=$('#hometype').val();
                    alert(hometype)
                    if(hometype=="短视频"){
                        $('.imgOrvedio').html('<video src='+url+' alt="资源" title="资源" width="50%" height="auto" style="border-radius:30%;" autoplay="autoplay" controls preload/>');
                    }else{
                        $('.imgOrvedio').html('<img src='+url+' alt="头像" title="头像" width="50%" height="auto" style="border-radius:30%;"/>');
                    }
                }
            }
            $('#file1').on('change',function(){
                imgOrMp4();
            })
            $('#hometype').on('change',function(){
                var hometype=$('#hometype').val();
                imgOrMp4();
                if(hometype=='十句话'){
                    alert('11')
                }else if(hometype=='十副图'){

                }else if(hometype=='十糗事'){

                }else if(hometype=='趣事百科'){

                }else if(hometype=='新闻网'){

                }else if(hometype=='广告赞助'){

                }else if(hometype=='短视频'){

                }else if(hometype=='福利地址'){

                }else{
                    alert('内部错误，请联系管理员！');
                    return;
                }
            })
            function addUpdateHome() {
                var path=$('#path').val();
                var hometypeid=$('#hometypeid').val()//-1初始化  1新增   2更新
                var formDate=new FormData($('uploadHome')[0]);
                var filehome=$('#filehome').val();


            }
        </script>
    </div>
</div>
<%--
<%@include file="commonality/commonalityend.jsp"%>--%>
