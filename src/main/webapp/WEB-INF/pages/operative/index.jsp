<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.User" %><%--
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
        <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 网站信息</strong></div>
        <div class="body-content">
            <table class="table table-hover text-center">
                <tr>
                    <th width="120">ID</th>
                    <th>姓名</th>
                    <th>帐号</th>
                    <th>密码</th>
                    <th>修改后密码</th>
                    <th>修改密码</th>
                    <th>删除</th>
                </tr>
                <%
                    List<User> users = (List) request.getAttribute("users");
                    for(int i=0;i<users.size();i++){
                %>
                <tr>
                    <form action="${pageContext.request.contextPath}/operative/updateuser" method="get" id="user<%=i%>">
                    <td><%=users.get(i).getId()%></td>
                    <td><%=users.get(i).getUsername()%></td>
                    <td><%=users.get(i).getEmail()%></td>
                    <td><%=users.get(i).getPassword()%></td>
                    <td><input type="text" name="password"/><input type="text" name="id" hidden value="<%=users.get(i).getId()%>"/></td>
                    <td><div class="button-group"> <a class="button border-red" onclick="document.getElementById('user<%=i%>').submit();return false"><span class="icon-trash-o"></span> 修改</a> </div></td>
                    <td><div class="button-group"> <a class="button border-red" href="${pageContext.request.contextPath}/operative/deluser?id=<%=users.get(i).getId()%>"><span class="icon-trash-o"></span> 删除</a> </div></td>
                    </form>
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
                            <a href="${pageContext.request.contextPath}/operative?page=<%=i%>"><%=i%></a>
                            <%}}%>
                            <a href="${pageContext.request.contextPath}/operative?page=${pageNow+1}">下一页</a>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

</body>
</html>