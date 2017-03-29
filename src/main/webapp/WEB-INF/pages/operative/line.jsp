<%@ page import="java.util.List" %>
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
        <li><a href="${pageContext.request.contextPath}/operative/pass" ><span class="icon-caret-right"></span>商城管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/page" ><span class="icon-caret-right"></span>商城添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/adv" ><span class="icon-caret-right"></span>首页轮播</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/addarticle" ><span class="icon-caret-right"></span>攻略添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/column" ><span class="icon-caret-right"></span>攻略管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/line" ><span class="icon-caret-right"></span>路线添加</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>高级修改</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/operative/der" ><span class="icon-caret-right"></span>演员添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/per" ><span class="icon-caret-right"></span>助演添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/type" ><span class="icon-caret-right"></span>分类管理</a></li>
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
            <form method="post" class="form-x" action="${pageContext.request.contextPath}/operative/addline"
                  enctype="multipart/form-data">
                <div class="form-group">
                    <div class="label">
                        <label>标题：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="title" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>简要说明：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="summary" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>旅店名称：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="hotel" value=""/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>吃饭情况：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="meal" value=""/>
                        <div class="tips"></div>
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
