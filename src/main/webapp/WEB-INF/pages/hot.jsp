<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.NewsBean" %>
<%@ page import="com.fk.bean.PhotoBean" %>
<%@ page import="com.fk.bean.ReturnPhotoBean" %><%--
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
    <title>热点首页 </title>
    <link media="all" href="${pageContext.request.contextPath}/css/index3.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="header">
    <div class="header-inner">
        <a href="${pageContext.request.contextPath}" class="logo" data-act="icon-click"></a>

        <div class="nav">
            <ul class="navbar">
                <li><a href="${pageContext.request.contextPath}" id="index_1" class="active">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/movies"  id="index_2">演出</a></li>
                <li><a href="#" id="index_3">榜单</a></li>
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
            <input name="kw" class="search" maxlength="32" placeholder="找影人、演出" autocomplete="off" type="search">
            <input class="submit" value="" type="submit">
        </form>
    </div>
</div>
<div class="header-placeholder"></div>

<div class="subnav">
    <ul class="navbar">
        <li>
            <a class="active" href="${pageContext.request.contextPath}/hot?hottype=1" id="hottype1">热点首页</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/hot?hottype=2" id="hottype2">新闻资讯</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/hot?hottype=3" id="hottype3">精彩图集</a>
        </li>
    </ul>
</div>


<div class="container" id="app">
    <div class="hotIndex-container">
        <div class="index-news-container clearfix">
            <div class="popular-container">
                <h4 class="red">热门资讯</h4>
                <ul>
                    <%
                        List<NewsBean> hothotnew = (List)request.getAttribute("hothotnew");
                        for(int i=0;i<hothotnew.size();i++){
                            if(i == 0){
                    %>
                    <li class="top1-list">
                        <div>
                            <div class="top-info-thumb">
                                <a href="${pageContext.request.contextPath}/news?id=<%=hothotnew.get(i).getId()%>" target="_top">
                                    <img src="<%=hothotnew.get(i).getImage()%>" alt="">
                                    <i class="ranking top-info-icon red-bg"><%=i+1%></i>
                                </a>
                            </div>
                            <p class="top1-news-content">
                                <a href="${pageContext.request.contextPath}/news?id=<%=hothotnew.get(i).getId()%>" class="two-line" title="<%=hothotnew.get(i).getTitle()%>" target="_top">
                                    <%=hothotnew.get(i).getTitle()%>
                                </a>
                            </p>
                        </div>
                    </li>
                    <%}else{%>
                    <li class="">
                        <div>
                            <div class="normal-link">
                                <i class="ranking red"><%=i+1%></i>
                                <p class="top10-news-content">
                                    <a href="${pageContext.request.contextPath}/news?id=<%=hothotnew.get(i).getId()%>" target="_top" ><%=hothotnew.get(i).getTitle()%></a>
                                </p>
                            </div>            </div>
                    </li>
                    <%}}%>
                </ul>
            </div>

            <div class="latest-container">
                <h4 class="latest-header red">
                    最新资讯
                    <a href="${pageContext.request.contextPath}/hot?hottype=2" class="all-latest">
                        全部
                        <span class="arrow red-arrow"></span>
                    </a>
                </h4>


                <div class="latest-content clearfix">
                    <%
                        List<NewsBean> newhotnew = (List)request.getAttribute("newhotnew");
                        for(int i =0;i<newhotnew.size();i++){
                    %>
                    <div class="latest-news-box">
                        <a href="${pageContext.request.contextPath}/news?id=<%=newhotnew.get(i).getId()%>" target="_top">
                            <img src="<%=newhotnew.get(i).getImage()%>" alt="">
                        </a>
                        <p class="latest-news-title">
                            <a href="${pageContext.request.contextPath}/news?id=<%=newhotnew.get(i).getId()%>" class="two-line" title="<%=newhotnew.get(i).getTitle()%>" target="_top" >
                                <%=newhotnew.get(i).getTitle()%>
                            </a>
                        </p>
                        <div class="info-container">
                            <span>福州文娱演出票务网</span>
                            <span class="images-view-count view-count"><%=newhotnew.get(i).getCount()%></span>
                        </div>
                    </div>
                     <%}%>
                </div>
            </div>

        </div>
        <div class="index-images-container">
            <div class="latest-container">
                <h4 class="latest-header yellow">
                    最新图集
                    <a href="${pageContext.request.contextPath}/hot?hottype=3" class="all-latest">
                        全部
                        <span class="arrow yellow-arrow"></span>
                    </a>
                </h4>
                <div class="latest-content clearfix">
                    <%
                        List<ReturnPhotoBean> photos = (List) request.getAttribute("photos");
                        for(int i=0;i<photos.size();i++){
                    %>
                    <div class="latest-images-box">
                        <div class="clearfix">
                            <a class="latest-images-thumb" href="${pageContext.request.contextPath}/photo?id=<%=photos.get(i).getId()%>" target="_top">
                                <img class="latest-images-big" alt="" src="<%=photos.get(i).getImage1()%>">
                            </a>
                            <a class="latest-images-thumb" href="${pageContext.request.contextPath}/photo?id=<%=photos.get(i).getId()%>" target="_top">
                                <img alt="" src="<%=photos.get(i).getImage2()%>">
                            </a>
                            <a class="latest-images-thumb" href="${pageContext.request.contextPath}/photo?id=<%=photos.get(i).getId()%>" target="_top">
                                <img alt="" src="<%=photos.get(i).getImage3()%>">
                            </a>
                        </div>

                        <a class="latest-images-more" href="${pageContext.request.contextPath}/photo?id=<%=photos.get(i).getId()%>" target="_top">
                            <%=photos.get(i).getCount()%>张图片
                        </a>

                        <div class="latest-images-info">
                            <p class="latest-images-title one-line">
                                <a href="${pageContext.request.contextPath}/photo?id=<%=photos.get(i).getId()%>" target="_top">
                                    <%=photos.get(i).getTitle()%>
                                </a>
                            </p>
                            <span class="latest-images-view view-count"><%=photos.get(i).getLookcount()%></span>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>

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
