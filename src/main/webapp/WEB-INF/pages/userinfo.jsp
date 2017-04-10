<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.PerformerBean" %>
<%@ page import="com.fk.bean.MovieBean" %>
<%@ page import="com.fk.bean.SiteBean" %><%--
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
    <link media="all" href="${pageContext.request.contextPath}/css/jquery-labelauty.css" type="text/css" rel="stylesheet">
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
                    <div class="tab-title active">在线购票</div>
                </div>
                <div class="tab-content-container">
                    <div class="tab-desc tab-content active">
                        <div class="module">
                            <div class="mod-title">
                                <h3>影院：</h3>
                            </div>
                            <style>
                                ul { list-style-type: none;}
                                li { display: inline-block;}
                                li { margin: 10px 0;}
                                input.labelauty + label { font: 12px "Microsoft Yahei";}
                            </style>
                            <form action="${pageContext.request.contextPath}/buymovie">
                                <ul class="dowebok">
                                    <%
                                        List<SiteBean> siteBeans = (List) request.getAttribute("site");
                                        for(int i=0;i<siteBeans.size();i++){
                                            if(i == 0){
                                    %>
                                    <li><input type="radio" name="radio"<%if(siteBeans.get(i).getStatus()== 0){%> disabled <%}%>checked data-labelauty="<%=siteBeans.get(i).getSite()%>" value="<%=siteBeans.get(i).getId()%>"></li>
                                    <%}else{%>
                                    <li><input type="radio" name="radio"<%if(siteBeans.get(i).getStatus()== 0){%> disabled <%}%> data-labelauty="<%=siteBeans.get(i).getSite()%>"  value="<%=siteBeans.get(i).getId()%>"></li>
                                    <%}}%>
                                </ul>
                                <input hidden name="id" value="${movie.id}">
                                <style>
                                    .button {
                                        font-family: Arial;
                                        color: #ffffff;
                                        font-size: 35px;
                                        padding: 13px;
                                        text-decoration: none;
                                        -webkit-border-radius: 28px;
                                        -moz-border-radius: 28px;
                                        border-radius: 28px;
                                        -webkit-box-shadow: 0px 1px 3px #666666;
                                        -moz-box-shadow: 0px 1px 3px #666666;
                                        box-shadow: 0px 1px 3px #666666;
                                        text-shadow: 1px 1px 3px #a3a3a3;
                                        border: solid #4180eb 2px;
                                        background: -webkit-gradient(linear, 0 0, 0 100%, from(#1f85de), to(#2068d4));
                                        background: -moz-linear-gradient(top, #1f85de, #2068d4);
                                    }
                                    .button:hover {
                                        background: #1f85de;
                                    }
                                </style>
                                <button type="submit" class="button" value="提交"> 提交</button>
                            </form>
                                <script charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
                                <script charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-labelauty.js"></script>
                                <script>
                                    $(function(){
                                        $(':input').labelauty();
                                    });
                                </script>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <div class="related">
            <div class="module">
                <div class="mod-title">
                    <h3>相关电影</h3>
                </div>
                <div class="mod-content">
                    <div class="related-movies">
                        <dl class="movie-list">
                            <dd>
                                <div class="movie-item">
                                    <a href="#" target="_blank" data-act="movie-click" data-val="{movieid:341749}">
                                        <div class="movie-poster">
                                            <img class="poster-default" src="//ms0.meituan.net/mywww/image/loading_2.e3d934bf.png">
                                            <img src="http://p1.meituan.net/movie/8e5eabeadf237a10227a3124419410ef549583.jpg@106w_145h_1e_1c">
                                        </div>
                                    </a>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="channel-detail movie-item-title" title="我不是潘金莲">
                                    <a href="#" target="_blank" data-act="movies-click" data-val="{movieId:341749}">我不是潘金莲</a>
                                </div>
                                <div class="channel-detail channel-detail-orange"><i class="integer">7.</i><i class="fraction">8</i></div>

                            </dd><dd>
                            <div class="movie-item">
                                <a href="#" target="_blank" data-act="movie-click" data-val="{movieid:1170255}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="//ms0.meituan.net/mywww/image/loading_2.e3d934bf.png">
                                        <img src="http://p0.meituan.net/movie/c6cadc16e53ee7a0f79a9455a147449d50210.jpeg@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="乘风破浪">
                                <a href="#" target="_blank" data-act="movies-click" data-val="{movieId:1170255}">乘风破浪</a>
                            </div>
                            <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">8</i></div>

                        </dd><dd>
                            <div class="movie-item">
                                <a href="#" target="_blank" data-act="movie-click" data-val="{movieid:248916}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="//ms0.meituan.net/mywww/image/loading_2.e3d934bf.png">
                                        <img src="http://p1.meituan.net/movie/fb54328788845ca6aaf8362875a699951041538.jpg@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="铁道飞虎">
                                <a href="#" target="_blank" data-act="movies-click" data-val="{movieId:248916}">铁道飞虎</a>
                            </div>
                            <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">5</i></div>

                        </dd><dd>
                            <div class="movie-item">
                                <a href="#" target="_blank" data-act="movie-click" data-val="{movieid:338349}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="//ms0.meituan.net/mywww/image/loading_2.e3d934bf.png">
                                        <img src="http://p0.meituan.net/movie/018ceaadb90ac5c1b9ba33546d1fb746401981.jpg@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="血战钢锯岭">
                                <a href="#" target="_blank" data-act="movies-click" data-val="{movieId:338349}">血战钢锯岭</a>
                            </div>
                            <div class="channel-detail channel-detail-orange"><i class="integer">9.</i><i class="fraction">4</i></div>

                        </dd><dd>
                            <div class="movie-item">
                                <a href="#" target="_blank" data-act="movie-click" data-val="{movieid:410612}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="//ms0.meituan.net/mywww/image/loading_2.e3d934bf.png">
                                        <img src="http://p1.meituan.net/movie/13d4883803f25244d266c7cd3ac2f15d327618.jpg@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="驴得水">
                                <a href="#" target="_blank" data-act="movies-click" data-val="{movieId:410612}">驴得水</a>
                            </div>
                            <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">5</i></div>

                        </dd><dd>
                            <div class="movie-item">
                                <a href="#" target="_blank" data-act="movie-click" data-val="{movieid:246390}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="//ms0.meituan.net/mywww/image/loading_2.e3d934bf.png">
                                        <img src="http://p1.meituan.net/movie/7c81af730b119bc04087df7cf2c88f0c310212.png@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="从你的全世界路过">
                                <a href="#" target="_blank" data-act="movies-click" data-val="{movieId:246390}">从你的全世界路过</a>
                            </div>
                            <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">6</i></div>

                        </dd></dl>

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

</body></html>