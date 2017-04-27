<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.MovieBean" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 15/03/17
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <title>${director.name}</title>
    <link media="all" href="${pageContext.request.contextPath}/css/index1.css" type="text/css" rel="stylesheet">
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
                <img class="avater" src="${director.image}" alt="${director.name}">
            </div>
        </div>
        <div class="celeInfo-right clearfix">
            <div class="shortInfo">
                <p class="china-name cele-name">${director.name}</p>
                <p class="eng-name cele-name">${director.ename}</p>
                <p class="property">
                    <span class="profession">主演</span>
                    <span class="birthday">${director.birth}</span>
                    <span class="height">${director.height}</span>
                </p>
            </div>

            <div class="masterpiece">
                <p class="pic-title">历史表演</p>
                <ul class="master-list">
                    <%
                        List<MovieBean> list = (List) request.getAttribute("listmovie");
                        for(int i=0;i<list.size()&&i<3;i++){
                    %>
                    <li class="master-item">
                        <a href="${pageContext.request.contextPath}/film?id=<%=list.get(i).getId()%>" target="_top">
                            <img class="movie-pic" src="<%=list.get(i).getImage()%>">
                            <div class="overlay">
                                <p class="movie-name"><%=list.get(i).getTitle()%></p>
                            </div>
                        </a>
                    </li>
                    <%}%>
                </ul>
            </div>


            <div class="stats-list clearfix">

                <div class="cele-index">
                    <p class="cele-index-title">粉丝</p>

                    <p class="index-num followCount">
                        <span class="stonefont">${director.fan}</span>
                    </p>
                </div>

                <div class="cele-index sumBox">
                    <p class="cele-index-title">累计票房</p>
                    <p class="index-num">
                        <span class="stonefont">${director.boxoffice}</span><span class="unit">亿</span>
                    </p>

                </div>
            </div>





        </div>
    </div>
</div>

<div class="container" id="app">
    <div class="content clearfix content-celebrity">
        <div class="main">
            <div class="module">
                <div class="mod-title">
                    <h3>介绍</h3>
                </div>
                <div class="mod-content">
                    <div class="introduce">
                        <div class="folding-content" style="max-height: none; height: auto;">
                            <p class="cele-desc">${director.introduce}</p>
                            <div class="celeInfo-list">
                                <dl class="dl-left">
                                    <dt class="basicInfo-item name">别&nbsp;&nbsp;&nbsp;&nbsp;名</dt>
                                    <dd class="basicInfo-item value">${director.othername}</dd>
                                    <dt class="basicInfo-item name">出生日期</dt>
                                    <dd class="basicInfo-item value">${director.birth}</dd>
                                    <dt class="basicInfo-item name">出生地</dt>
                                    <dd class="basicInfo-item value">${director.birthplace}</dd>
                                    <dt class="basicInfo-item name">身&nbsp;&nbsp;&nbsp;&nbsp;份</dt>
                                    <dd class="basicInfo-item value">演员</dd>
                                </dl>
                                <dl class="dl-right">
                                    <dt class="basicInfo-item name">性&nbsp;&nbsp;&nbsp;&nbsp;别</dt>
                                    <dd class="basicInfo-item value">${director.sex}</dd>
                                    <dt class="basicInfo-item name">国&nbsp;&nbsp;&nbsp;&nbsp;籍</dt>
                                    <dd class="basicInfo-item value">${director.nationality}</dd>
                                    <dt class="basicInfo-item name">身&nbsp;&nbsp;&nbsp;&nbsp;高</dt>
                                    <dd class="basicInfo-item value">${director.height}</dd>
                                    <dt class="basicInfo-item name">星&nbsp;&nbsp;&nbsp;&nbsp;座</dt>
                                    <dd class="basicInfo-item value">${director.constellation}</dd>
                                </dl>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="photo">
                <div class="module">
                    <div class="mod-title">
                        <h3>图片</h3>
                        <%
                          String[] images = (String[]) request.getAttribute("images");
                        %>
                        <span class="about-num">（<%=images.length%>张）</span>
                        <a class="more" data-act="all-photo-click">全部</a>
                    </div>
                    <div class="mod-content">
                        <div class="slider lazy photo-slider slider-webp">
                            <%
                                for(int i=0;i<images.length&&i<5;i++){
                            %>
                            <div class="item">
                                <div class="image">
                                    <a href="javascript:;" data-act="photo-click">
                                        <img class="slider-photo default-img" src="<%=images[i]%>">
                                    </a>
                                </div>
                            </div>
                            <%}%>
                        </div>

                    </div>
                </div>
            </div>

            <div class="work" style="height: auto;">
                <div class="module" style="height: auto;">
                    <div class="mod-title">
                        <h3>作品</h3>
                        <span class="about-num">（<%=list.size()%>部）</span>
                    </div>
                    <div class="mod-content"  style="height: auto;">
                        <div class="folding-content"  style="height: auto;">
                            <div class="movie-year"  style="height: auto;">
                                <span class="year">所有作品</span>
                                <ul class="movie-BY-list"  style="height: auto;">
                                    <%
                                        for(int i=0;i<list.size();i++){
                                    %>
                                    <li class="movie-BY-item"  style="height: auto;">
                                        <a href="${pageContext.request.contextPath}/film?id=<%=list.get(i).getId()%>" target="_top">
                                            <div class="movie-detail"  style="height: auto;">
                                                <img class="default-img" alt="" src="<%=list.get(i).getImage()%>">
                                                <p class="movie-name"><%=list.get(i).getTitle()%></p>
                                            </div>
                                        </a>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/easySlider.js"></script>
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
</body>
</html>
