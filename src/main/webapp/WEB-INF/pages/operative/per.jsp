<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.DirectorBean" %>
<%@ page import="com.fk.bean.PerformerBean" %>
<%@ page import="com.fk.bean.TypeBean" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 23/03/17
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ocss/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ocss/admin.css">
    <script src="${pageContext.request.contextPath}/ojs/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/ojs/pintuer.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/uedite/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/uedite/ueditor.all.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/uedite/zh-cn.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="${pageContext.request.contextPath}/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green" href="${pageContext.request.contextPath}" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="${pageContext.request.contextPath}/operative/login"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>基本修改</h2>
    <ul style="display:block">
        <li><a href="${pageContext.request.contextPath}/operative" ><span class="icon-caret-right"></span>网站用户</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/pass" ><span class="icon-caret-right"></span>演员/助演管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/page" ><span class="icon-caret-right"></span>资讯添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/adv" ><span class="icon-caret-right"></span>首页轮播</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/book" ><span class="icon-caret-right"></span>演出添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/column" ><span class="icon-caret-right"></span>演出管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>高级修改</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/operative/der" ><span class="icon-caret-right"></span>演员添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/per" ><span class="icon-caret-right"></span>助演添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/type" ><span class="icon-caret-right"></span>分类管理</a></li>

        <li><a href="${pageContext.request.contextPath}/operative/site" ><span class="icon-caret-right"></span>影院管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/addsite" ><span class="icon-caret-right"></span>影院添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/buy" ><span class="icon-caret-right"></span>订单管理</a></li>
    </ul>
</div>
<script type="text/javascript">
    $(function () {
        $(".leftnav h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a  class="icon-home"> 首页</a></li>
    <li><a id="a_leader_txt">网站信息</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</span></li>
</ul>
<div class="admin">
    <div class="panel admin-panel">
        <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 单页信息</strong></div>
        <div class="body-content">
            <form method="post" class="form-x" action="${pageContext.request.contextPath}/operative/addper"
                  enctype="multipart/form-data">
                <div class="form-group">
                    <div class="label">
                        <label>中文名字：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="name" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>英文名字：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="ename" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>别名：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="othername" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>生日：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="birth" value="yyyy-MM-dd"/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>身高：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="height" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>票房：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="boxoffice" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>粉丝：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="fan" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>出生地：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="birthplace" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>国籍：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="nationality" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>性别：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="sex" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>星座：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="constellation" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>简介：</label>
                    </div>
                    <div class="field">
                        <%--<input type="text" class="input" name="score" value=""/>--%>
                        <textarea name="introduce"></textarea>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>照片：</label>
                    </div>
                    <div class="field">
                        <input name="image" type="file" accept="image/gif, image/jpeg"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>图集下方上传：</label>
                    </div>
                    <div class="field">
                        <script id="editor" type="text/plain" style="width:1024px;height:500px;" name="content"></script>
                        <script type="text/javascript">
                            //实例化编辑器
                            //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                            var ue = UE.getEditor('editor');


                            function isFocus(e){
                                alert(UE.getEditor('editor').isFocus());
                                UE.dom.domUtils.preventDefault(e)
                            }
                            function setblur(e){
                                UE.getEditor('editor').blur();
                                UE.dom.domUtils.preventDefault(e)
                            }
                            function insertHtml() {
                                var value = prompt('插入html代码', '');
                                UE.getEditor('editor').execCommand('insertHtml', value)
                            }
                            function createEditor() {
                                enableBtn();
                                UE.getEditor('editor');
                            }
                            function getAllHtml() {
                                alert(UE.getEditor('editor').getAllHtml())
                            }
                            function getContent() {
                                var arr = [];
                                arr.push("使用editor.getContent()方法可以获得编辑器的内容");
                                arr.push("内容为：");
                                arr.push(UE.getEditor('editor').getContent());
                                alert(arr.join("\n"));
                            }
                            function getPlainTxt() {
                                var arr = [];
                                arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
                                arr.push("内容为：");
                                arr.push(UE.getEditor('editor').getPlainTxt());
                                alert(arr.join('\n'))
                            }
                            function setContent(isAppendTo) {
                                var arr = [];
                                arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
                                UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
                                alert(arr.join("\n"));
                            }
                            function setDisabled() {
                                UE.getEditor('editor').setDisabled('fullscreen');
                                disableBtn("enable");
                            }

                            function setEnabled() {
                                UE.getEditor('editor').setEnabled();
                                enableBtn();
                            }

                            function getText() {
                                //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
                                var range = UE.getEditor('editor').selection.getRange();
                                range.select();
                                var txt = UE.getEditor('editor').selection.getText();
                                alert(txt)
                            }

                            function getContentTxt() {
                                var arr = [];
                                arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
                                arr.push("编辑器的纯文本内容为：");
                                arr.push(UE.getEditor('editor').getContentTxt());
                                alert(arr.join("\n"));
                            }
                            function hasContent() {
                                var arr = [];
                                arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
                                arr.push("判断结果为：");
                                arr.push(UE.getEditor('editor').hasContents());
                                alert(arr.join("\n"));
                            }
                            function setFocus() {
                                UE.getEditor('editor').focus();
                            }
                            function deleteEditor() {
                                disableBtn();
                                UE.getEditor('editor').destroy();
                            }
                            function disableBtn(str) {
                                var div = document.getElementById('btns');
                                var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
                                for (var i = 0, btn; btn = btns[i++];) {
                                    if (btn.id == str) {
                                        UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                                    } else {
                                        btn.setAttribute("disabled", "true");
                                    }
                                }
                            }
                            function enableBtn() {
                                var div = document.getElementById('btns');
                                var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
                                for (var i = 0, btn; btn = btns[i++];) {
                                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                                }
                            }

                            function getLocalData () {
                                alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
                            }

                            function clearLocalData () {
                                UE.getEditor('editor').execCommand( "clearlocaldata" );
                                alert("已清空草稿箱")
                            }
                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label></label>
                    </div>
                    <div class="field">
                        <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
