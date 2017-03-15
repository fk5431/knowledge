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
                <li><a href="${pageContext.request.contextPath}/movies"  id="index_2">电影</a></li>
                <li><a href="#" id="index_3">榜单</a></li>
                <li><a href="#"  id="index_4">热点</a></li>
            </ul>
        </div>

        <div class="user-info">
            <div class="user-avatar J-login">
                <img src="${pageContext.request.contextPath}/image/7dd82a16316ab32c8359debdb04396ef2897.png">
                <span class="caret"></span>
                <ul class="user-menu">
                    <li><a href="javascript:void">登录</a></li>
                </ul>
            </div>
        </div>

        <form action="http://maoyan.com/query" target="_blank" class="search-form" data-actform="search-click">
            <input name="kw" class="search" maxlength="32" placeholder="找影视剧、影人、影院" autocomplete="off" type="search">
            <input class="submit" value="" type="submit">
        </form>

        <div class="app-download">
            <a href="http://maoyan.com/app" target="_top">
                <span class="iphone-icon"></span>
                <span class="apptext">APP下载</span>
                <span class="caret"></span>
                <div class="download-icon">
                    <p class="down-title">扫码下载APP</p>
                    <p class="down-content">选座更优惠</p>
                </div>
            </a>
        </div>
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
                            <span class="textcolor_orange">TOP 100</span>
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
                                <a href="${pageContext.request.contextPath}/film?id=<%=look.get(i).getId()%>">
                                    <div class="ranking-top-left">
                                        <i class="ranking-top-icon"></i>
                                        <img class="ranking-img  default-img"src="<%=look.get(i).getImage()%>">
                                    </div>
                                    <div class="ranking-top-right">
                                        <div class="ranking-top-right-main">
                                            <span class="ranking-top-moive-name"><%=look.get(i).getTitle()%></span>
                                            <p class="ranking-top-wish">
                                                <span class="stonefont"><%=look.get(i).getScore()%></span>分
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <%}else{%>
                            <li class="ranking-item ranking-index-<%=i+1%>">
                                <a href="${pageContext.request.contextPath}/film?id=<%=look.get(i).getId()%>" target="_top">
                                    <span class="normal-link">
                                        <i class="ranking-index"><%=i+1%></i>
                                        <span class="ranking-movie-name"><%=look.get(i).getTitle()%></span>
                                        <span class="ranking-num-info">
                                            <span class="stonefont"><%=look.get(i).getScore()%></span>分
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
                            <a href="${pageContext.request.contextPath}/movie?type=hot" class="textcolor_red" data-act="all-playingMovie-click">
                                <span>全部</span>
                            </a>
                             <span class="panel-arrow panel-arrow-red"></span>
                            </span>
                            <span class="panel-title">
                            <span class="textcolor_red">正在热映（28部）</span>
                          </span>
                    </div>
                    <div class="panel-content">
                        <dl class="movie-list">
                        <%
                            List<MovieBean> listhot = (List)request.getAttribute("listhot");
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
                            <a href="${pageContext.request.contextPath}/movie?type=coming" class="textcolor_blue">
                            <span>全部</span>
                            </a>
                           <span class="panel-arrow panel-arrow-blue"></span>
                        </span>
                        <span class="panel-title">
                            <span class="textcolor_blue">即将上映（269部）</span>
                        </span>
                    </div>
                    <div class="panel-content">
                        <dl class="movie-list">
                            <%
                                List<MovieBean> listcoming = (List)request.getAttribute("listcoming");
                                for(int i=0;i<listcoming.size();i++){
                            %>
                            <dd>
                                <div class="movie-item">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=listcoming.get(i).getId()%>" target="_top" >
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="<%=listcoming.get(i).getImage()%>">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title  movie-title-padding" title="<%=listcoming.get(i).getScore()%>"><%=listcoming.get(i).getScore()%></div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-wish"><span class="stonefont"><%=listcoming.get(i).getLookcount()%></span>人想看</div>
                                    <div class="movie-detail movie-detail-strong movie-presale">
                                        <a class="movie-presale-sep">预告片
                                        </a><a data-act="presaleUpcomingMovie-click"  href="${pageContext.request.contextPath}/buyfilm?id=<%=listcoming.get(i).getId()%>">预 售</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="movie-detail movie-rt"><%=listcoming.get(i).getShowtime()%>上映</div>

                            </dd>
                            <%}%>
                        </dl>

                    </div>
                </div>

                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-more">
                            <a href="${pageContext.request.contextPath}/film?type=isthefile" class="textcolor_red" data-act="all-hotMovie-click">
                                <span>全部</span>
                            </a>
                            <span class="panel-arrow panel-arrow-red"></span>
                        </span>
                        <span class="panel-title">
                            <span class="textcolor_red">热播电影</span>
                        </span>
                        <span class="panel-subtitle">
                            <a href="${pageContext.request.contextPath}/film?typeid=1" class="textcolor_red">爱情</a>
                        </span>
                        <span class="panel-subtitle">
                            <a href="${pageContext.request.contextPath}/film?typeid=2" class="textcolor_red">喜剧</a>
                        </span>
                        <span class="panel-subtitle">
                            <a href="${pageContext.request.contextPath}/film?typeid=8" class="textcolor_red">动作</a>
                        </span>
                        <span class="panel-subtitle">
                            <a href="${pageContext.request.contextPath}/film?typeid=5" class="textcolor_red">恐怖</a>
                        </span>
                        <span class="panel-subtitle">
                            <a href="${pageContext.request.contextPath}/film?typeid=3" class="textcolor_red">动画</a>
                        </span>
                    </div>
                    <div class="panel-content">
                        <dl class="movie-list">
                            <%
                                List<MovieBean> lististhefile = (List)request.getAttribute("lististhefile");
                                for(int i=0;i<lististhefile.size();i++){
                            %>
                            <dd>
                                <div class="movie-item">
                                    <a href="${pageContext.request.contextPath}/film?id=<%=lististhefile.get(i).getId()%>" target="_top">
                                        <% if (i == 0){%>
                                        <div class="movie-poster movie-poster-long">
                                            <%}else{%>
                                                <div class="movie-poster">
                                            <%}%>
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="<%=lististhefile.get(i).getImage()%>">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer"><%=lististhefile.get(i).getScore()%></i></div>
                                                    <div class="movie-title movie-title-padding" title="<%=listhot.get(i).getTitle()%>"><%=listhot.get(i).getTitle()%></div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
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
