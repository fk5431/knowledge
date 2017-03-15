<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 15/03/17
  Time: 16:33
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
                    <span class="profession">演员</span>
                    <span class="birthday">${director.birth}</span>
                    <span class="height">${director.height}</span>
                </p>
            </div>

            <div class="masterpiece">
                <p class="pic-title">代表作</p>
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
                        <span class="about-num">（36部）</span>
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

            <div class="award">
                <div class="module">
                    <div class="mod-title">
                        <h3>奖项</h3>
                        <span class="about-num">（共1次获奖，10次提名）</span>
                    </div>
                    <div class="mod-content">
                        <div class="award-slider award-class slider slick-initialized slick-slider"><button type="button" data-role="none" class="slick-prev slick-arrow slick-disabled" aria-label="Previous" role="button" aria-disabled="true" style="display: none;">Previous</button>
                            <div aria-live="polite" class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 1350px; transform: translate3d(0px, 0px, 0px);" role="listbox"><div class="item active slick-slide slick-current slick-active" data-index="1" data-act="award-click" data-slick-index="0" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide00">
                                <img class="award-icon" src="ae0de4faa2366f9c23405c361387fe6f4358.jpg@128w_128h_1e_1c" alt="奥斯卡金像奖">
                                <p class="award-name">奥斯卡金像奖</p>
                                <p class="award-num">
                                    <span>提名3次</span>
                                </p>
                            </div><div class="item slick-slide slick-active" data-index="2" data-act="award-click" data-slick-index="1" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide01">
                                <img class="award-icon" src="f2cba4940357252555020310d18d6e4c6083.jpg@128w_128h_1e_1c" alt="威尼斯电影节">
                                <p class="award-name">威尼斯电影节</p>
                                <p class="award-num">
                                    <span>提名1次</span>
                                </p>
                            </div><div class="item slick-slide slick-active" data-index="3" data-act="award-click" data-slick-index="2" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide02">
                                <img class="award-icon" src="0fa9952f52d129e333404c6f34bb5e344089.jpg@128w_128h_1e_1c" alt="欧洲电影奖">
                                <p class="award-name">欧洲电影奖</p>
                                <p class="award-num">
                                    <span>提名1次</span>
                                </p>
                            </div><div class="item slick-slide slick-active" data-index="4" data-act="award-click" data-slick-index="3" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide03">
                                <img class="award-icon" src="838789cf240f39401d4d57841a39cbec6396.jpg@128w_128h_1e_1c" alt="英国电影和电视艺术学院奖">
                                <p class="award-name">英国电影和电视艺术学院奖</p>
                                <p class="award-num">
                                    <span>提名1次</span>
                                </p>
                            </div><div class="item slick-slide slick-active" data-index="5" data-act="award-click" data-slick-index="4" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide04">
                                <img class="award-icon" src="c2109ee3bfea364d5dfda837de5998fe5470.jpg@128w_128h_1e_1c" alt="西班牙戈雅奖">
                                <p class="award-name">西班牙戈雅奖</p>
                                <p class="award-num">
                                    <span>提名1次</span>
                                </p>
                            </div><div class="item slick-slide" data-index="6" data-act="award-click" data-slick-index="5" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide05">
                                <img class="award-icon" src="4a0c2722623b60e7e607255a993442ca3927.jpg@128w_128h_1e_1c" alt="意大利大卫奖">
                                <p class="award-name">意大利大卫奖</p>
                                <p class="award-num">
                                    <span>提名1次</span>
                                </p>
                            </div><div class="item slick-slide" data-index="7" data-act="award-click" data-slick-index="6" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide06">
                                <img class="award-icon" src="edcb26ee7e9bc39ca3b611f7f0999e3415634.jpg@128w_128h_1e_1c" alt="独立精神奖">
                                <p class="award-name">独立精神奖</p>
                                <p class="award-num">
                                    <span>获奖1次</span>
                                </p>
                            </div><div class="item slick-slide" data-index="8" data-act="award-click" data-slick-index="7" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide07">
                                <img class="award-icon" src="a7ec01552605e55a09a95c5fc047d55d14418.jpg@128w_128h_1e_1c" alt="美国导演工会奖">
                                <p class="award-name">美国导演工会奖</p>
                                <p class="award-num">
                                    <span>提名1次</span>
                                </p>
                            </div><div class="item slick-slide" data-index="9" data-act="award-click" data-slick-index="8" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide08">
                                <img class="award-icon" src="1abd7eaa97c31c0555f66a046303bf9e7128.jpg@128w_128h_1e_1c" alt="圣塞巴斯蒂安国际电影节">
                                <p class="award-name">圣塞巴斯蒂安国际电影节</p>
                                <p class="award-num">
                                    <span>提名1次</span>
                                </p>
                            </div></div></div>
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
