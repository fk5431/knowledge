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
    <title>${movie.title} - 福州文娱演出票务网</title>
    <link href="${pageContext.request.contextPath}/css/shop/buy_4.css" rel="stylesheet" type="text/css"/>
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
            <input name="kw" class="search" maxlength="32" placeholder="找演出" autocomplete="off" type="search">
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

                                <div class="mod-title">
                                    <h3>座位：</h3>
                                </div>


                                <div class="res-inf" id="baseInfoForm">
                                    <h2>预订人信息（<span>用于接收订单反馈</span>）</h2>
                                    <div class="user-int clearfix">
                                        <div class="form-sec flt1" style="clear: both">
                                            <%--<label for="base_name">姓名</label>--%>
                                            <input id="base_name" type="text" class="bord-red" value="姓名" name="name">
                                        </div>
                                        <div class="form-sec flt1" style="clear: both">
                                            <%--<label for="base_email">邮箱</label>--%>
                                            <div class="parentCls">
                                                <input data-E id="base_email" type="text" class="bord-red" value="邮箱"  name="email">
                                            </div>
                                        </div>
                                        <div class="form-sec flt1" style="clear: both">
                                            <%--<label for="base_wechat">微信</label>--%>
                                            <input id="base_wechat" type="text" value="仅作为备用联系方式" name="wechat">
                                        </div>
                                        <div class="ver-code clearfix">
                                            <p class="form-sec flt1">
                                                <input id="base_phone" type="tel" value="手机号" name="mob">
                                                <%--<label for="base_phone">手机</label>--%>
                                            </p>
                                        </div>
                                        <div class="form-sec form-tare">
                                            <label></label>
                                            <textarea id="base_description" type="text" value="备注信息" name="other">备注信息</textarea>
                                        </div>
                                        <input name="id" value="${order.id}" hidden>
                                    </div>
                                </div>

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

</body></html>