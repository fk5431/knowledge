<%--
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理中心</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ocss/bootstrap-grid.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ocss/htmleaf-demo.css">
    <link href="${pageContext.request.contextPath}/ocss/quill.snow.css" rel="stylesheet">
    <style type="text/css">
        #editor-container {
            height: 500px;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ocss/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ocss/admin.css">
    <script src="${pageContext.request.contextPath}/ojs/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/ojs/pintuer.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="${pageContext.request.contextPath}/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="login.html"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>基本设置</h2>
    <ul style="display:block">
        <li><a href="${pageContext.request.contextPath}/operative" ><span class="icon-caret-right"></span>网站用户</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/pass" ><span class="icon-caret-right"></span>修改密码</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/page" ><span class="icon-caret-right"></span>单页管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/adv" ><span class="icon-caret-right"></span>首页轮播</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/book" ><span class="icon-caret-right"></span>留言管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/column" ><span class="icon-caret-right"></span>栏目管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
    <ul>
        <li><a href="list.html" ><span class="icon-caret-right"></span>内容管理</a></li>
        <li><a href="add.html" ><span class="icon-caret-right"></span>添加内容</a></li>
        <li><a href="cate.html" ><span class="icon-caret-right"></span>分类管理</a></li>
    </ul>
</div>
<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a href="{:U('Index/info')}" class="icon-home"> 首页</a></li>
    <li><a href="##" id="a_leader_txt">网站信息</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</span>  </li>
</ul>
<div class="admin">
    <div class="panel admin-panel">
        <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 单页信息</strong></div>
        <div class="body-content">
            <form method="post" class="form-x" action="">
                <div class="form-group">
                    <div class="label">
                        <label>标题：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="title" value="" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>图片：</label>
                    </div>
                    <div class="field">
                        <input type="text" id="url1" name="img" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
                        <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>简介：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="introduce" value="" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>内容：</label>
                    </div>
                    <div class="field">
                        <div class="htmleaf-container">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12 mt50">
                                        <div id="standalone-container">
                                            <div id="toolbar-container">
					<span class="ql-formats">
					<select class="ql-font"></select>
					<select class="ql-size"></select>
					</span>
                                                <span class="ql-formats">
					<button class="ql-bold"></button>
					<button class="ql-italic"></button>
					<button class="ql-underline"></button>
					<button class="ql-strike"></button>
					</span>
                                                <span class="ql-formats">
					<select class="ql-color"></select>
					<select class="ql-background"></select>
					</span>
                                                <span class="ql-formats">
					<button class="ql-script" value="sub"></button>
					<button class="ql-script" value="super"></button>
					</span>
                                                <span class="ql-formats">
					<button class="ql-header" value="1"></button>
					<button class="ql-header" value="2"></button>
					<button class="ql-blockquote"></button>
					<button class="ql-code-block"></button>
					</span>
                                                <span class="ql-formats">
					<button class="ql-list" value="ordered"></button>
					<button class="ql-list" value="bullet"></button>
					<button class="ql-indent" value="-1"></button>
					<button class="ql-indent" value="+1"></button>
					</span>
                                                <span class="ql-formats">
					<button class="ql-direction" value="rtl"></button>
					<select class="ql-align"></select>
					</span>
                                                <span class="ql-formats">
					<button class="ql-link"></button>
					<button class="ql-image"></button>
					<button class="ql-video"></button>
					<button class="ql-formula"></button>
					</span>
                                                <span class="ql-formats">
					<button class="ql-clean"></button>
					</span>
                                            </div>
                                            <div id="editor-container"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script src="${pageContext.request.contextPath}/ojs/quill.js"></script>
                        <!-- Initialize Quill editor -->
                        <script>
                            var quill = new Quill('#editor-container', {
                                modules: {
                                    formula: true,
                                    syntax: true,
                                    toolbar: '#toolbar-container'
                                },
                                placeholder: 'Compose an epic...',
                                theme: 'snow'
                            });
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