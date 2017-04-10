<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.PerformerBean" %>
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
    <title>一条狗的使命 - 福州文娱演出票务网</title>
    <script async="" src="${pageContext.request.contextPath}/js/file/file_1.js"></script>
    <script>
        cid = 128432;
        val = {"id":342858};
        window.system = {"movieId":"342858",
            "imgs":[""],
            "myComment":{}};
    </script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file/file_1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file/file_2.css">
    <script src="${pageContext.request.contextPath}/js/file/file_2.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/js/file/file_3.js"></script>
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
            <input name="kw" class="search" maxlength="32" placeholder="找影人、演出" autocomplete="off" type="search">
            <input class="submit" value="" type="submit">
        </form>
    </div>
</div>
<div class="header-placeholder"></div>

<div class="banner">
    <div class="wrapper clearfix">
        <div class="celeInfo-left">
            <div class="avater-shadow">
                <img class="avater" src="${movie.image}" alt="">
                <div class="movie-ver"></div>
            </div>
        </div>
        <div class="celeInfo-right clearfix">
            <div class="movie-brief-container">
                <h3 class="name">${movie.title}</h3>
                <div class="ename ellipsis">${movie.etitle}</div>
                <ul>
                    <li class="ellipsis">${type}</li>
                    <li class="ellipsis">
                        ${movie.area}
                        / ${movie.time}
                    </li>
                    <li class="ellipsis">${movie.showtime}大陆上映</li>
                    <li class="ellipsis">￥${movie.prizeids}</li>
                </ul>
            </div>
            <div class="action-buyBtn">
                <div class="action clearfix">
                    <a class="wish" href="${pageContext.request.contextPath}/lookcount?id=${movie.id}">
                        <div>
                            <i class="icon wish-icon"></i>
                            <span class="wish-msg" data-act="wish-click">想看</span>
                        </div>
                    </a>
                    <a class="score-btn" href="${pageContext.request.contextPath}/collect?id=${movie.id}">
                        <div>
                            <i class="icon score-btn-icon"></i>
                            <span class="score-btn-msg">
                                收藏
                            </span>
                        </div>
                    </a>
                </div>
                <a class="btn buy" href="${pageContext.request.contextPath}/buy?id=${movie.id}" target="_blank">立即购票</a>
            </div>

            <div class="movie-stats-container">

                <div class="movie-index">
                    <p class="movie-index-title">用户评分</p>
                    <div class="movie-index-content score normal-score">
                        <span class="index-left info-num ">
                            <span class="stonefont">${movie.score}</span>
                        </span>
                        <div class="index-right">
                            <div class="star-wrapper">
                                <div class="star-on" style="width:${movie.score*10}%;"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="movie-index">
                    <p class="movie-index-title">想看数</p>
                    <div class="movie-index-content score pro-score">
                        <span class="index-left info-num ">
                            <span class="stonefont">${movie.lookcount}</span>
                        </span>
                    </div>
                </div>

                <div class="movie-index">
                    <p class="movie-index-title">票房</p>
                    <div class="movie-index-content box">
                        <span class="stonefont">${movie.boxoffice}</span><span class="unit"></span>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="container" id="app">
    <div class="main-content-container clearfix">
        <div class="main-content">
            <div class="tab-container">
                <div class="tab-title-container clearfix">
                    <div class="tab-title active">介绍</div>
                    <div class="tab-title" >参演人员</div>
                    <div class="tab-title">图集</div>
                </div>
                <div class="tab-content-container">
                    <div class="tab-desc tab-content active">
                        <div class="module">
                            <div class="mod-title">
                                <h3>剧情简介</h3>
                            </div>
                            <div class="mod-content">
                                <span class="dra">
                                    ${movie.introduce}
                                </span>

                            </div>
                        </div>
                        <div class="module">
                            <div class="mod-title">
                                <h3>演职人员</h3>
                                <a class="more" href="#celebrity">全部</a>
                            </div>
                            <div class="mod-content">
                                <div class="celebrity-container clearfix">

                                  <%--  <div class="celebrity-group">
                                        <div class="celebrity-type">
                                            主演
                                        </div>
                                        <ul class="celebrity-list clearfix">
                                            <li class="celebrity">
                                                <a href="${pageContext.request.contextPath}/director?id=${director.id}" target="_blank" class="portrait">
                                                    <img class="default-img" alt="" src="${director.image}">
                                                </a>
                                                <div class="info">
                                                    <a href="${pageContext.request.contextPath}/director?id=${director.id}" target="_blank" class="name">
                                                        ${director.name}
                                                    </a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>--%>

                                    <div class="celebrity-group">
                                        <div class="celebrity-type">
                                            演员
                                        </div>
                                        <ul class="celebrity-list clearfix">
                                            <%
                                                List<PerformerBean> performerBeans = (List)request.getAttribute("performer");
                                                for(int i=0;i<4&&i<performerBeans.size();i++){
                                            %>
                                            <li class="celebrity actor">
                                                <a href="${pageContext.request.contextPath}/performer?id=<%=performerBeans.get(i).getId()%>" target="_blank" class="portrait">
                                                    <img class="default-img" alt="" src="<%=performerBeans.get(i).getImage()%>">
                                                </a>
                                                <div class="info">
                                                    <a href="${pageContext.request.contextPath}/performer?id=<%=performerBeans.get(i).getId()%>" target="_blank" class="name">
                                                        <%=performerBeans.get(i).getName()%>
                                                    </a>
                                                </div>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="module">
                            <div class="mod-title">
                                <h3>图集</h3>
                                <a class="more" href="#img" data-act="all-photo-click">全部</a>
                            </div>
                            <div class="mod-content">
                                <div class="album clearfix" data-act="movie-img-click">
                                    <%
                                        MovieBean movie = (MovieBean)request.getAttribute("movie");
                                        String[] images = movie.getAtlas().split("!=end=!");
                                        for (int i=0;i<5&&i<images.length;i++){
                                    %>
                                    <div class="img<%=i+1%>"><img class="default-img" alt="" src="<%=images[i]%>"></div>
                                    <% } %>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="tab-celebrity tab-content">
                        <div class="celebrity-container">
                           <%-- <div class="celebrity-group">
                                <div class="celebrity-type">
                                    主演
                                    <span class="num">（1）</span>
                                </div>

                                <ul class="celebrity-list clearfix">
                                    <li class="celebrity " data-act="celebrity-click" data-val="{celebrityid:35331}">
                                        <a href="${pageContext.request.contextPath}/director?id=${director.id}" target="_blank" class="portrait">
                                            <img class="default-img" alt="" src="http://p1.meituan.net/movie/560a38ffc8dc68d4189e5c1bb058c15334759.jpg@128w_170h_1e_1c">
                                        </a>
                                        <div class="info">
                                            <a href="${pageContext.request.contextPath}/director?id=${director.id}" target="_blank" class="name">
                                                ${director.name}
                                            </a>
                                        </div>
                                    </li>

                                </ul>
                            </div>--%>
                            <div class="celebrity-group">
                                <div class="celebrity-type">
                                    演员
                                    <span class="num">（63）</span>
                                </div>
                                <ul class="celebrity-list clearfix">
                                    <%
                                        for(int i=0;i<performerBeans.size();i++){
                                    %>
                                    <li class="celebrity actor">
                                        <a href="${pageContext.request.contextPath}/performer?id=<%=performerBeans.get(i).getId()%>" target="_blank" class="portrait">
                                            <img class="default-img" alt="" src="<%=performerBeans.get(i).getImage()%>">
                                        </a>
                                        <div class="info">
                                            <a href="${pageContext.request.contextPath}/performer?id=<%=performerBeans.get(i).getId()%>" target="_blank" class="name">
                                                <%=performerBeans.get(i).getName()%>
                                            </a>
                                        </div>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="tab-img tab-content" >
                        <ul class="clearfix">
                            <%
                                for (int i=0;i<images.length;i++){
                            %>
                            <li>
                                <img class="default-img" data-act="movie-img-click" alt="" src="<%=images[i]%>">
                            </li>
                            <% } %>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="related">
            <div class="module">
                <div class="mod-title">
                    <h3>相关系列</h3>
                </div>
                <div class="mod-content">
                    <div class="related-movies">
                        <dl class="movie-list">
                            <%
                                List<MovieBean> other = (List)request.getAttribute("other");
                                for (int i=0;i<other.size();i++){
                            %>
                            <dd>
                                <div class="movie-item">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=other.get(i).getId()%>" target="_blank">
                                        <div class="movie-poster">
                                            <img src="<%=other.get(i).getImage()%>">
                                        </div>
                                    </a>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="channel-detail movie-item-title" title="">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=other.get(i).getId()%>" target="_blank"><%=other.get(i).getTitle()%></a>
                                </div>
                                <div class="channel-detail channel-detail-orange"><i class="integer"><%=other.get(i).getScore()%></i></div>

                            </dd>
                            <%}%>
                        </dl>

                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer" style="visibility: visible;">
    <p>
        ©2017
        福州文娱演出票务网
        <a href="#"
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
    }
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
<script src="${pageContext.request.contextPath}/js/file/file_4.js"></script>
<script src="${pageContext.request.contextPath}/js/file/file_5.js"></script>


</body></html>