<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.NewsBean" %>
<%@ page import="javax.enterprise.inject.New" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 22/03/17
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>新闻资讯 </title>
    <link media="all" href="${pageContext.request.contextPath}/css/index4.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="header">
    <div class="header-inner">
        <a href="${pageContext.request.contextPath}" class="logo" data-act="icon-click"></a>

        <div class="nav">
            <ul class="navbar">
                <li><a href="${pageContext.request.contextPath}" id="index_1" class="active">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/movies"  id="index_2">演出</a></li>
                <li><a href="${pageContext.request.contextPath}/top" id="index_3">榜单</a></li>
                <li><a href="${pageContext.request.contextPath}/hot"  id="index_4">热点</a></li>
            </ul>
        </div>

        <div class="user-info">
            <div class="user-avatar J-login">
                <img src="${pageContext.request.contextPath}/image/7dd82a16316ab32c8359debdb04396ef2897.png">
                <span class="caret"></span>
                <ul class="user-menu">
                    <%
                        String login = (String)request.getAttribute("login");
                        if(login == null || "".equals(login) || !"yes".equals(login)){
                    %>
                    <li><a href="${pageContext.request.contextPath}/log">登录</a></li>
                    <%}else{%>
                    <li><a href="${pageContext.request.contextPath}/info">个人信息</a></li>
                    <%}%>
                </ul>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/search" target="_blank" class="search-form" data-actform="search-click">
            <input name="kw" class="search" maxlength="32" placeholder="找演出" autocomplete="off" type="search">
            <input class="submit" value="" type="submit">
        </form>
    </div>
</div>
<div class="header-placeholder"></div>

<div class="subnav">
    <ul class="navbar">
        <li>
            <a href="${pageContext.request.contextPath}/hot?hottype=1" id="hottype1">热点首页</a>
        </li>
        <li>
            <a class="active" href="${pageContext.request.contextPath}/hot?hottype=2" id="hottype2">新闻资讯</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/hot?hottype=3" id="hottype3">精彩图集</a>
        </li>
    </ul>
</div>

<div class="container" id="app" class="page-news/hotNews" >
    <div class="detail-container">

        <div class="news-container">
            <%
                List<NewsBean> news = (List) request.getAttribute("news");
                for(int i=0;i<news.size();i++){
            %>
            <div class="news-box clearfix">
                <a class="news-img" href="${pageContext.request.contextPath}/news?id=<%=news.get(i).getId()%>" target="_blank" >
                    <img src="<%=news.get(i).getImage()%>" alt="">
                </a>

                <div class="news-content ">
                    <h4 class="news-header one-line">
                        <a href="${pageContext.request.contextPath}/news?id=<%=news.get(i).getId()%>" target="_blank"><%=news.get(i).getTitle()%></a>
                    </h4>
                    <div class="latestNews-text"><%=news.get(i).getIntroduce()%></div>
                    <div class="info-container">
                        <span class="news-source">福州文娱演出票务网</span>
                        <span class="news-date"><%=news.get(i).getTime()%></span>
                        <span class="images-view-count view-count"><%=news.get(i).getCount()%></span>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
        <div class="hot-pager">
            <ul class="list-pager">
                <%
                    Integer pageAll = (Integer)request.getAttribute("page");
                    Integer pageNow = (Integer)request.getAttribute("pageNow");
                    for(int i=1;i<= pageAll.intValue() - pageNow.intValue() + 1;i++){
                        if(i == pageNow.intValue()){
                %>
                <li class="active">
                    <%}else{%>
                <li>
                    <%}%>
                    <a class="page_1" href="${pageContext.request.contextPath}/hot?hottype=2&page=<%=i%>" style="cursor: default" ><%=i%></a>
                </li>
                <%}%>
                <li>
                    <a class="page_2" href="${pageContext.request.contextPath}/hot?hottype=2&page=${page+1}">下一页</a>
                </li>
            </ul>

        </div>
    </div>

</div>

<div class="footer" style="visibility: visible;">
    <p>
        ©2017
        福州文娱演出票务网 ${pageContext.request.contextPath}
        <a href="*"
           target="_top">*ICP证******号</a>
        <a href="#" target="_top">*ICP备********号</a>
        京公网安备 11010502030881号
        <a href="#" target="_top">网络文化经营许可证</a>
        <a href="#" target="_top">电子公告服务规则</a>
    </p>
    <p>北京猫眼文化传媒有限公司</p>
</div>
<script>
    var state = ${index};
    if (state == 0) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = '';
    }else if (state == 1) {
        document.getElementById('index_1').className = 'active';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = '';
    }else if (state == 2) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = 'active';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = '';
    }else if (state == 3) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = 'active';
        document.getElementById('index_4').className = '';
    }else if (state == 4) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = 'active';
    }
</script>
</body>
</html>