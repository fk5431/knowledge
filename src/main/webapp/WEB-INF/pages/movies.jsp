<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.TypeBean" %>
<%@ page import="com.fk.bean.PlaceBean" %>
<%@ page import="com.fk.bean.MovieBean" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 15/03/17
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>经典影片 - 一网打尽好电影</title>
    <link media="all" href="${pageContext.request.contextPath}/css/index2.css" type="text/css" rel="stylesheet">
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


<div class="container" id="app">
    <div class="movies-channel">
        <div class="tags-panel">
            <ul class="tags-lines">
                <li class="tags-line">
                    <div class="tags-title">类型 :</div>
                    <ul class="tags">
                        <%
                            List<TypeBean> typelist = (List)request.getAttribute("typename");
                            Integer type = (Integer)request.getAttribute("type");
                            for(int i=0;i<typelist.size();i++){
                            if(type.intValue() == i){
                        %>
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/movies?typeid=<%=typelist.get(i).getId()%>"><%=typelist.get(i).getTypename()%></a>
                        </li>
                        <%}else{%>
                        <li>
                            <a href="${pageContext.request.contextPath}/movies?typeid=<%=typelist.get(i).getId()%>"><%=typelist.get(i).getTypename()%></a>
                        </li>
                        <%}}%>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="movies-panel">
            <div class="movies-list">

                <dl class="movie-list">
                    <%
                        List<MovieBean> movieBeans = (List)request.getAttribute("typeMovie");
                        for(int i=0;i<movieBeans.size();i++){
                    %>
                    <dd>
                        <div class="movie-item">
                            <a href="${pageContext.request.contextPath}/film?id=<%=movieBeans.get(i).getId()%>">
                                <div class="movie-poster">
                                    <img class="poster-default" src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                    <img src="<%=movieBeans.get(i).getImage()%>">
                                </div>
                            </a>
                            <div class="movie-ver"></div>
                        </div>
                        <div class="channel-detail movie-item-title" title="<%=movieBeans.get(i).getTitle()%>">
                            <a href="${pageContext.request.contextPath}/film?id=<%=movieBeans.get(i).getId()%>" target="_top"><%=movieBeans.get(i).getTitle()%></a>
                        </div>
                        <div class="channel-detail channel-detail-orange"><i class="integer"><%=movieBeans.get(i).getScore()%></i></div>
                    </dd>
                    <%}%>
                </dl>
            </div>

            <div class="movies-pager">
                <ul class="list-pager">
                    <%
                        Integer pageAll = (Integer)request.getAttribute("page");
                        Integer pageNow = (Integer)request.getAttribute("pageNow");

                        for(int i=1;i<= pageAll.intValue() - pageNow.intValue() + 1;i++){
                            if(i == pageNow.intValue()){
                    %>
                    <li class="active">
                        <a class="page_1" style="cursor: default;"><%=i%></a>
                    </li>
                    <%}else{%>
                    <li>
                        <a class="page_2" href="${pageContext.request.contextPath}/movies?page=<%=i%>"><%=i%></a>
                    </li>
                    <%}}%>
                    <%--<li class="sep">...</li>--%>
                    <li>  <a class="page_2" href="${pageContext.request.contextPath}/movies?page=${pageNow+1}">下一页</a>
                    </li>
                </ul>


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
