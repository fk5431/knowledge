<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.TravelBean" %>
<%@ page import="com.fk.bean.PromoReturnBean" %>
<%@ page import="com.fk.bean.OrdersBean" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 23/03/17
  Time: 13:51
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
        <li><a href="${pageContext.request.contextPath}/operative/manshop" ><span class="icon-caret-right"></span>订单管理添加</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>高级修改</h2>
    <ul>
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
        <div class="padding border-bottom">
            <a class="button border-yellow" href="${pageContext.request.contextPath}/operative/addarticle"><span class="icon-plus-square-o"></span> 添加内容</a>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="5%">ID</th>
                <th>模块大标题</th>
                <th>模块小标题</th>
                <th width="250">操作</th>
            </tr>
            <%
                List<PromoReturnBean> travel = (List)request.getAttribute("promo");
                for(int i=0;i<travel.size();i++){
            %>
            <tr>
                <td><%=travel.get(i).getId()%></td>
                <td><%=travel.get(i).getTitle1()%></td>
                <td><%=travel.get(i).getTitle2()%></td>
                <td>
                    <div class="button-group">
                        <a type="button" class="button border-main" href="${pageContext.request.contextPath}/sales" target="_blank"><span class="icon-edit"></span>查看</a>
                        <a class="button border-red" href="${pageContext.request.contextPath}/operative/delpromo?id=<%=travel.get(i).getId()%>"  ><span class="icon-trash-o"></span> 删除</a>
                    </div>
                </td>
            </tr>
            <tr>
                    <%
                    List<OrdersBean> listorder = travel.get(i).getOrders();
                    for(int j=0;j<listorder.size();j++){
                    %><td>
                        <a href="${pageContext.request.contextPath}/shop?id=<%=listorder.get(j).getId()%>" target="_blank"
                           data-mes-g="1-1-0" data-mes-t="位置0"
                           data-mes-salesid="2032398">
                            <div class="image">
                                <img src="<%=listorder.get(j).getImage()%>" height="134" width="238">
                            </div>
                            <div class="caption">
                                <h3 title="<%=listorder.get(j).getTitle()%>"><%=listorder.get(j).getTitle()%></h3>
                                <span class="price"><b>￥<%=listorder.get(j).getPrice()%></b>起</span>
                            </div>
                        </a></td>
                    <%}%>
            </tr>
            <%}%>
        </table>
    </div>
</div>
</body>
</html>