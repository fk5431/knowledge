<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.IndexshowBean" %>
<%@ page import="com.fk.bean.NewsBean" %>
<%@ page import="com.fk.bean.MovieBean" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 15/02/17
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>福州文娱演出票务网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index/style.css">
    <link media="all" href="${pageContext.request.contextPath}/css/index.css" type="text/css" rel="stylesheet">
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
            <input name="kw" class="search" maxlength="32"  type="search">
            <input class="submit" value="" type="submit">
        </form>
    </div>
</div>
<div class="header-placeholder"></div>
<div id="slider">
    <ul class="slides clearfix">
        <%
            List<NewsBean> newsBeanList = (List)request.getAttribute("indexshow");
            for(int i=0;i<newsBeanList.size();i++){
        %>
        <li><a href="${pageContext.request.contextPath}/news?id=<%=newsBeanList.get(i).getId()%>">
            <img class="responsive" src="<%=newsBeanList.get(i).getImage()%>"></a></li>
        <% } %>
    </ul>
    <ul class="controls">
        <li><img src="${pageContext.request.contextPath}/image/prev.png" alt="previous"></li>
        <li><img src="${pageContext.request.contextPath}/image/next.png" alt="next"></li>
    </ul>
    <ul class="pagination">
        <li class="active"></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<div class="container" id="app">
    <div class="content">
        <div class="aside">

            <div class="ranking-box-wrapper">
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-title">
                            <span class="textcolor_red">今日票房</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <ul class="ranking-wrapper ranking-box">
                            <%
                                List<MovieBean> salered = (List)request.getAttribute("salered");
                                for(int i=0;i<salered.size();i++){
                                    if(i == 0){
                            %>
                            <li class="ranking-item ranking-top ranking-index-<%=i+1%>">
                                <a href="${pageContext.request.contextPath}/film?id=<%=salered.get(i).getId()%>" target="_top" >
                                    <div class="ranking-top-left">
                                        <i class="ranking-top-icon"></i>
                                        <img class="ranking-img  default-img" src="<%=salered.get(i).getImage()%>">
                                    </div>
                                    <div class="ranking-top-right">
                                        <div class="ranking-top-right-main">
                                            <span class="ranking-top-moive-name"><%=salered.get(i).getTitle()%></span>
                                            <p class="ranking-top-wish">
                                                <span class="stonefont"><%=salered.get(i).getBoxoffice()%></span>万
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <%}else{%>
                            <li class="ranking-item ranking-index-<%=i+1%>">
                                <a href="${pageContext.request.contextPath}/film?id=<%=salered.get(i).getId()%>" target="_top">
                                    <span class="normal-link">
                                        <i class="ranking-index"><%=i+1%></i>
                                        <span class="ranking-movie-name"><%=salered.get(i).getTitle()%></span>
                                        <span class="ranking-num-info">
                                            <span class="stonefont"><%=salered.get(i).getBoxoffice()%></span>万
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <%}}%>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="most-expect-wrapper">
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-title">
                            <span class="textcolor_orange">最受期待</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <ul class="ranking-wrapper ranking-mostExpect">
                            <%
                                List<MovieBean> look = (List)request.getAttribute("look");
                                for(int i=0;i<look.size();i++){
                                    if(i == 0){
                            %>
                            <li class="ranking-item ranking-top ranking-index-1">
                                <a href="${pageContext.request.contextPath}/film?id=<%=look.get(i).getId()%>" target="_top">
                                    <div class="ranking-top-left">
                                        <i class="ranking-top-icon"></i>
                                        <img class="ranking-img  default-img" src="<%=look.get(i).getImage()%>">
                                    </div>
                                    <div class="ranking-top-right">
                                        <div class="ranking-top-right-main">
                                            <span class="ranking-top-moive-name"><%=look.get(i).getTitle()%></span>

                                            <p class="ranking-release-time">上映时间：<%=look.get(i).getShowtime()%></p>

                                            <p class="ranking-top-wish">
                                                <span class="stonefont"><%=look.get(i).getLookcount()%></span>人想看
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <%}else if(i == 1 || i ==2){%>
                            <li class="ranking-item ranking-index-<%=i+1%>">
                                <a href="${pageContext.request.contextPath}/film?id=<%=look.get(i).getId()%>" target="_top" >
                                    <i class="ranking-index"><%=i+1%></i>
                                    <span class="img-link"><img class="ranking-img default-img" src="<%=look.get(i).getImage()%>"></span>
                                    <div class="name-link ranking-movie-name"><%=look.get(i).getTitle()%></div>
                                    <span class="ranking-num-info"><span class="stonefont"><%=look.get(i).getLookcount()%></span>人想看</span>
                                </a>
                            </li>
                            <%}else{%>
                            <li class="ranking-item ranking-index-<%=i+1%>">
                                <a href="${pageContext.request.contextPath}/film?id=<%=look.get(i).getId()%>" target="_top">
                                    <span class="normal-link">
                                        <i class="ranking-index"><%=i+1%></i>
                                        <span class="ranking-movie-name"><%=look.get(i).getTitle()%></span>
                                        <span class="ranking-num-info">
                                            <span class="stonefont"><%=look.get(i).getLookcount()%></span>人想看
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <%}}%>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="top100-wrapper">
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-title">
                            <span class="textcolor_orange">TOP 10</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <ul class="ranking-wrapper ranking-top100">
                            <%
                                List<MovieBean> score = (List)request.getAttribute("score");
                                for(int i=0;i<score.size();i++){
                                    if(i == 0){
                            %>
                            <li class="ranking-item ranking-top ranking-index-1">
                                <a href="${pageContext.request.contextPath}/film?id=<%=score.get(i).getId()%>">
                                    <div class="ranking-top-left">
                                        <i class="ranking-top-icon"></i>
                                        <img class="ranking-img  default-img"src="<%=score.get(i).getImage()%>">
                                    </div>
                                    <div class="ranking-top-right">
                                        <div class="ranking-top-right-main">
                                            <span class="ranking-top-moive-name"><%=score.get(i).getTitle()%></span>
                                            <p class="ranking-top-wish">
                                                <span class="stonefont"><%=score.get(i).getScore()%></span>分
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <%}else{%>
                            <li class="ranking-item ranking-index-<%=i+1%>">
                                <a href="${pageContext.request.contextPath}/film?id=<%=score.get(i).getId()%>" target="_top">
                                    <span class="normal-link">
                                        <i class="ranking-index"><%=i+1%></i>
                                        <span class="ranking-movie-name"><%=score.get(i).getTitle()%></span>
                                        <span class="ranking-num-info">
                                            <span class="stonefont"><%=score.get(i).getScore()%></span>分
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <%}}%>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="most-expect-wrapper">
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-title">
                            <span class="textcolor_orange">最近时间</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <ul class="ranking-wrapper ranking-mostExpect">
                            <%
                                List<MovieBean> time = (List)request.getAttribute("time");
                                for(int i=0;i<time.size();i++){
                                    if(i == 0){
                            %>
                            <li class="ranking-item ranking-top ranking-index-1">
                                <a href="${pageContext.request.contextPath}/film?id=<%=time.get(i).getId()%>" target="_top">
                                    <div class="ranking-top-left">
                                        <i class="ranking-top-icon"></i>
                                        <img class="ranking-img  default-img" src="<%=time.get(i).getImage()%>">
                                    </div>
                                    <div class="ranking-top-right">
                                        <div class="ranking-top-right-main">
                                            <span class="ranking-top-moive-name"><%=time.get(i).getTitle()%></span>

                                            <p class="ranking-release-time">上映时间：<%=time.get(i).getShowtime()%></p>

                                            <p class="ranking-top-wish">
                                                <span class="stonefont"><%=time.get(i).getLookcount()%></span>人想看
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <%}else if(i == 1 || i ==2){%>
                            <li class="ranking-item ranking-index-<%=i+1%>">
                                <a href="${pageContext.request.contextPath}/film?id=<%=time.get(i).getId()%>" target="_top" >
                                    <i class="ranking-index"><%=i+1%></i>
                                    <span class="img-link"><img class="ranking-img default-img" src="<%=time.get(i).getImage()%>"></span>
                                    <div class="name-link ranking-movie-name"><%=look.get(i).getTitle()%></div>
                                    <span class="ranking-num-info"><span class="stonefont"><%=time.get(i).getLookcount()%></span>人想看</span>
                                </a>
                            </li>
                            <%}else{%>
                            <li class="ranking-item ranking-index-<%=i+1%>">
                                <a href="${pageContext.request.contextPath}/film?id=<%=time.get(i).getId()%>" target="_top">
                                    <span class="normal-link">
                                        <i class="ranking-index"><%=i+1%></i>
                                        <span class="ranking-movie-name"><%=time.get(i).getTitle()%></span>
                                        <span class="ranking-num-info">
                                            <span class="stonefont"><%=time.get(i).getLookcount()%></span>人想看
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <%}}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="main">
            <div class="movie-grid">
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-more">
                            <a href="${pageContext.request.contextPath}/movies?typeid=1" class="textcolor_red" data-act="all-playingMovie-click">
                                <span>全部</span>
                            </a>
                             <span class="panel-arrow panel-arrow-red"></span>
                            </span>
                            <span class="panel-title">
                            <span class="textcolor_red">演唱会</span>
                          </span>
                    </div>
                    <div class="panel-content">
                        <dl class="movie-list">
                        <%
                            List<MovieBean> listhot = (List)request.getAttribute("type1");
                            for(int i=0;i<listhot.size();i++){
                        %>
                            <dd>
                                <div class="movie-item">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=listhot.get(i).getId()%>" target="_top"  >
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="<%=listhot.get(i).getImage()%>">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer"><%=listhot.get(i).getScore()%></i></div>
                                                    <div class="movie-title movie-title-padding" title="<%=listhot.get(i).getTitle()%>"><%=listhot.get(i).getTitle()%> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="${pageContext.request.contextPath}/buyfilm?id=<%=listhot.get(i).getId()%>" class="active" target="_top" >购票</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                            </dd>
                            <%}%>
                        </dl>
                    </div>
                </div>

                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-more">
                            <a href="${pageContext.request.contextPath}/movies?typeid=2" class="textcolor_blue">
                            <span>全部</span>
                            </a>
                           <span class="panel-arrow panel-arrow-blue"></span>
                        </span>
                        <span class="panel-title">
                            <span class="textcolor_blue">话剧</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <dl class="movie-list">
                            <%
                                List<MovieBean> listcoming = (List)request.getAttribute("type2");
                                for(int i=0;i<listcoming.size();i++){
                            %>
                            <dd>
                                <div class="movie-item">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=listcoming.get(i).getId()%>" target="_top"  >
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="<%=listcoming.get(i).getImage()%>">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer"><%=listcoming.get(i).getScore()%></i></div>
                                                    <div class="movie-title movie-title-padding" title="<%=listcoming.get(i).getTitle()%>"><%=listcoming.get(i).getTitle()%> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="${pageContext.request.contextPath}/buyfilm?id=<%=listcoming.get(i).getId()%>" class="active" target="_top" >购票</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                            </dd>
                            <%}%>
                        </dl>
                    </div>
                </div>

                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-more">
                            <a href="${pageContext.request.contextPath}/movies?typeid=3" class="textcolor_red" data-act="all-hotMovie-click">
                                <span>全部</span>
                            </a>
                            <span class="panel-arrow panel-arrow-red"></span>
                        </span>
                        <span class="panel-title">
                            <span class="textcolor_red">音乐会</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <dl class="movie-list">
                            <%
                                List<MovieBean> lististhefile = (List)request.getAttribute("type3");
                                for(int i=0;i<lististhefile.size();i++){
                            %>
                            <dd>
                                <div class="movie-item">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=lististhefile.get(i).getId()%>" target="_top"  >
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="<%=lististhefile.get(i).getImage()%>">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer"><%=lististhefile.get(i).getScore()%></i></div>
                                                    <div class="movie-title movie-title-padding" title="<%=lististhefile.get(i).getTitle()%>"><%=lististhefile.get(i).getTitle()%> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="${pageContext.request.contextPath}/buyfilm?id=<%=lististhefile.get(i).getId()%>" class="active" target="_top" >购票</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                            </dd>
                            <%}%>
                        </dl>
                    </div>
                </div>

                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-more">
                            <a href="${pageContext.request.contextPath}/movies?typeid=4" class="textcolor_red" data-act="all-hotMovie-click">
                                <span>全部</span>
                            </a>
                            <span class="panel-arrow panel-arrow-red"></span>
                        </span>
                        <span class="panel-title">
                            <span class="textcolor_red">舞蹈表演</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <dl class="movie-list">
                            <%
                                List<MovieBean> type4 = (List)request.getAttribute("type4");
                                for(int i=0;i<type4.size();i++){
                            %>
                            <dd>
                                <div class="movie-item">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=type4.get(i).getId()%>" target="_top"  >
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="<%=type4.get(i).getImage()%>">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer"><%=type4.get(i).getScore()%></i></div>
                                                    <div class="movie-title movie-title-padding" title="<%=type4.get(i).getTitle()%>"><%=type4.get(i).getTitle()%> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="${pageContext.request.contextPath}/buyfilm?id=<%=type4.get(i).getId()%>" class="active" target="_top" >购票</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                            </dd>
                            <%}%>
                        </dl>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-more">
                            <a href="${pageContext.request.contextPath}/movies?typeid=5" class="textcolor_red" data-act="all-hotMovie-click">
                                <span>全部</span>
                            </a>
                            <span class="panel-arrow panel-arrow-red"></span>
                        </span>
                        <span class="panel-title">
                            <span class="textcolor_red">戏剧</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <dl class="movie-list">
                            <%
                                List<MovieBean> type5 = (List)request.getAttribute("type5");
                                for(int i=0;i<type5.size();i++){
                            %>
                            <dd>
                                <div class="movie-item">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=type5.get(i).getId()%>" target="_top"  >
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="<%=type5.get(i).getImage()%>">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer"><%=type5.get(i).getScore()%></i></div>
                                                    <div class="movie-title movie-title-padding" title="<%=type5.get(i).getTitle()%>"><%=type5.get(i).getTitle()%> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="${pageContext.request.contextPath}/buyfilm?id=<%=type5.get(i).getId()%>" class="active" target="_top" >购票</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                            </dd>
                            <%}%>
                        </dl>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-more">
                            <a href="${pageContext.request.contextPath}/movies?typeid=6" class="textcolor_red" data-act="all-hotMovie-click">
                                <span>全部</span>
                            </a>
                            <span class="panel-arrow panel-arrow-red"></span>
                        </span>
                        <span class="panel-title">
                            <span class="textcolor_red">儿童亲子</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <dl class="movie-list">
                            <%
                                List<MovieBean> type6 = (List)request.getAttribute("type6");
                                for(int i=0;i<type6.size();i++){
                            %>
                            <dd>
                                <div class="movie-item">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=type6.get(i).getId()%>" target="_top"  >
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="<%=type6.get(i).getImage()%>">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer"><%=type6.get(i).getScore()%></i></div>
                                                    <div class="movie-title movie-title-padding" title="<%=type6.get(i).getTitle()%>"><%=type6.get(i).getTitle()%> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="${pageContext.request.contextPath}/buyfilm?id=<%=type6.get(i).getId()%>" class="active" target="_top" >购票</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                            </dd>
                            <%}%>
                        </dl>
                    </div>
                </div>


            </div>

        </div>

    </div>

</div>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/easySlider.js"></script>
<script type="text/javascript">
    $(function() {
        $("#slider").easySlider( {
            slideSpeed: 500,
            paginationSpacing: "15px",
            paginationDiameter: "12px",
            paginationPositionFromBottom: "20px",
            slidesClass: ".slides",
            controlsClass: ".controls",
            paginationClass: ".pagination"
        });
    });
</script>
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
    if (state == 1) {
        document.getElementById('index_1').className = 'active';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = '';
    }
    if (state == 2) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = 'active';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = '';
    }
    if (state == 3) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = 'active';
        document.getElementById('index_4').className = '';
    }
    if (state == 4) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = 'active';
    }
</script>
</body>
</html>
