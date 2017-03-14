<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.IndexshowBean" %>
<%@ page import="com.fk.bean.NewsBean" %><%--
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
                <li><a href="#"  id="index_2">电影</a></li>
                <li><a href="#" id="index_3">榜单</a></li>
                <li><a href="#"  id="index_4">热点</a></li>
            </ul>
        </div>

        <div class="user-info">
            <div class="user-avatar J-login">
                <img src="${pageContext.request.contextPath}/image/7dd82a16316ab32c8359debdb04396ef2897.png">
                <span class="caret"></span>
                <ul class="user-menu">
                    <li><a href="javascript:void%200">登录</a></li>
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
                            <li class="ranking-item ranking-top ranking-index-1">
                                <a href="http://maoyan.com/films/342858" target="_top" data-act="ticketList-movie-click"
                                   data-val="{movieid:342858}">
                                    <div class="ranking-top-left">
                                        <i class="ranking-top-icon"></i>
                                        <img class="ranking-img  default-img"
                                             src="${pageContext.request.contextPath}/image/file/816948820288778c5a44fee5abbfa93c85612.jpg@120w_80h_1e_1c">
                                    </div>
                                    <div class="ranking-top-right">
                                        <div class="ranking-top-right-main">
                                            <span class="ranking-top-moive-name">一条狗的使命</span>


                                            <p class="ranking-top-wish">
                                                <span class="stonefont">.</span>万
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-2">
                                <a href="http://maoyan.com/films/247875" target="_top" data-act="ticketList-movie-click"
                                   data-val="{movieid:247875}">
          <span class="normal-link">
            <i class="ranking-index">2</i>
            <span class="ranking-movie-name">金刚狼3：殊死一战</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>万
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-3">
                                <a href="http://maoyan.com/films/246065" target="_top" data-act="ticketList-movie-click"
                                   data-val="{movieid:246065}">
          <span class="normal-link">
            <i class="ranking-index">3</i>
            <span class="ranking-movie-name">生化危机：终章</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>万
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-4">
                                <a href="http://maoyan.com/films/346383" target="_top" data-act="ticketList-movie-click"
                                   data-val="{movieid:346383}">
          <span class="normal-link">
            <i class="ranking-index">4</i>
            <span class="ranking-movie-name">最终幻想15：王者之剑</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>万
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-5">
                                <a href="http://maoyan.com/films/344880" target="_top" data-act="ticketList-movie-click"
                                   data-val="{movieid:344880}">
          <span class="normal-link">
            <i class="ranking-index">5</i>
            <span class="ranking-movie-name">天才捕手</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>万
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-6">
                                <a href="http://maoyan.com/films/345658" target="_top" data-act="ticketList-movie-click"
                                   data-val="{movieid:345658}">
          <span class="normal-link">
            <i class="ranking-index">6</i>
            <span class="ranking-movie-name">游戏规则</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>万
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-7">
                                <a href="http://maoyan.com/films/344258" target="_top" data-act="ticketList-movie-click"
                                   data-val="{movieid:344258}">
          <span class="normal-link">
            <i class="ranking-index">7</i>
            <span class="ranking-movie-name">欢乐好声音</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>万
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-8">
                                <a href="http://maoyan.com/films/248576" target="_top" data-act="ticketList-movie-click"
                                   data-val="{movieid:248576}">
          <span class="normal-link">
            <i class="ranking-index">8</i>
            <span class="ranking-movie-name">碟仙诡谭2</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>万
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-9">
                                <a href="http://maoyan.com/films/1200675" target="_top"
                                   data-act="ticketList-movie-click" data-val="{movieid:1200675}">
          <span class="normal-link">
            <i class="ranking-index">9</i>
            <span class="ranking-movie-name">玛格丽特的春天</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>万
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-10">
                                <a href="http://maoyan.com/films/342183" target="_top" data-act="ticketList-movie-click"
                                   data-val="{movieid:342183}">
          <span class="normal-link">
            <i class="ranking-index">10</i>
            <span class="ranking-movie-name">乐高蝙蝠侠大电影</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>万
              </span>
          </span>
                                </a>
                            </li>

                        </ul>


                    </div>
                </div>
            </div>

            <div class="box-total-wrapper clearfix">
                <h3>今日大盘</h3>
                <div>
                    <p>
                        <span class="num"><span class="stonefont">.</span></span>万
                        <a class="more" target="_top" data-act="moreDayTip-click" href="http://maoyan.com/appPro">查看更多
                            <span class="panel-arrow panel-arrow-red"></span></a>
                    </p>
                    <p class="meta-info">
                        北京时间 13:20:07
                        <span class="pull-right">猫眼专业版实时票房数据</span>
                    </p>
                </div>
            </div>

            <div class="most-expect-wrapper">
                <div class="panel">
                    <div class="panel-header">
      <span class="panel-more">
        <a href="http://maoyan.com/board/6" class="textcolor_orange" data-act="all-mostExpect-click">
          <span>查看完整榜单</span>
        </a>
        <span class="panel-arrow panel-arrow-orange"></span>
      </span>
                        <span class="panel-title">
        <span class="textcolor_orange">最受期待</span>
      </span>
                    </div>
                    <div class="panel-content">
                        <ul class="ranking-wrapper ranking-mostExpect">
                            <li class="ranking-item ranking-top ranking-index-1">
                                <a href="http://maoyan.com/films/248700" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:248700}">
                                    <div class="ranking-top-left">
                                        <i class="ranking-top-icon"></i>
                                        <img class="ranking-img  default-img"
                                             src="${pageContext.request.contextPath}/image/af297f59e363ce96290dfea22f6fea0c153020.jpg@140w_194h_1e_1c">
                                    </div>
                                    <div class="ranking-top-right">
                                        <div class="ranking-top-right-main">
                                            <span class="ranking-top-moive-name">速度与激情8</span>

                                            <p class="ranking-release-time">上映时间：2017-04-14</p>

                                            <p class="ranking-top-wish">
                                                <span class="stonefont"></span>人想看
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-2">
                                <a href="http://maoyan.com/films/247658" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:247658}">
                                    <i class="ranking-index">2</i>
                                    <span class="img-link"><img class="ranking-img default-img"
                                                                src="${pageContext.request.contextPath}/image/3aa4b1025c1ac0052fde3149cb98e5b2170084.jpg@170w_118h_1e_1c"></span>
                                    <div class="name-link ranking-movie-name">美女与野兽</div>

                                    <span class="ranking-num-info"><span class="stonefont"></span>人想看</span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-3">
                                <a href="http://maoyan.com/films/249898" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:249898}">
                                    <i class="ranking-index">3</i>
                                    <span class="img-link"><img class="ranking-img default-img"
                                                                src="${pageContext.request.contextPath}/image/0ea845f1347de0a2d0c341cc1f5bb1bf1046160.jpg@170w_118h_1e_1c"></span>
                                    <div class="name-link ranking-movie-name">金刚：骷髅岛</div>

                                    <span class="ranking-num-info"><span class="stonefont"></span>人想看</span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-4">
                                <a href="http://maoyan.com/films/246012" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:246012}">
          <span class="normal-link">
            <i class="ranking-index">4</i>
            <span class="ranking-movie-name">加勒比海盗5：死无对证</span>

            <span class="ranking-num-info">
                <span class="stonefont"></span>人想看
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-5">
                                <a href="http://maoyan.com/films/343012" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:343012}">
          <span class="normal-link">
            <i class="ranking-index">5</i>
            <span class="ranking-movie-name">嫌疑人x的献身</span>

            <span class="ranking-num-info">
                <span class="stonefont"></span>人想看
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-6">
                                <a href="http://maoyan.com/films/344924" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:344924}">
          <span class="normal-link">
            <i class="ranking-index">6</i>
            <span class="ranking-movie-name">终结者2：审判日</span>

            <span class="ranking-num-info">
                <span class="stonefont"></span>人想看
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-7">
                                <a href="http://maoyan.com/films/672114" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:672114}">
          <span class="normal-link">
            <i class="ranking-index">7</i>
            <span class="ranking-movie-name">春娇救志明</span>

            <span class="ranking-num-info">
                <span class="stonefont"></span>人想看
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-8">
                                <a href="http://maoyan.com/films/345672" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:345672}">
          <span class="normal-link">
            <i class="ranking-index">8</i>
            <span class="ranking-movie-name">记忆大师</span>

            <span class="ranking-num-info">
                <span class="stonefont"></span>人想看
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-9">
                                <a href="http://maoyan.com/films/346411" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:346411}">
          <span class="normal-link">
            <i class="ranking-index">9</i>
            <span class="ranking-movie-name">守护者：世纪战元</span>

            <span class="ranking-num-info">
                <span class="stonefont"></span>人想看
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-10">
                                <a href="http://maoyan.com/films/344264" target="_top" data-act="mostExpect-movie-click"
                                   data-val="{movieid:344264}">
          <span class="normal-link">
            <i class="ranking-index">10</i>
            <span class="ranking-movie-name">战狼2</span>

            <span class="ranking-num-info">
                <span class="stonefont"></span>人想看
              </span>
          </span>
                                </a>
                            </li>

                        </ul>


                    </div>
                </div>
            </div>

            <div class="top100-wrapper">
                <div class="panel">
                    <div class="panel-header">
      <span class="panel-more">
        <a href="http://maoyan.com/board/4" class="textcolor_orange" data-act="all-TOP100-click">
          <span>查看完整榜单</span>
        </a>
        <span class="panel-arrow panel-arrow-orange"></span>
      </span>
                        <span class="panel-title">
        <span class="textcolor_orange">TOP 100</span>
      </span>
                    </div>
                    <div class="panel-content">
                        <ul class="ranking-wrapper ranking-top100">
                            <li class="ranking-item ranking-top ranking-index-1">
                                <a href="http://maoyan.com/films/1203" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:1203}">
                                    <div class="ranking-top-left">
                                        <i class="ranking-top-icon"></i>
                                        <img class="ranking-img  default-img"
                                             src="${pageContext.request.contextPath}/image/2d52f6932ca2f47871ca27801c71e4cf98763.jpg@120w_80h_1e_1c">
                                    </div>
                                    <div class="ranking-top-right">
                                        <div class="ranking-top-right-main">
                                            <span class="ranking-top-moive-name">霸王别姬</span>


                                            <p class="ranking-top-wish">
                                                <span class="stonefont">.</span>分
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-2">
                                <a href="http://maoyan.com/films/1297" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:1297}">
          <span class="normal-link">
            <i class="ranking-index">2</i>
            <span class="ranking-movie-name">肖申克的救赎</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>分
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-3">
                                <a href="http://maoyan.com/films/4055" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:4055}">
          <span class="normal-link">
            <i class="ranking-index">3</i>
            <span class="ranking-movie-name">这个杀手不太冷</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>分
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-4">
                                <a href="http://maoyan.com/films/2641" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:2641}">
          <span class="normal-link">
            <i class="ranking-index">4</i>
            <span class="ranking-movie-name">罗马假日</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>分
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-5">
                                <a href="http://maoyan.com/films/1633" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:1633}">
          <span class="normal-link">
            <i class="ranking-index">5</i>
            <span class="ranking-movie-name">阿甘正传</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>分
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-6">
                                <a href="http://maoyan.com/films/267" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:267}">
          <span class="normal-link">
            <i class="ranking-index">6</i>
            <span class="ranking-movie-name">泰坦尼克号</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>分
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-7">
                                <a href="http://maoyan.com/films/1247" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:1247}">
          <span class="normal-link">
            <i class="ranking-index">7</i>
            <span class="ranking-movie-name">教父</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>分
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-8">
                                <a href="http://maoyan.com/films/123" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:123}">
          <span class="normal-link">
            <i class="ranking-index">8</i>
            <span class="ranking-movie-name">龙猫</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>分
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-9">
                                <a href="http://maoyan.com/films/837" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:837}">
          <span class="normal-link">
            <i class="ranking-index">9</i>
            <span class="ranking-movie-name">唐伯虎点秋香</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>分
              </span>
          </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-10">
                                <a href="http://maoyan.com/films/1212" target="_top" data-act="TOP100-movie-click"
                                   data-val="{movieid:1212}">
          <span class="normal-link">
            <i class="ranking-index">10</i>
            <span class="ranking-movie-name">千与千寻</span>

            <span class="ranking-num-info">
                <span class="stonefont">.</span>分
              </span>
          </span>
                                </a>
                            </li>

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
        <a href="http://maoyan.com/films?showType=1" class="textcolor_red" data-act="all-playingMovie-click">
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
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/342858" target="_top" data-act="playingMovie-click"
                                       data-val="{movieid:342858}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/h1.jpg">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">9.</i><i
                                                            class="fraction">2</i></div>
                                                    <div class="movie-title movie-title-padding" title="一条狗的使命">一条狗的使命
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="http://www.meituan.com/dianying/342858?#content" class="active"
                                           target="_top" data-act="salePlayingMovie-click" data-val="{movieid:342858}">购
                                            票</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/247875" target="_top" data-act="playingMovie-click"
                                       data-val="{movieid:247875}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/h2.jpg">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">8.</i><i
                                                            class="fraction">8</i></div>
                                                    <div class="movie-title movie-title-padding" title="金刚狼3：殊死一战">
                                                        金刚狼3：殊死一战
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="http://www.meituan.com/dianying/247875?#content" class="active"
                                           target="_top" data-act="salePlayingMovie-click" data-val="{movieid:247875}">购
                                            票</a>
                                    </div>
                                    <div class="movie-ver"><i class="imax2d"></i></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/247658" target="_top" data-act="playingMovie-click"
                                       data-val="{movieid:247658}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/h3.jpg">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="美女与野兽">美女与野兽</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="http://www.meituan.com/dianying/247658?#content" class="active"
                                           target="_top" data-act="salePlayingMovie-click" data-val="{movieid:247658}">购
                                            票</a>
                                    </div>
                                    <div class="movie-ver"><i class="imax3d"></i></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/246065" target="_top" data-act="playingMovie-click"
                                       data-val="{movieid:246065}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/hot/f2c42c3bb14aa32726e5e6f42783a5945961833.jpeg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">8.</i><i
                                                            class="fraction">6</i></div>
                                                    <div class="movie-title movie-title-padding" title="生化危机：终章">
                                                        生化危机：终章
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="http://www.meituan.com/dianying/246065?#content" class="active"
                                           target="_top" data-act="salePlayingMovie-click" data-val="{movieid:246065}">购
                                            票</a>
                                    </div>
                                    <div class="movie-ver"><i class="m3d"></i></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/249898" target="_top" data-act="playingMovie-click"
                                       data-val="{movieid:249898}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/hot/7bba601685691f8d7c2bf07a1d5af2f6155618.jpg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="金刚：骷髅岛">金刚：骷髅岛</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="http://www.meituan.com/dianying/249898?#content" class="active"
                                           target="_top" data-act="salePlayingMovie-click" data-val="{movieid:249898}">购
                                            票</a>
                                    </div>
                                    <div class="movie-ver"><i class="imax3d"></i></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/346383" target="_top" data-act="playingMovie-click"
                                       data-val="{movieid:346383}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/hot/5be09f397d474988afaf930ac5346243715496.png@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">8.</i><i
                                                            class="fraction">0</i></div>
                                                    <div class="movie-title movie-title-padding" title="最终幻想15：王者之剑">
                                                        最终幻想15：王者之剑
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="http://www.meituan.com/dianying/346383?#content" class="active"
                                           target="_top" data-act="salePlayingMovie-click" data-val="{movieid:346383}">购
                                            票</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/344880" target="_top" data-act="playingMovie-click"
                                       data-val="{movieid:344880}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/hot/f61091a2c7dc541d472c9027ffd211856476496.jpg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">8.</i><i
                                                            class="fraction">2</i></div>
                                                    <div class="movie-title movie-title-padding" title="天才捕手">天才捕手</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="http://www.meituan.com/dianying/344880?#content" class="active"
                                           target="_top" data-act="salePlayingMovie-click" data-val="{movieid:344880}">购
                                            票</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/248576" target="_top" data-act="playingMovie-click"
                                       data-val="{movieid:248576}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/hot/b02745ed0fb3346181bc30f2c814862f526137.jpeg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">4.</i><i
                                                            class="fraction">0</i></div>
                                                    <div class="movie-title movie-title-padding" title="碟仙诡谭2">碟仙诡谭2
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-detail-strong movie-sale">
                                        <a href="http://www.meituan.com/dianying/248576?#content" class="active"
                                           target="_top" data-act="salePlayingMovie-click" data-val="{movieid:248576}">购
                                            票</a>
                                    </div>
                                    <div class="movie-ver"><i class="m3d"></i></div>
                                </div>

                            </dd>
                        </dl>


                    </div>
                </div>

                <div class="panel">
                    <div class="panel-header">
      <span class="panel-more">
        <a href="http://maoyan.com/films?showType=2" class="textcolor_blue" data-act="all-upcomingMovie-click">
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
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/455397" target="_top"
                                       data-act="upcomingMovie-click" data-val="{movieid:455397}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/coming/5674fe30c3b971e11cb07d0326a2d45e128017.jpg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="毛丰美">毛丰美</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-wish"><span class="stonefont"></span>人想看</div>
                                    <div class="movie-detail movie-detail-strong movie-presale">
                                        <a class="movie-presale-sep">预告片
                                        </a><a data-act="presaleUpcomingMovie-click" data-val="{movieid:455397}">预 售</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="movie-detail movie-rt">3月15日上映</div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/247658" target="_top"
                                       data-act="upcomingMovie-click" data-val="{movieid:247658}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/h3.jpg">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="美女与野兽">美女与野兽</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-wish"><span class="stonefont"></span>人想看</div>
                                    <div class="movie-detail movie-detail-strong movie-presale">
                                        <a class="movie-presale-sep">预告片
                                        </a><a href="http://www.meituan.com/dianying/247658?#content" class="active"
                                               target="_top" data-act="presaleUpcomingMovie-click"
                                               data-val="{movieid:247658}">预 售</a>
                                    </div>
                                    <div class="movie-ver"><i class="imax3d"></i></div>
                                </div>
                                <div class="movie-detail movie-rt">3月17日上映</div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/1200471" target="_top"
                                       data-act="upcomingMovie-click" data-val="{movieid:1200471}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/coming/cd8e2634f8b984e9fa70d1b0483bb0461008575.jpg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="通灵姐妹">通灵姐妹</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-wish"><span class="stonefont"></span>人想看</div>
                                    <div class="movie-detail movie-detail-strong movie-presale">
                                        <a class="movie-presale-sep">预告片
                                        </a><a data-act="presaleUpcomingMovie-click" data-val="{movieid:1200471}">预
                                        售</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="movie-detail movie-rt">3月17日上映</div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/368131" target="_top"
                                       data-act="upcomingMovie-click" data-val="{movieid:368131}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/coming/5df6677435174181f50583cd25ca7d182227912.jpg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="追击">追击</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-wish"><span class="stonefont"></span>人想看</div>
                                    <div class="movie-detail movie-detail-strong movie-presale">
                                        <a class="movie-presale-sep">预告片
                                        </a><a data-act="presaleUpcomingMovie-click" data-val="{movieid:368131}">预 售</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="movie-detail movie-rt">3月17日上映</div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/342177" target="_top"
                                       data-act="upcomingMovie-click" data-val="{movieid:342177}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/5.png">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="走出尘埃">走出尘埃</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-wish"><span class="stonefont"></span>人想看</div>
                                    <div class="movie-detail movie-detail-strong movie-presale">
                                        <a class="movie-presale-sep">预告片
                                        </a><a data-act="presaleUpcomingMovie-click" data-val="{movieid:342177}">预 售</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="movie-detail movie-rt">3月17日上映</div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/1201803" target="_top"
                                       data-act="upcomingMovie-click" data-val="{movieid:1201803}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/coming/e648f30ee514f656ea6c33237f13473582185.jpg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="滚出来，凶手">滚出来，凶手</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-wish"><span class="stonefont"></span>人想看</div>
                                    <div class="movie-detail movie-detail-strong movie-presale">
                                        <a class="movie-presale-sep">预告片
                                        </a><a data-act="presaleUpcomingMovie-click" data-val="{movieid:1201803}">预
                                        售</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="movie-detail movie-rt">3月17日上映</div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/344658" target="_top"
                                       data-act="upcomingMovie-click" data-val="{movieid:344658}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/7.jpg">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="唤爱">唤爱</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-wish"><span class="stonefont"></span>人想看</div>
                                    <div class="movie-detail movie-detail-strong movie-presale">
                                        <a class="movie-presale-sep">预告片
                                        </a><a data-act="presaleUpcomingMovie-click" data-val="{movieid:344658}">预 售</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="movie-detail movie-rt">3月23日上映</div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/1203286" target="_top"
                                       data-act="upcomingMovie-click" data-val="{movieid:1203286}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/8.jpg">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="二宝闯江湖">二宝闯江湖</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-detail movie-wish"><span class="stonefont"></span>人想看</div>
                                    <div class="movie-detail movie-detail-strong movie-presale">
                                        <a class="movie-presale-sep">预告片
                                        </a><a data-act="presaleUpcomingMovie-click" data-val="{movieid:1203286}">预
                                        售</a>
                                    </div>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="movie-detail movie-rt">3月23日上映</div>

                            </dd>
                        </dl>


                    </div>
                </div>

                <div class="panel">
                    <div class="panel-header">
      <span class="panel-more">
        <a href="http://maoyan.com/films?isPlay=1" class="textcolor_red" data-act="all-hotMovie-click">
          <span>全部</span>
        </a>
        <span class="panel-arrow panel-arrow-red"></span>
      </span>
                        <span class="panel-title">
        <span class="textcolor_red">热播电影</span>
      </span>
                        <span class="panel-subtitle">
        <a href="http://maoyan.com/films?isPlay=1&amp;catId=3" data-act="tag-hotMovie-click" data-val="{TagName:'爱情'}">爱情</a>
      </span> <span class="panel-subtitle">
        <a href="http://maoyan.com/films?isPlay=1&amp;catId=2" data-act="tag-hotMovie-click" data-val="{TagName:'喜剧'}">喜剧</a>
      </span> <span class="panel-subtitle">
        <a href="http://maoyan.com/films?isPlay=1&amp;catId=5" data-act="tag-hotMovie-click" data-val="{TagName:'动作'}">动作</a>
      </span> <span class="panel-subtitle">
        <a href="http://maoyan.com/films?isPlay=1&amp;catId=6" data-act="tag-hotMovie-click" data-val="{TagName:'恐怖'}">恐怖</a>
      </span> <span class="panel-subtitle">
        <a href="http://maoyan.com/films?isPlay=1&amp;catId=4" data-act="tag-hotMovie-click" data-val="{TagName:'动画'}">动画</a>
      </span></div>
                    <div class="panel-content">
                        <dl class="movie-list">
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/342858" target="_top" data-act="hotMovie-click"
                                       data-val="{movieid:342858}">
                                        <div class="movie-poster movie-poster-long">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/816948820288778c5a44fee5abbfa93c85612.jpg@350w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">9.</i><i
                                                            class="fraction">2</i></div>
                                                    <div class="movie-title movie-title-padding" title="一条狗的使命">一条狗的使命
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-ver"></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/247875" target="_top" data-act="hotMovie-click"
                                       data-val="{movieid:247875}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/h2.jpg">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">8.</i><i
                                                            class="fraction">8</i></div>
                                                    <div class="movie-title movie-title-padding" title="金刚狼3：殊死一战">
                                                        金刚狼3：殊死一战
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-ver"><i class="imax2d"></i></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/346383" target="_top" data-act="hotMovie-click"
                                       data-val="{movieid:346383}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/hot/5be09f397d474988afaf930ac5346243715496.png@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">8.</i><i
                                                            class="fraction">0</i></div>
                                                    <div class="movie-title movie-title-padding" title="最终幻想15：王者之剑">
                                                        最终幻想15：王者之剑
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-ver"></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/246065" target="_top" data-act="hotMovie-click"
                                       data-val="{movieid:246065}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/hot/f2c42c3bb14aa32726e5e6f42783a5945961833.jpeg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">8.</i><i
                                                            class="fraction">6</i></div>
                                                    <div class="movie-title movie-title-padding" title="生化危机：终章">
                                                        生化危机：终章
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-ver"><i class="m3d"></i></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/247658" target="_top" data-act="hotMovie-click"
                                       data-val="{movieid:247658}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/h3.jpg">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="美女与野兽">美女与野兽</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-ver"><i class="imax3d"></i></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/344880" target="_top" data-act="hotMovie-click"
                                       data-val="{movieid:344880}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/hot/f61091a2c7dc541d472c9027ffd211856476496.jpg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-score"><i class="integer">8.</i><i
                                                            class="fraction">2</i></div>
                                                    <div class="movie-title movie-title-padding" title="天才捕手">天才捕手</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-ver"></div>
                                </div>

                            </dd>
                            <dd>
                                <div class="movie-item">
                                    <a href="http://maoyan.com/films/249898" target="_top" data-act="hotMovie-click"
                                       data-val="{movieid:249898}">
                                        <div class="movie-poster">
                                            <img class="poster-default"
                                                 src="${pageContext.request.contextPath}/image/loading_2.e3d934bf.png">
                                            <img src="${pageContext.request.contextPath}/image/hot/7bba601685691f8d7c2bf07a1d5af2f6155618.jpg@160w_220h_1e_1c">
                                            <div class="movie-overlay movie-overlay-bg">
                                                <div class="movie-info">
                                                    <div class="movie-title" title="金刚：骷髅岛">金刚：骷髅岛</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="movie-ver"><i class="imax3d"></i></div>
                                </div>

                            </dd>
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
