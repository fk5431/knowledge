<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.MovieBean" %><%--
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
    <link media="all" href="${pageContext.request.contextPath}/css/top.css" type="text/css" rel="stylesheet">
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

<div class="subnav">
    <ul class="navbar">
        <li>
            <a href="${pageContext.request.contextPath}/top?toptype=1" id="hottype1"  class="active">评分榜</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/top?toptype=2" id="hottype2">最受期待榜</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/top?toptype=3" id="hottype3">被收藏榜</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/top?toptype=4" id="hottype4">即将上映榜</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/top?toptype=5" id="hottype5">订票数榜</a>
        </li>
    </ul>
</div>


<div class="container" id="app">
    <div class="content">
        <div class="wrapper">
            <div class="main">
                <%--<p class="update-time">2017-04-10<span class="has-fresh-text">已更新</span></p>--%>
                <dl class="board-wrapper">
                    <%
                        List<MovieBean> movieBeans = (List)request.getAttribute("movie");
                        List<String> name = (List)request.getAttribute("name");
                        for(int i=0;i<movieBeans.size();i++){
                            if(i == 0){
                    %>
                    <dd>
                        <i class="board-index board-index-1"><%=i+1%></i>
                        <a href="${pageContext.request.contextPath}/film?id=<%=movieBeans.get(i).getId()%>" class="image-link">
                            <img  class="board-img" src="<%=movieBeans.get(i).getImage()%>">
                        </a>
                        <div class="board-item-main">
                            <div class="board-item-content">
                                <div class="movie-item-info">
                                    <p class="name"><a href="${pageContext.request.contextPath}/film?id=<%=movieBeans.get(i).getId()%>"><%=movieBeans.get(i).getTitle()%></a></p>
                                    <p class="star">
                                        主演：<%=name.get(i)%>
                                    </p>
                                    <p class="releasetime">上映时间：<%=movieBeans.get(i).getShowtime()%></p>
                                    <p class="releasetime">想看人数：<%=movieBeans.get(i).getLookcount()%></p>
                                    <p class="releasetime">订票人数：<%=movieBeans.get(i).getBoxoffice()%></p>
                                    <p class="releasetime">收藏人数：<%=movieBeans.get(i).getScorenum()%></p>
                                </div>
                                <div class="movie-item-number score-num">
                                    <p class="score"><i class="integer"><%=movieBeans.get(i).getScore()%></i></p>
                                </div>

                            </div>
                        </div>

                    </dd>
                    <%}else {%>
                    <dd>
                        <i class="board-index board-index-2"><%=i+1%></i>
                        <a href="${pageContext.request.contextPath}/film?id=<%=movieBeans.get(i).getId()%>" class="image-link">
                            <img class="board-img" src="<%=movieBeans.get(i).getImage()%>">
                        </a>
                        <div class="board-item-main">
                            <div class="board-item-content">
                                <div class="movie-item-info">
                                    <p class="name"><a href="${pageContext.request.contextPath}/film?id=<%=movieBeans.get(i).getId()%>"><%=movieBeans.get(i).getTitle()%></a></p>
                                    <p class="star">
                                        主演：<%=name.get(i)%>
                                    </p>
                                    <p class="releasetime">上映时间：<%=movieBeans.get(i).getShowtime()%></p>
                                    <p class="releasetime">想看人数：<%=movieBeans.get(i).getLookcount()%></p>
                                    <p class="releasetime">订票人数：<%=movieBeans.get(i).getBoxoffice()%></p>
                                    <p class="releasetime">收藏人数：<%=movieBeans.get(i).getScorenum()%></p>
                                </div>
                                <div class="movie-item-number score-num">
                                    <p class="score"><i class="integer"><%=movieBeans.get(i).getScore()%></i></p>
                                </div>

                            </div>
                        </div>

                    </dd>
                    <%}
                        }%>

                </dl>

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

    var hottype = ${hottype};
    if (hottype == 1) {
        document.getElementById('hottype1').className = 'active';
        document.getElementById('hottype2').className = '';
        document.getElementById('hottype3').className = '';
        document.getElementById('hottype4').className = '';
        document.getElementById('hottype5').className = '';
    }else if (hottype == 2) {
        document.getElementById('hottype1').className = '';
        document.getElementById('hottype2').className = 'active';
        document.getElementById('hottype3').className = '';
        document.getElementById('hottype4').className = '';
        document.getElementById('hottype5').className = '';
    }else if (hottype == 3) {
        document.getElementById('hottype1').className = '';
        document.getElementById('hottype2').className = '';
        document.getElementById('hottype3').className = 'active';
        document.getElementById('hottype4').className = '';
        document.getElementById('hottype5').className = '';
    }else if (hottype == 4) {
        document.getElementById('hottype1').className = '';
        document.getElementById('hottype2').className = '';
        document.getElementById('hottype3').className = '';
        document.getElementById('hottype4').className = 'active';
        document.getElementById('hottype5').className = '';
    }else if (hottype == 5) {
        document.getElementById('hottype1').className = '';
        document.getElementById('hottype2').className = '';
        document.getElementById('hottype3').className = '';
        document.getElementById('hottype4').className = '';
        document.getElementById('hottype5').className = 'active';
    }
</script>
</body>
</html>
