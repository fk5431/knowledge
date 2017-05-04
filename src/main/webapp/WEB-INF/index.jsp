<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 24/04/17
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>知识库管理系统</title>
    <meta name="author" content="fengkai">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_style.css">

</head>

<body>
<div class="wrap-body">
    <header>
        <jsp:include page="head.jsp"></jsp:include>

        <div class="wrap-header" style="margin-top: 70px;">
            <h1></h1>
            <div style="margin:0 auto;">
                <div style="margin:0 auto;padding:0;">
                    <form id="searchForm" method="post" action="search_text" style="width:468px;margin:0 auto;">
                        <input id="s" type="text" name="searchText"/> <input type="submit" value="Submit"
                                                                             id="submitButton"/>
                    </form>
                    <!-- <form method="post" action="search_text">
                        <input class="inp_srh" name="searchText" placeholder="请输入您要搜索的作品" />
                        <input class="btn_srh" type="submit" name="submit" value="搜索" />
                    </form> -->
                </div>
            </div>
            <br>
            <div id="top-destination" style="margin-top: -20px;">
                <!--组合查询动态产生-->
                <nav>
                    <ul>
                        <li class="first"><p>Top Destination :</p></li>
                        <li><a href="#">太极拳</a></li>
                        <li><a href="#">运动</a></li>
                        <li><a href="#">《神偷奶爸》</a></li>
                        <li><a href="#">小黄人</a></li>
                        <li><a href="#">手机铃声</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!--////////////////////////////////////Container-->
    <section id="container">
        <div class="wrap-container">
            <!-----------------导航栏第一行-------------------->
            <section class="content-box boxstyle-1 box-1">
                <div class="zerogrid">
                    <div class="row wrap-box">
                        <!--Start Box-->
                        <c:forEach var="page" items="${userfile }" begin="0" end="2">
                            <div class="col-1-3" style="float:left;">
                                <div class="wrap-col">
                                    <div class="post">
                                        <img src="images/${page.ktypeid }.jpg">
                                        <h3>
                                            <a href="showfile?id=${page.fid }" target="_blank"><span
                                                    style="color:#000000;line-height: 150%;">${page.title}</a></span>
                                        </h3>
                                        <div class="upload">
                                            <p>${page.uploadtime}</p>
                                            <p>
                                                    ${page.tags}<a
                                                    href="search_ktypeid?ktypeid=${page.ktypeid }"> ${page.ktypeid }</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- 第二行 -->
            <section class="content-box boxstyle-1 box-1">
                <div class="zerogrid">
                    <div class="row wrap-box">
                        <!--Start Box-->
                        <c:forEach var="page" items="${userfile }" begin="3" end="5">
                            <div class="col-1-3" style="float:left;">
                                <div class="wrap-col">
                                    <div class="post">
                                        <img src="images/${page.ktypeid }.jpg">
                                        <h3>
                                            <a href="showfile?id=${page.fid }" target="_blank"><span
                                                    style="color:#000000;line-height: 150%;">${page.title}</a></span>
                                        </h3>
                                        <div class="upload">
                                            <p>${page.uploadtime}</p>
                                            <p>
                                                    ${page.tags}<a
                                                    href="search_ktypeid?ktypeid=${page.ktypeid }"> ${page.ktypeid }</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>
    </section>
    <div class="containerbox">
        <div class="container">

            <div class="row">
                <div class="col-sm-9">
                    <div class="widget-box shadow-box">
                        <div class="title">
                            <h3>
                                <i class="glyphicon glyphicon-tree-conifer"></i> 知识分类
                            </h3>
                        </div>
                        <div class="stream-list p-stream">
                            <div class="col-sm-3 docTypeBox">
                                <h1>
                                    <a> 自然 <span style="color: #D9534F; font-weight: bold;"></span>
                                    </a>
                                </h1>
                                <ul>
                                    <li><a href="search_resources?m=11">生物</a></li>
                                    <li><a href="search_resources?m=12">资源</a></li>
                                    <li><a href="search_resources?m=13">环境</a></li>
                                    <li><a href="search_resources?m=14">现象</a></li>
                                    <li><a href="search_resources?m=15">天文</a></li>
                                    <li><a href="search_resources?m=16">地理</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-3 docTypeBox">
                                <h1>
                                    <a>人文 <span style="color: #D9534F; font-weight: bold;"></span>

                                    </a>
                                </h1>
                                <ul>

                                    <li><a href="search_resources?m=21">语言</a></li>
                                    <li><a href="search_resources?m=22">民族</a></li>
                                    <li><a href="search_resources?m=23">宗教</a></li>
                                    <li><a href="search_resources?m=24">国家历史</a></li>
                                    <li><a href="search_resources?m=25">文学</a></li>
                                    <li><a href="search_resources?m=26">哲学</a></li>

                                </ul>
                            </div>
                            <div class="col-sm-3 docTypeBox">
                                <h1>
                                    <a> 生活 <span style="color: #D9534F; font-weight: bold;"></span>
                                    </a>
                                </h1>
                                <ul>
                                    <li><a href="search_resources?m=31">饮食</a></li>
                                    <li><a href="search_resources?m=32">健康</a></li>
                                    <li><a href="search_resources?m=33">情感</a></li>
                                    <li><a href="search_resources?m=34">教育</a></li>
                                    <li><a href="search_resources?m=35">就业</a></li>
                                    <li><a href="search_resources?m=36">居家</a></li>

                                </ul>
                            </div>
                            <div class="col-sm-3 docTypeBox">
                                <h1>
                                    <a> 社会 <span style="color: #D9534F; font-weight: bold;"></span>
                                    </a>
                                </h1>
                                <ul>
                                    <li><a href="search_resources?m=41">法律</a></li>
                                    <li><a href="search_resources?m=42">公益</a></li>

                                </ul>
                            </div>
                            <div class="col-sm-3 docTypeBox">
                                <h1>
                                    <a> 科技 <span style="color: #D9534F; font-weight: bold;"></span>
                                    </a>
                                </h1>
                                <ul>
                                    <li><a href="search_resources?m=51">心理学</a></li>
                                    <li><a href="search_resources?m=52">数理科学和化学</a></li>
                                    <li><a href="search_resources?m=53">天文学地球科学</a></li>
                                    <li><a href="search_resources?m=54">农业</a></li>
                                    <li><a href="search_resources?m=55">工业技术</a></li>
                                    <li><a href="search_resources?m=56">医学</a></li>
                                    <li><a href="search_resources?m=57">计算机</a></li>
                                    <li><a href="search_resources?m=58">其他</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-3 docTypeBox">
                                <h1>
                                    <a> 艺术 <span style="color: #D9534F; font-weight: bold;"></span>
                                    </a>
                                </h1>
                                <ul>
                                    <li><a href="search_resources?m=61">绘画</a></li>
                                    <li><a href="search_resources?m=62">书法</a></li>
                                    <li><a href="search_resources?m=63">音乐</a></li>
                                    <li><a href="search_resources?m=64">舞蹈</a></li>
                                    <li><a href="search_resources?m=65">戏剧</a></li>
                                    <li><a href="search_resources?m=66">建筑</a></li>
                                    <li><a href="search_resources?m=67">影视</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-3 docTypeBox">
                                <h1>
                                    <a> 体育 <span style="color: #D9534F; font-weight: bold;"></span>
                                    </a>
                                </h1>
                                <ul>
                                    <li><a href="search_resources?m=71">田径</a></li>
                                    <li><a href="search_resources?m=72">球类</a></li>
                                    <li><a href="search_resources?m=73">体操</a></li>
                                    <li><a href="search_resources?m=74">棋牌</a></li>
                                    <li><a href="search_resources?m=75">武术</a></li>
                                    <li><a href="search_resources?m=76">户外</a></li>
                                    <li><a href="search_resources?m=77">电子竞技</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-3 docTypeBox">
                                <h1>
                                    <a> 政治 <span style="color: #D9534F; font-weight: bold;"></span>
                                    </a>
                                </h1>
                                <ul>
                                    <li><a href="search_resources?m=81">军事</a></li>
                                    <li><a href="search_resources?m=82">外交</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-3 docTypeBox">
                                <h1>
                                    <a> 财经 <span style="color: #D9534F; font-weight: bold;"></span>
                                    </a>
                                </h1>
                                <ul>
                                    <li><a href="search_resources?m=91">金融</a></li>
                                    <li><a href="search_resources?m=92">管理</a></li>
                                    <li><a href="search_resources?m=93">投资</a></li>
                                    <li><a href="search_resources?m=94">营销</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3 side-right hidden-xs hidden-sm">


                    <div class="widget-box">
                        <div class="title">
                            <h3>
                                <i class="glyphicon glyphicon-fire"></i> 常用目录
                            </h3>
                        </div>
                        <ul class="box-list" id="hots">
                            <c:forEach var="f" items="${directory }">
                                <li>
                                    <div class="li-out">
                                        <span class="last"> </span><span class="name"> <i
                                            class="glyphicon glyphicon-file"></i> <a
                                            href="showfile?id=${f.fid }" target="_blank">${ f.fname}</a></span>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
