<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.TravelBean" %>
<%@ page import="com.fk.bean.OrdersBean" %> <%--
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
        <li><a href="${pageContext.request.contextPath}/operative/promo" ><span class="icon-caret-right"></span>商城模块管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/addpromoshow" ><span class="icon-caret-right"></span>商城模块管理添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/manshop" ><span class="icon-caret-right"></span>订单管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/der" ><span class="icon-caret-right"></span>路线管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/per" ><span class="icon-caret-right"></span>旅店管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/type" ><span class="icon-caret-right"></span>旅店添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/user" ><span class="icon-caret-right"></span>用户文章审核</a></li>
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
    <li><a   class="icon-home"> 首页</a></li>
    <li><a   id="a_leader_txt">网站信息</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</span>  </li>
</ul>
<div class="admin">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>

        <table class="table table-hover text-center">
            <tr>
                <th width="10%">ID</th>
                <th width="20%">图片</th>
                <th width="15%">名称</th>
                <th width="20%">时间</th>
                <th width="10%">访问量</th>
                <th width="15%">操作</th>
            </tr>
            <%
                List<TravelBean> list = (List)request.getAttribute("indexshow");
                for(int i=0;i<list.size();i++){
            %>
            <tr>
                <td><%=list.get(i).getId()%></td>
                <td><img src="<%=list.get(i).getImage()%>"width="120" height="50" /></td>
                <td><%=list.get(i).getTitle()%></td>
                <td><%=list.get(i).getTime()%></td>
                <td><%=list.get(i).getCount()%></td>
                <td><div class="button-group">
                    <a class="button border-red" href="${pageContext.request.contextPath}/operative/delindex?id=<%=i+1%>"><span class="icon-trash-o"></span> 删除</a>
                </div></td>
            </tr>
            <%}%>

        </table>
    </div>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 目的地banner</strong></div>

        <table class="table table-hover text-center">
            <tr>
                <th width="10%">ID</th>
                <th width="20%">图片</th>
                <th width="15%">名称</th>
                <th width="20%">时间</th>
                <th width="10%">访问量</th>
                <th width="15%">操作</th>
            </tr>

            <tr>
                <td>${banner.id}</td>
                <td><img src="${banner.image}"width="120" height="50" /></td>
                <td>${banner.title}</td>
                <td>${banner.title}</td>
                <td>${banner.count}</td>
                <td><div class="button-group">
                    <a class="button border-red" href="${pageContext.request.contextPath}/operative/delindex?id=6"><span class="icon-trash-o"></span> 删除</a>
                </div></td>
            </tr>

        </table>
    </div>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 首页热卖爆款</strong></div>

        <table class="table table-hover text-center">
            <tr>
                <th width="10%">ID</th>
                <th width="20%">图片</th>
                <th width="15%">名称</th>
                <th width="20%">价格</th>
                <th width="10%">访问量</th>
                <th width="15%">操作</th>
            </tr>
            <%
                List<OrdersBean> order = (List)request.getAttribute("orders");
                for(int i=0;i<order.size();i++){
            %>
            <tr>
                <td><%=order.get(i).getId()%></td>
                <td><img src="<%=order.get(i).getImage()%>"width="120" height="50" /></td>
                <td><%=order.get(i).getTitle()%></td>
                <td><%=order.get(i).getPrice()%></td>
                <td><%=order.get(i).getCount()%></td>
                <td><div class="button-group">
                    <a class="button border-red" href="${pageContext.request.contextPath}/operative/delindexshop?id=<%=i+1%>"><span class="icon-trash-o"></span> 删除</a>
                </div></td>
            </tr>
            <%}%>

        </table>
    </div>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 商城轮播图</strong></div>

        <table class="table table-hover text-center">
            <tr>
                <th width="10%">ID</th>
                <th width="20%">图片</th>
                <th width="15%">名称</th>
                <th width="20%">价格</th>
                <th width="10%">访问量</th>
                <th width="15%">操作</th>
            </tr>
            <%
                List<OrdersBean> ordershop = (List)request.getAttribute("shopshow");
                for(int i=0;i<ordershop.size();i++){
            %>
            <tr>
                <td><%=ordershop.get(i).getId()%></td>
                <td><img src="<%=ordershop.get(i).getImage()%>"width="120" height="50" /></td>
                <td><%=ordershop.get(i).getTitle()%></td>
                <td><%=ordershop.get(i).getPrice()%></td>
                <td><%=ordershop.get(i).getCount()%></td>
                <td><div class="button-group">
                    <a class="button border-red" href="${pageContext.request.contextPath}/operative/delshowshop?id=<%=i+1%>"><span class="icon-trash-o"></span> 删除</a>
                </div></td>
            </tr>
            <%}%>

        </table>
    </div>
</div>

</body>
</html>