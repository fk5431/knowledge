<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.TypeBean" %>
<%@ page import="com.fk.bean.PlaceBean" %><%--
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

<div class="subnav">
    <ul class="navbar">
        <li>
            <a href="${pageContext.request.contextPath}/movies?showType=1">正在热映</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/movies?showType=2">即将上映</a>
        </li>
        <li>
            <a class="active" href="javascript:void(0);">经典影片</a>
        </li>
    </ul>
</div>
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
                            <a href="${pageContext.request.contextPath}/movies?type=<%=typelist.get(i).getId()%>"><%=typelist.get(i).getTypename()%></a>
                        </li>
                        <%}else{%>
                        <li>
                            <a href="${pageContext.request.contextPath}/movies?type=<%=typelist.get(i).getId()%>"><%=typelist.get(i).getTypename()%></a>
                        </li>
                        <%}}%>
                    </ul>
                </li>
                <li class="tags-line tags-line-border" >
                    <div class="tags-title">区域 :</div>
                    <ul class="tags">
                        <%
                            List<PlaceBean> listplace = (List)request.getAttribute("placename");
                            Integer place = (Integer)request.getAttribute("place");
                            for(int i=0;i<listplace.size();i++){
                                if(place.intValue() == i){
                        %>
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/movies?place=<%=listplace.get(i).getId()%>" style="cursor: default;"><%=listplace.get(i).getPlacename()%></a>
                        </li>
                        <%}else{%>
                        <li>
                            <a href="${pageContext.request.contextPath}/movies?place=<%=listplace.get(i).getId()%>" style="cursor: default;"><%=listplace.get(i).getPlacename()%></a>
                        </li>
                        <%}}%>
                    </ul>
                </li>
                <li class="tags-line tags-line-border" data-val="{tagTypeName:'year'}">
                    <div class="tags-title">年代 :</div>
                    <ul class="tags">
                        <li class="active" data-state-val="{ yearTagName:'全部'}">
                            <a data-act="tag-click" data-val="{TagName:'全部'}" href="javascript:void(0);" style="cursor: default;">全部</a>
                        </li>
                        <li>
                            <a data-act="tag-click" data-val="{TagName:'2017以后'}" href="http://maoyan.com/films/?yearId=13">2017以后</a>
                        </li><li>
                        <a data-act="tag-click" data-val="{TagName:'2017'}" href="http://maoyan.com/films/?yearId=12">2017</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'2016'}" href="http://maoyan.com/films/?yearId=11">2016</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'2015'}" href="http://maoyan.com/films/?yearId=10">2015</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'2014'}" href="http://maoyan.com/films/?yearId=9">2014</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'2013'}" href="http://maoyan.com/films/?yearId=8">2013</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'2012'}" href="http://maoyan.com/films/?yearId=7">2012</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'2011'}" href="http://maoyan.com/films/?yearId=6">2011</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'2000-2010'}" href="http://maoyan.com/films/?yearId=5">2000-2010</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'90年代'}" href="http://maoyan.com/films/?yearId=4">90年代</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'80年代'}" href="http://maoyan.com/films/?yearId=3">80年代</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'70年代'}" href="http://maoyan.com/films/?yearId=2">70年代</a>
                    </li><li>
                        <a data-act="tag-click" data-val="{TagName:'更早'}" href="http://maoyan.com/films/?yearId=1">更早</a>
                    </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="movies-panel">
            <div class="movies-sorter">
                <div class="cat-sorter">
                    <ul>
                        <li>
            <span class="sort-control-group" data-act="sort-click" data-val="{tagId: 1 }" style="cursor: default;">
              <span class="sort-control sort-radio sort-radio-checked"></span>
              <span class="sort-control-label">按热门排序</span>
            </span>
                        </li>
                        <li>
            <span class="sort-control-group" data-act="sort-click" data-val="{tagId: 2 }" data-href="?sortId=2" onclick="location.href=this.getAttribute('data-href')">
              <span class="sort-control sort-radio"></span>
              <span class="sort-control-label">按时间排序</span>
            </span>
                        </li>
                        <li>
            <span class="sort-control-group" data-act="sort-click" data-val="{tagId: 3 }" data-href="?sortId=3" onclick="location.href=this.getAttribute('data-href')">
              <span class="sort-control sort-radio"></span>
              <span class="sort-control-label">按评价排序</span>
            </span>
                        </li>
                    </ul>
                </div>
                <div class="play-sorter">
        <span class="sort-control-group" data-act="isplay-click" data-val="{isplay:1}" data-href="?isPlay=1" onclick="location.href=this.getAttribute('data-href')">
          <span class="sort-control sort-checkbox"></span>
          <span class="sort-control-label">可播放</span>
        </span>
                </div>
            </div>
            <div class="movies-list">

                <dl class="movie-list">
                    <dd>
                        <div class="movie-item">
                            <a href="http://maoyan.com/films/342858" target="_top" data-act="movie-click" data-val="{movieid:342858}">
                                <div class="movie-poster">
                                    <img class="poster-default" src="loading_2.e3d934bf.png">
                                    <img src="0ec2ddc2bed2bad93017aacc473be337387115.jpg@160w_220h_1e_1c">
                                </div>
                            </a>
                            <div class="movie-ver"></div>
                        </div>
                        <div class="channel-detail movie-item-title" title="一条狗的使命">
                            <a href="http://maoyan.com/films/342858" target="_top" data-act="movies-click" data-val="{movieId:342858}">一条狗的使命</a>
                        </div>
                        <div class="channel-detail channel-detail-orange"><i class="integer">9.</i><i class="fraction">2</i></div>

                    </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/247875" target="_top" data-act="movie-click" data-val="{movieid:247875}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="0b7cc256954866593a8e79009acade71487726.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax2d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="金刚狼3：殊死一战">
                        <a href="http://maoyan.com/films/247875" target="_top" data-act="movies-click" data-val="{movieId:247875}">金刚狼3：殊死一战</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">8</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/346383" target="_top" data-act="movie-click" data-val="{movieid:346383}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="5be09f397d474988afaf930ac5346243715496.png@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="最终幻想15：王者之剑">
                        <a href="http://maoyan.com/films/346383" target="_top" data-act="movies-click" data-val="{movieId:346383}">最终幻想15：王者之剑</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">7.</i><i class="fraction">9</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/246065" target="_top" data-act="movie-click" data-val="{movieid:246065}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="f2c42c3bb14aa32726e5e6f42783a5945961833.jpeg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="m3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="生化危机：终章">
                        <a href="http://maoyan.com/films/246065" target="_top" data-act="movies-click" data-val="{movieId:246065}">生化危机：终章</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">6</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/247658" target="_top" data-act="movie-click" data-val="{movieid:247658}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="acf88770d5b1d548bf8732b0691600a9697009.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="美女与野兽">
                        <a href="http://maoyan.com/films/247658" target="_top" data-act="movies-click" data-val="{movieId:247658}">美女与野兽</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/344880" target="_top" data-act="movie-click" data-val="{movieid:344880}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="f61091a2c7dc541d472c9027ffd211856476496.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="天才捕手">
                        <a href="http://maoyan.com/films/344880" target="_top" data-act="movies-click" data-val="{movieId:344880}">天才捕手</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">2</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/249898" target="_top" data-act="movie-click" data-val="{movieid:249898}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="7bba601685691f8d7c2bf07a1d5af2f6155618.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="金刚：骷髅岛">
                        <a href="http://maoyan.com/films/249898" target="_top" data-act="movies-click" data-val="{movieId:249898}">金刚：骷髅岛</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/1200675" target="_top" data-act="movie-click" data-val="{movieid:1200675}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="bb275a637f75baa9ad11c550fdac61a51036680.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="玛格丽特的春天">
                        <a href="http://maoyan.com/films/1200675" target="_top" data-act="movies-click" data-val="{movieId:1200675}">玛格丽特的春天</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">6.</i><i class="fraction">8</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/344258" target="_top" data-act="movie-click" data-val="{movieid:344258}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="2fed2c127078fcca08b075736bf7b69e454069.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="欢乐好声音">
                        <a href="http://maoyan.com/films/344258" target="_top" data-act="movies-click" data-val="{movieId:344258}">欢乐好声音</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">9.</i><i class="fraction">2</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/1199126" target="_top" data-act="movie-click" data-val="{movieid:1199126}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="f154e7c5b07b659274f5f6cef8c2046f941755.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="夜色撩人">
                        <a href="http://maoyan.com/films/1199126" target="_top" data-act="movies-click" data-val="{movieId:1199126}">夜色撩人</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">5.</i><i class="fraction">6</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/248576" target="_top" data-act="movie-click" data-val="{movieid:248576}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="b02745ed0fb3346181bc30f2c814862f526137.jpeg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="m3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="碟仙诡谭2">
                        <a href="http://maoyan.com/films/248576" target="_top" data-act="movies-click" data-val="{movieId:248576}">碟仙诡谭2</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">4.</i><i class="fraction">0</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/342183" target="_top" data-act="movie-click" data-val="{movieid:342183}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="c138a4878343cca293708a23e566d5bc837570.png@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="乐高蝙蝠侠大电影">
                        <a href="http://maoyan.com/films/342183" target="_top" data-act="movies-click" data-val="{movieId:342183}">乐高蝙蝠侠大电影</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">7</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/334590" target="_top" data-act="movie-click" data-val="{movieid:334590}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="43aeb3fe86ed6fb9f9cc86ed0b177e26109383.jpeg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="极限特工：终极回归">
                        <a href="http://maoyan.com/films/334590" target="_top" data-act="movies-click" data-val="{movieId:334590}">极限特工：终极回归</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">8</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/248700" target="_top" data-act="movie-click" data-val="{movieid:248700}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="af297f59e363ce96290dfea22f6fea0c153020.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="速度与激情8">
                        <a href="http://maoyan.com/films/248700" target="_top" data-act="movies-click" data-val="{movieId:248700}">速度与激情8</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/338436" target="_top" data-act="movie-click" data-val="{movieid:338436}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="968965a2dde3d27a192b6e6881fff9d8119572.jpeg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax2d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="爱乐之城">
                        <a href="http://maoyan.com/films/338436" target="_top" data-act="movies-click" data-val="{movieId:338436}">爱乐之城</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">6</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/1156890" target="_top" data-act="movie-click" data-val="{movieid:1156890}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="9d734dd56913786169d1d5a6186bcc0588473.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="欢乐喜剧人">
                        <a href="http://maoyan.com/films/1156890" target="_top" data-act="movies-click" data-val="{movieId:1156890}">欢乐喜剧人</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/1170255" target="_top" data-act="movie-click" data-val="{movieid:1170255}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="c6cadc16e53ee7a0f79a9455a147449d50210.jpeg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="乘风破浪">
                        <a href="http://maoyan.com/films/1170255" target="_top" data-act="movies-click" data-val="{movieId:1170255}">乘风破浪</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">8</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/344440" target="_top" data-act="movie-click" data-val="{movieid:344440}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img src="1a5b5cf8adcde9df2775a1b28ab0eae0245755.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="诡眼">
                        <a href="http://maoyan.com/films/344440" target="_top" data-act="movies-click" data-val="{movieId:344440}">诡眼</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/248933" target="_top" data-act="movie-click" data-val="{movieid:248933}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p1.meituan.net/movie/d273af80e581b4c60abcbb57a95ad2b72956123.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="m3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="功夫瑜伽">
                        <a href="http://maoyan.com/films/248933" target="_top" data-act="movies-click" data-val="{movieId:248933}">功夫瑜伽</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">5</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/1189089" target="_top" data-act="movie-click" data-val="{movieid:1189089}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p1.meituan.net/movie/cfcdb50d181a2111a2b79a0639db0f19764116.png@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="m3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="熊出没·奇幻空间">
                        <a href="http://maoyan.com/films/1189089" target="_top" data-act="movies-click" data-val="{movieId:1189089}">熊出没·奇幻空间</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">9.</i><i class="fraction">2</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/78608" target="_top" data-act="movie-click" data-val="{movieid:78608}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p0.meituan.net/movie/e631df85c6cadddafc6792cd94fd14ad6081426.jpeg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="刺客信条">
                        <a href="http://maoyan.com/films/78608" target="_top" data-act="movies-click" data-val="{movieId:78608}">刺客信条</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">7.</i><i class="fraction">5</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/344199" target="_top" data-act="movie-click" data-val="{movieid:344199}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p0.meituan.net/movie/af2bb39ad95ffea3d38d573be79d7553964282.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="惊魂绣花鞋">
                        <a href="http://maoyan.com/films/344199" target="_top" data-act="movies-click" data-val="{movieId:344199}">惊魂绣花鞋</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">5.</i><i class="fraction">4</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/246012" target="_top" data-act="movie-click" data-val="{movieid:246012}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p1.meituan.net/movie/a60d248eb5f668f349c1f7374d7ab0c0746712.png@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="加勒比海盗5：死无对证">
                        <a href="http://maoyan.com/films/246012" target="_top" data-act="movies-click" data-val="{movieId:246012}">加勒比海盗5：死无对证</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/248904" target="_top" data-act="movie-click" data-val="{movieid:248904}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p0.meituan.net/movie/cd2791a174bfc7c1bc630fbb281c30e0308728.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="西游伏妖篇">
                        <a href="http://maoyan.com/films/248904" target="_top" data-act="movies-click" data-val="{movieId:248904}">西游伏妖篇</a>
                    </div>
                    <div class="channel-detail channel-detail-orange"><i class="integer">7.</i><i class="fraction">8</i></div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/346411" target="_top" data-act="movie-click" data-val="{movieid:346411}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p0.meituan.net/movie/796dcb69943131e6ec5e43e99f9f8a98845278.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="守护者：世纪战元">
                        <a href="http://maoyan.com/films/346411" target="_top" data-act="movies-click" data-val="{movieId:346411}">守护者：世纪战元</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/652323" target="_top" data-act="movie-click" data-val="{movieid:652323}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p0.meituan.net/movie/337dd8d6197c417c806c7a094ae4a4635050674.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="小阴谋大爱情">
                        <a href="http://maoyan.com/films/652323" target="_top" data-act="movies-click" data-val="{movieId:652323}">小阴谋大爱情</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/176" target="_top" data-act="movie-click" data-val="{movieid:176}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p1.meituan.net/movie/fb6277b3ad96292d0301f5c87607dafa5517413.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="麦兜响当当">
                        <a href="http://maoyan.com/films/176" target="_top" data-act="movies-click" data-val="{movieId:176}">麦兜响当当</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/343012" target="_top" data-act="movie-click" data-val="{movieid:343012}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p0.meituan.net/movie/b214bc36d55befa75a879c84a5e8ffd92874737.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="嫌疑人x的献身">
                        <a href="http://maoyan.com/films/343012" target="_top" data-act="movies-click" data-val="{movieId:343012}">嫌疑人x的献身</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/343669" target="_top" data-act="movie-click" data-val="{movieid:343669}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p1.meituan.net/movie/89cd34b8eb276dcc74aae6213aa5ef0c1964826.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="傲娇与偏见">
                        <a href="http://maoyan.com/films/343669" target="_top" data-act="movies-click" data-val="{movieId:343669}">傲娇与偏见</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd><dd>
                    <div class="movie-item">
                        <a href="http://maoyan.com/films/246969" target="_top" data-act="movie-click" data-val="{movieid:246969}">
                            <div class="movie-poster">
                                <img class="poster-default" src="loading_2.e3d934bf.png">
                                <img data-src="http://p0.meituan.net/movie/a9bbd27d89c4529ed80979fb313ba566855940.jpg@160w_220h_1e_1c">
                            </div>
                        </a>
                        <div class="movie-ver"><i class="imax3d"></i></div>
                    </div>
                    <div class="channel-detail movie-item-title" title="攻壳机动队">
                        <a href="http://maoyan.com/films/246969" target="_top" data-act="movies-click" data-val="{movieId:246969}">攻壳机动队</a>
                    </div>
                    <div class="channel-detail channel-detail-orange">暂无评分</div>

                </dd></dl>


            </div>
            <div class="movies-pager">


                <ul class="list-pager">




                    <li class="active">
                        <a class="page_1" href="javascript:void(0);" style="cursor: default;">1</a>

                    </li>
                    <li>
                        <a class="page_2" href="http://maoyan.com/films/?offset=30">2</a>

                    </li>
                    <li>
                        <a class="page_3" href="http://maoyan.com/films/?offset=60">3</a>

                    </li>
                    <li>
                        <a class="page_4" href="http://maoyan.com/films/?offset=90">4</a>

                    </li>
                    <li>
                        <a class="page_5" href="http://maoyan.com/films/?offset=120">5</a>

                    </li>

                    <li class="sep">...</li>
                    <li>
                        <a class="page_22774" href="http://maoyan.com/films/?offset=683190">22774</a>

                    </li>



                    <li>  <a class="page_2" href="http://maoyan.com/films/?offset=30">下一页</a>
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
