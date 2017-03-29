<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.OrdersBean" %><%--
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
    </ul>
    <h2><span class="icon-pencil-square-o"></span>高级修改</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/operative/der" ><span class="icon-caret-right"></span>路线管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/per" ><span class="icon-caret-right"></span>旅店管理</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/type" ><span class="icon-caret-right"></span>旅店添加</a></li>
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
                <th>旅游路线标题</th>
                <th>旅游路线图片</th>
                <th>旅游路线价格</th>
                <th width="250">操作</th>
            </tr>
            <%
                List<OrdersBean> order = (List)request.getAttribute("order");
                for(int i=0;i<order.size();i++){
            %>
            <tr>
                <td><%=order.get(i).getId()%></td>
                <td><%=order.get(i).getTitle()%></td>
                <td><img src="<%=order.get(i).getImage()%>"width="120" height="50" /></td>
                <td><%=order.get(i).getPrice()%></td>
                <td>
                    <div class="button-group">
                        <a type="button" class="button border-main" href="${pageContext.request.contextPath}/shop?id=<%=order.get(i).getId()%>" target="_blank"><span class="icon-edit"></span>查看</a>
                        <a type="button" class="button border-main" href="${pageContext.request.contextPath}/operative/addtoindexshop?id=<%=order.get(i).getId()%>"><span class="icon-edit"></span>添加到热卖</a>
                        <a class="button border-red" href="${pageContext.request.contextPath}/operative/delshop?id=<%=order.get(i).getId()%>"  ><span class="icon-trash-o"></span> 删除</a>
                        <a type="button" class="button border-main" href="${pageContext.request.contextPath}/operative/addtoshop?id=<%=order.get(i).getId()%>"><span class="icon-edit"></span>添加到商城</a>
                    </div>
                </td>
            </tr>
            <%}%>
            <tr>
                <td colspan="8">
                    <div class="pagelist">
                        <%
                            Integer pageAll = (Integer)request.getAttribute("page");
                            Integer pageNow = (Integer)request.getAttribute("pageNow");

                            for(int i=1;i<= pageAll.intValue();i++){
                                if(i == pageNow.intValue()){
                        %>
                        <span class="current"><%=i%></span>
                        <%}else{%>
                        <a href="${pageContext.request.contextPath}/operative/pass?page=<%=i%>"><%=i%></a>
                        <%}}%>
                        <a href="${pageContext.request.contextPath}/operative/pass?page=${pageNow+1}">下一页</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>