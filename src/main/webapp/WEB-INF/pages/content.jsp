<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.TravelBean" %>
<%@ page import="com.fk.bean.ProvinceBean" %>
<%@ page import="com.fk.bean.ContinentBean" %>
<%@ page import="com.fk.bean.TypeBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>大学生穷游网</title>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/js/index_1.js"></script>
    <script type="text/javascript" async="" charset="utf-8"
            src="${pageContext.request.contextPath}/js/index_2.js"></script>

    <link href="${pageContext.request.contextPath}/css/index_1.css"
          rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/css/index_2.css"
          rel="stylesheet" type="text/css">

    <script language="javascript"
            src="${pageContext.request.contextPath}/js/index_3.js"
            type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/js/index_4.js"></script>
    <link href="${pageContext.request.contextPath}/css/content_list_1.css"
          rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/css/content_list_2.css"
          rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/content_list_1.js"></script>
</head>
<body style="position: relative;">
<a name="top_top"id="top_top"></a>
<div id="header">
    <div class="mfw-header">
        <div class="header-wrap clearfix">
            <div class="head-logo"><a class="mfw-logo" title="蚂蜂窝自由行" href="${pageContext.request.contextPath}"></a>
            </div>
            <ul class="head-nav" data-cs-t="headnav" id="_j_head_nav">
                <li class="head-nav-index head-nav-active" id="head_1"><a
                        href="${pageContext.request.contextPath}/index">首页</a>
                </li>
                <li class="head-nav-place" id="head_2"><a href="http://www.mafengwo.cn/mdd/"
                                                          title="目的地">目的地</a>
                </li>
                <li class="head-nav-gonglve" id="head_3"><a href="${pageContext.request.contextPath}/content_list"
                                                            title="旅游攻略">旅游攻略</a>
                </li>
                <li class="head-nav-place" id="_j_nav_sales" >
                    <a href="${pageContext.request.contextPath}/shop"
                       data-sales-nav="穷游商城">
                        <span>穷游商城<%--<i class="icon-caret-down"></i>--%></span>
                    </a>
                </li>
                <li class="head-nav-place" id="head_4"><a href="http://www.mafengwo.cn/hotel/"
                                                          title="论坛">论坛</a>
                </li>
                <li class="head-nav-place" id="_j_nav_community">
                    <a href="" title="留言薄">留言薄</a>
                </li>

            </ul>
            <div id="pagelet-block-abb1ca45f330cf8a24ad20466d690c67" class="pagelet-block">
                <div class="login-out">
                    <a id="_j_showlogin" title="登录" href="${pageContext.request.contextPath}/login"
                       rel="nofollow">登录</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/login" title="注册帐号"
                       rel="nofollow">注册</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/forget" title="找回密码"
                       rel="nofollow">找回密码</a>
                </div>
            </div>
        </div>
        <div class="shadow"></div>
    </div>
</div>


<div class="wrapper">
    <div class="gonglve_wrap clearfix">
        <div class="cont-main _j_feed_list" data-ids='["11533","8594","14497","8072","7079","3113","3071","3398","11527","7502","15628","8639","9152","14968","8855","16177","7550","4256","15217","7370","16102","3329","3011","15787","11464","7592","16270","3179","14995","10184","7388","9071","14935","16162","9515","8807","15919","10169","14611","10211","7988","7415","15496","4322","8543","9191","7403","16090","10283","3152","14728","130","9569","10178","9194","3101","11242","4271","3146","194","8801","10199","8558","7982","11923","7394","10061","7493","3341","3404","15316","11734","3209","4253","16207","7937","15145","8672","15991","3056","9491","15346","2807","10808","7118","16105","8795","3023","7529","11197","10277","16252","16282","8828","10451","8045","8570","10352","8066","8780","10571","14587","7391","14797","7100","11653","7343","14926","10154","15748","8744","15856","7082","10904","8786","11878","15340","10340","10220","7397","11365","14491","9161","7313","8576","3038","11077","7517","14929","9575","14806","10250","14794","3395","10229","15691","7571","10256","3422","7322","11650","8834","14563","10403","7097","15772","10238","7073","9221","9920","7421","7568","15379","7160","14881","9179","9131","7352","11902","3029","7811","10370","7508","15286","9917","16273","3446","15223","3065","4211","9443","15952","7076","16036","7418","10382","7088","3284","15859","10217","15031","8771","3095","15943","8597","16267","10307","10406","7541","11434","16096","9050","3002","10046","7307","3524","10031","16126","8600","3269","15607","10202","7061","15241","7142","3149","7085","14920","15823","2954","15958","3440","15403","15160","7358","14686","10289","14800","10280","9011","8798","8678","7094","9434","7973","11920","3032","10016","11710","9206","14812","11053","4277","7520","16216","10418","8603","9968","14905","8813","7442","3035","15364","9035","3323","7955","14629","4319","8048","10364","16261","7235","16219","4274","8666","7067","9053","10448","15313","11383","8636","110","7145","15550","8816","7946","7454","11590","4223","15064","16024","9479","15457","9116","15349","7526","10028","7562","11824","7559","10427","10193","9134","14803","15142","9470","9203","10313","4292","9218","8777","11185","7718","8753","9209","14530","8735","3245","10205","7382","11095","3083","9086","11308","14593","2981","11680","10391","11845","8591","15961","9437","9494","16075","7499","8507","3110","16153","15469","9527","15175","4268","10586","3074","14971","7121","7511","15832","7991","15604","10019","10439","9104","10349","9155","7901","10166","14581","7451","2780","10322","10442","8282","210","14536","7400","10160","8819","4247","4220","3020","14917","7847","7334","15361","7436","15670","10436","15946","8525","2819","15805","8084","14887","15646","11881","15370","10181","10334","7460","11728","7823","10022","7091","7565","7535","15802","8027","8579","7373","10385","11677","15964","7070","9002","7538","16240","8849","10262","8783","9170","9464","15598","10196","11317","8681","11377","15595","10172","7406","15865","2933","7139","8759","9449","15676","15814","7490","3053","11686","15154","10346","11515","3041","7166","9098","3062","14860","3080","9176","15532","14503","9188","16186","8273","11302","7457","9539","8792","9197","3623","11644","10295","11518","10148","9536","7940","7595","11419","11407","9032","3227","14569","11314","7133","7103","10430","11818","10151","14824","7409","15796","14710","15841","8606","15079","10358","7556","10268","15877","15967","8264","7412","4289","8276","11305","10463","3371","11281","11764","7598","4259","10457","3212","9509","3830","16156","3344","16051","7739","10037","15688","7148","7808","14956","9473","10043","8618","14680","7379","7523","10157","11380","10316","7574","7880","8633","3428","8747","8267","3050","10052","10388","14560","15373","8096","14620","15853","8741","10394","10253","14890","10655","4232","4262","7229","10223","16234","15418","7340","15103","9125","4265","10265","14524","9476","10241","10445","8537","3248","7337","3059","15406","15466","7130","10367","7430","16042","14665","11266","10304","11542","16084","7829","11356","15388","11614","10424","8585","14746","3077","11752","10247","11215","10331","10871","8609","10328","7544","10298","9062","7532","15265","15655","8825","11896","15436","15895","9467","7895","8588","10433","4217","4316","10208","15424","9548","11860","2831","15283","16117","7934","8567","11012","8846","15652","10361","7385","15808","11449","7376","16258","15169","11035","14584","10232","10187","9182","8774","11218","15391","15091","9158","15649","15706","8837","11413","15715","10319","7979","7997","10379","3014","11626","7328","10235","15781","2978","10460","15181","10400","15178","14614","8522","10397","15166","16030","11620","9554","8768","10226","14521","3287","3257","11140","10415","15982","16132","9608","2957","7187","15337","14950","10163","16087","15988","8822","15070","8840","3008","8669","7151","9452","3221","16129","7106","7184","9173","7496","3191","11692","9110","9542","3047","2960","7841","11602","8660","9503","8630","9488","8546","8573","15463","10190","16159","7553","15196","8093","2999","10127","16015","15778","11551","11638","7547","8765","15205","14818","14878","7679","10337","11428","7154","14659","9200","10214","3305","7994","16147","9149","15592","10355","9167","15415","10175","7589","11350","10259","14866","14500","15334","8831","8279","8804","15124","7886","3833","11593","7367","10244","9065","8756","2993","9923","15679","7349","11731","14767","16135","3425","15307","7967","7325","10310","11260","3128","15760","15643","15235","15271","16033","7433","15277","7112","10412","11392","14938","14527","3278","15838","7778","9128","16123","7931","15133","10325","15448","14596","16174","15226","7682","15775","11368","16189","15367","9497","16228","8843","8789","15058","15331","15625","10025","10286","11683","11689","7958","15238","3068","14518","16120","15061","15202","15421","10646","15784","16138","16150","14662","10373","16057","14557","15397","8810","16063","10034","3293","16222","14944","15898","11776","14590","15985","7859","16201","14779","11794","7505","14854","4238","15229","16165","11656","15751","7850","15088","10376","7487","15880","10292","10652","9485","15148","9461","7892","15874","15172","16078","16255","14764","15922","16093","11440","16009","11596","15295","9185","9566","11452","7760","10343","16069","11554","15199","14683","15073","10271","14908","15754","16039","7181","11584","15151","16054","15121","14731","11386","11359","7331","15820","15745","11884","11431","11347","15709","7616","15127","15871","10454","14761","14689","14788","14533","15790","15907","11422","10274","16198","14743","11854","3044","15700","16195","11635","11815","15811","11659","15616","15682","15976","16231","15757","11539","11632","15310","3230","15268","15658","14539","16171","15847","15868","15901","15955","14845","15940","14896","11785","15439","15949","15427","7961","15727","11935","16249","11746","15889","14653","14644","15703","16168","10409","16018","15631","15850","16060","15637","14656","15892","15829","11917","15301","11761","15613","11563","11641","14785","14977","14965","15481","14617","15661","16027","16225","11797","15280","16264","14512","15394","16081","15304","15262","14599","15232","11866","15139","14695","11770","11782","16072","15610","14509","14542","11536","15343","15289","11806","11719","11296","16111","11812","14962","11605","11015","11341","11353","11506"]' >
            <div class="hd clearfix">
                <h3>推荐攻略</h3>
            </div>
            <div class="gl-post">
                <div data-cs-t="gonglve_feed" class="_j_feed_data" data-feed=[{"fid":"11533","type":"3"},{"fid":"8594","type":"2"},{"fid":"14497","type":"3"},{"fid":"8072","type":"5"},{"fid":"7079","type":"9"},{"fid":"3113","type":"6"},{"fid":"3071","type":"2"},{"fid":"3398","type":"6"},{"fid":"11527","type":"3"},{"fid":"7502","type":"2"}]>

                    <%
                        List<TravelBean> travel = (List) request.getAttribute("travel");
                        for(int i=0;i<travel.size();i++){
                    %>

                    <%--<div class="feed-item _j_feed_item">
                        <a href="https://www.mafengwo.cn/localdeals/mdd_topic_1019/?cid=1010616" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num">1064</span> 穷游客赞<i class="icon-cart"></i></span>
                            </div>
                            <div class="title">
                                去厦门前必看，教你吃喝玩乐如何不走弯路（附上岛信息、店铺...
                            </div>
                            <div class="txt">
                                <div class="info">旅行中总是不免有一些坑，作为一个在厦门生活了10年，除了寻找、考察和甄别这里的吃、喝、玩、住、行，其它什么也没干的人，希望帮大家合理避开这些坑~</div>

                            </div>
                            <div class="imgs">
                                <ul class="clearfix">
                                    <li><img src="http://c2-q.mafengwo.net/s9/M00/46/99/wKgBs1hE6-aAenSRAAoFR4-F5g406.jpeg?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li><img src="http://c1-q.mafengwo.net/s8/M00/03/97/wKgBpVWrLhKAA2t4ABOrkyrIN1w20.jpeg?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li><img src="http://n1-q.mafengwo.net/s9/M00/48/2C/wKgBs1hE7H-ADGpQAAxlcI3Pk_A77.jpeg?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li class="ext-r">101118浏览</li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div class="hr"></div>--%>

                    <div class="feed-item _j_feed_item">
                        <a href="${pageContext.request.contextPath}/article?id=<%=travel.get(i).getId()%>">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num"><%=travel.get(i).getCount()%></span> 穷游客赞<i class="icon-hand"></i></span>
                            </div>
                            <div class="title">
                                <%=travel.get(i).getTitle()%>
                            </div>
                            <dl class="art clearfix">
                                <dt>
                                    <img src="<%=travel.get(i).getImage()%>" width="220" height="150">
                                </dt>
                                <dd>
                                    <div class="info">
                                        <%=travel.get(i).getSummary()%>
                                    </div>
                                    <%
                                        String[] ty = travel.get(i).getType().split("\\|");
                                        for(int j=0;j<ty.length;j++){
                                    %>
                                    <span class="art-tag"><%=ty[j]%></span>
                                    <% } %>
                                    <div class="ext-r"><span class="nums"><%=travel.get(i).getLookcount()%>浏览</span></div>
                                </dd>
                            </dl>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <% } %>
                    <div class="m-pagination" id="_j_tn_pagination" data-type="0" data-objid="0" align="right">
                        <span class="count">共${page}页 / ${count}条</span>
                        <%
                            Integer pageAll = (Integer)request.getAttribute("page");
                            Integer pageNow = (Integer)request.getAttribute("pageNow");

                            for(int i=1;i<= pageAll.intValue() - pageNow.intValue() + 1;i++){
                                if(i == pageNow.intValue()){
                        %>
                        <span class="pg-current"><%=i %></span>
                        <%
                        }else{
                        %>
                        <a class="pi _j_pageitem" href="${pageContext.request.contextPath}/content_list?page=<%=i%>"><%=i %></a>
                        <%
                                }
                            }
                        %>
                        <a class="pg-next _j_pageitem" href="${pageContext.request.contextPath}/content_list?page=${pageNow+1}">下一页 &gt;&gt;</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="sidebar">
            <div class="side-hd">穷游游攻略导航</div>
            <div class="nav-drop">
                <div class="drop-item">
                    <div class="trigger"><i></i>国内</div>
                    <div class="drop-pop">
                        <div class="inner">
                            <ul>
                                <%
                                    List<ProvinceBean> list = (List) request.getAttribute("province");
                                    List<ContinentBean> list1 = (List) request.getAttribute("continent");
                                    List<TypeBean> type = (List) request.getAttribute("type");
                                    for (int i = 0; i <list.size(); i++) {
                                %>
                                <li><a href="/search"><%=list.get(i).getProvince()%>(<%=list.get(i).getCount()%>)</a></li>
                                <% }%>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="drop-item">
                    <div class="trigger"><i></i>国外</div>
                    <div class="drop-pop">
                        <div class="inner">
                            <ul>
                                <%
                                    for (int i = 0; i <list1.size(); i++) {
                                %>
                                <li><a href="/search"><%=list1.get(i).getContinent()%>(<%=list1.get(i).getCount()%>)</a></li>

                                <% } %>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="drop-item">
                    <div class="trigger"><i></i>主题</div>
                    <div class="drop-pop">
                        <div class="inner">
                            <ul>
                                <%
                                    for (int i = 0; i <type.size(); i++) {
                                %>
                                <li><a href="/search"><%=type.get(i).getType()%>(<%=type.get(i).getCount()%>)</a></li>
                               <%}%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rank">
                <ul>
                    <li class="gl_list">
                        <a href="/gonglve/mdd-11047.html" title="普吉岛" target="_blank">
                            <img src="http://c3-q.mafengwo.net/s8/M00/EB/98/wKgBpVWRB9WANAydAA7GxP1ONjg27.jpeg?imageMogr2%2Fthumbnail%2F%21130x184r%2Fgravity%2FCenter%2Fcrop%2F%21130x184%2Fquality%2F90" alt="普吉岛">
                        </a>
                        <p class="time">更新日期:2015-06-29</p>
                        <div class="down_cout">
                            <span></span>
                            <p>3101458人下载</p>
                        </div>
                    </li>
                    <li>
                        <span class="num">2</span>
                        <a href="/gonglve/mdd-10183.html" title="日本" target="_blank">日本</a>
                    </li>
                    <li>
                        <span class="num">3</span>
                        <a href="/gonglve/mdd-10083.html" title="泰国" target="_blank">泰国</a>
                    </li>
                    <li>
                        <span class="num">4</span>
                        <a href="/gonglve/mdd-11042.html" title="京都" target="_blank">京都</a>
                    </li>
                    <li>
                        <span class="num">5</span>
                        <a href="/gonglve/mdd-10035.html" title="成都" target="_blank">成都</a>
                    </li>
                    <li>
                        <span class="num">6</span>
                        <a href="/gonglve/mdd-10222.html" title="东京" target="_blank">东京</a>
                    </li>
                    <li>
                        <span class="num">7</span>
                        <a href="/gonglve/mdd-10765.html" title="大阪" target="_blank">大阪</a>
                    </li>
                    <li>
                        <span class="num">8</span>
                        <a href="/gonglve/mdd-10132.html" title="厦门" target="_blank">厦门</a>
                    </li>
                    <li>
                        <span class="num">9</span>
                        <a href="/gonglve/mdd-11045.html" title="曼谷" target="_blank">曼谷</a>
                    </li>
                    <li>
                        <span class="num">10</span>
                        <a href="/gonglve/mdd-10487.html" title="大理" target="_blank">大理</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>

    </div>
</div>
<script language="javascript" type="text/javascript">
    $(function () {
        //攻略分类
        $('.drop-item').find('.trigger').click(function(){
            $(this).closest('.drop-item').toggleClass('drop-open').siblings('.drop-item').removeClass('drop-open');
        });
        //ie placeholder 兼容
        var doc=document,inputs=doc.getElementsByTagName('input'),supportPlaceholder='placeholder'in doc.createElement('input'),placeholder=function(input){
            var text=input.getAttribute('placeholder'),defaultValue=input.defaultValue;
            if(defaultValue==''){
                input.value=text
            }input.onfocus=function(){
                if(input.value===text){
                    this.value=''}
            };
            input.onblur=function(){
                if(input.value===''){
                    this.value=text
                }
            }
        };

        if(!supportPlaceholder){
            for(var i=0,len=inputs.length;i<len;i++){
                var input=inputs[i],text=input.getAttribute('placeholder');
                if(input.type==='text'&&text){
                    placeholder(input)
                }
            }
        }


        M.closure(function(require) {
            //搜索suggest
            var Suggestion = require('Suggestion')
            var SuggestionHandle = new Suggestion({
                'keyParamName': 'keyword',
                'url': '/gonglve/ajax_book_search.php?act=search',
                'input': $('#search_word'),
                'listContainer': $('#search_result'),
                'listFirstItemHover': true,
                'listItemSelector' : '.sr-item',
                'handleSuggest': function(res) {
                    var html = '';
                    if(res.ret==1 && res.msg && res.msg.length){
                        var keyword = $('#search_word').val();
                        this.listContainer.removeClass('no_gl').addClass('search_resu');
                        html = '<ul data-cs-t="攻略搜索" data-cs-p="p">';
                        for(var i in res.msg){
                            var item = res.msg[i];
                            item.value = item.value.replace(keyword,'<b class="highlight">'+keyword+'</b>');
                            html += '<li><em><a href="/gonglve/'+item.type+'-'+item.id+'.html" style="color: #666" >'+item.value+'</a></em></li>'; //data-cs-l="/gonglve/'+item.type+'-'+item.id+'.html"
                        }
                        html += '<div class="clear"></div></ul>';

                    } else {
                        this.listContainer.addClass('no_gl').removeClass('search_resu');
                        html = '<strong>此攻略还没有上线，敬请期待</strong>';
                    }
                    return html;
                }
            });

            //banner滚动
            var Slider = require('Slider');
            var scrollTime = 500,
                stopTime = 3000,
                focus = false,
                topPicSlideCnt = $('#slide_box'),
                btnCnt = $('#thumb_box'),
                slideList = topPicSlideCnt.children('li'),
                listLength = slideList.length;

            var topPicSlider = new Slider({
                'slideCnt': topPicSlideCnt,
                'slideList': slideList,
                'slideTime': scrollTime,
                'indexer': btnCnt.children('li')
            });
            topPicSlideCnt.add(btnCnt)
                .bind('mouseenter', function() { focus = true; })
                .bind('mouseleave', function() { focus = false; })
                .bind('mouseover', function() { focus = true; });

            //自动播放
            setInterval(function() {
                if(!focus && M.windowFocused) {
                    if(topPicSlider.index < listLength) {
                        topPicSlider.toIndex(topPicSlider.index + 1);
                    } else {
                        topPicSlider.toIndex(1);
                    }
                }
            }, stopTime);

            //目的地菜单效果
            require('jq-menuAim');
            $('.gonglve-nav').menuAim({
                rowSelector: ' .nav-item',
                tolerance: 350,
                activate: function(row) {
                    $(row).addClass('hover');
                },
                deactivate: function(row) {
                    $(row).removeClass('hover');
                }
            });

            // add log && feed more
            var $gHeight = $('#slide_box').height() + $('.gonglve_wrap').height() + 60 - 550,
                firstAdd = true,
                $glpost = $('.gl-post'),
                readFid = [],
                clickFid = [],
                feedArray = $('._j_feed_data').eq(0).data('feed'),
                wHeight = $(window).height(),
                ids = $('._j_feed_list').data('ids'),
                rendTime;

            feedPosition();

            $(window).scroll(function() {
                // log
                if(rendTime){
                    clearInterval(rendTime);
                }
                var sTop = $(this).scrollTop();
                rendTime = setTimeout(function(){
                    getFidBySTop(sTop);
                },100);

                // more
                if(firstAdd && sTop >= $gHeight){
                    firstAdd = false;
                    addMore(true);
                }
            });

            // log
            $('._j_feed_list').delegate('._j_feed_item','click',function(ev){
                var fid = Number($(ev.currentTarget).data('fid')),
                    type = $(ev.currentTarget).data('type');
                if(fid){
                    if($.inArray(fid,readFid) === -1){
                        readFid.push(fid);
                        commitNewReadFid(fid,type,0);
                    }
                    if($.inArray(fid,clickFid) === -1){
                        clickFid.push(fid);
                        commitNewReadFid(fid,type,1);
                    }
                }
            });

            // more
            $glpost.delegate('._j_page_loader','click',function(){
                addMore(false);
            });

            function addMore(first){
                var $this=$('._j_page_loader');
                if (!$this.data('loading')) {
                    $this.addClass('loader');
                    $this.data('loading', 1).text('加载中. . .');
                    if(first){
                        setTimeout(function(){
                            ajaxMore($this);
                        },500);
                    }else{
                        ajaxMore($this);
                    }
                }
            }

            function ajaxMore($this){
                var page = $this.data('page');
                $.post('/gonglve/', {
                    'page': page,
                    'ids':ids
                }, function (ret) {
                    $this.removeClass('loader');
                    $this.remove();
                    $glpost.append('<div class="_j_add_chat" style="position: absolute;visibility: hidden;z-index: -1;">'+ret+'</div>');
                    var addFeedData = $('._j_feed_data').eq(page).data('feed');
                    if(addFeedData)
                        feedArray = feedArray.concat(addFeedData);
                    if(feedPosition()){
                        $('._j_add_chat').remove();
                        $glpost.append(ret);
                    }
                });
            }

            function feedPosition(){
                for(var i = 0; i < feedArray.length; i++){
                    feedArray[i]['height'] = $('._j_feed_item').eq(i).height() + 20;
                    feedArray[i]['top'] = $('._j_feed_item').eq(i).offset().top;
                }
                return true;
            }

            function getFidBySTop(sTop){
                wHeight = $(window).height();
                var fid,type;
                for(var i = 0; i < feedArray.length; i++){
                    var height = feedArray[i].height,
                        top = feedArray[i].top;
                    if((wHeight + sTop) > (height + top) &&  sTop < top){
                        fid = Number(feedArray[i].fid);
                        type = feedArray[i].type;
                        if(fid && $.inArray(fid,readFid) === -1){
                            readFid.push(fid);
                            commitNewReadFid(fid,type,0);
                        }
                    }
                }
            }

            function commitNewReadFid(fid,type,handleType){
                mfwPageEvent('mdd','gonglve_feed_show',{
                    'fid':fid,
                    'type':type,
                    'handle_type':handleType
                });
            }
        });

    });
</script>
<link href="${pageContext.request.contextPath}/css/content_list_3.css" rel="stylesheet" type="text/css"/>

<div id="footer">
    <div class="ft-content">

        <div class="ft-copyright">
            <a href="${pageContext.request.contextPath}"><i class="ft-mfw-logo"></i></a>
            <p>© 2017 Mafengwo.cn <a href="${pageContext.request.contextPath}" target="_blank"
                                     rel="nofollow">京ICP备******号</a> 京公网安备*******号 <a
                    href="${pageContext.request.contextPath}" target="_blank"
                    rel="nofollow">京ICP证*****号</a></p>
            <p><a href="${pageContext.request.contextPath}" target="_blank" rel="nofollow">营业执照</a>
                *********  客服电话：<span class="highlight">*******</span>
            </p>
        </div>
    </div>
</div>


<link href="${pageContext.request.contextPath}/css/content_3.css" rel="stylesheet" type="text/css"/>

<div class="mfw-toolbar" style="display: block;position: fixed;">
    <div class="toolbar-item-top" style="display: block;">
        <a href="#top_top" class="btn _j_gotop">
            <i class="icon_top"></i>
            <em>返回顶部</em>
        </a>
    </div>
    <div class="toolbar-item-feedback">
        <a role="button" data-japp="feedback" class="btn">
            <i class="icon_feedback"></i>
            <em>意见反馈</em>
        </a>
    </div>
</div>


<script language="javascript" type="text/javascript">
    if (typeof M !== "undefined" && typeof M.loadResource === "function") {
        M.loadResource("${pageContext.request.contextPath}/js/content_2.js");
    }
</script>

<script>
    var state = ${index};
    if (state == 1) {
        document.getElementById('head_1').className = 'head-nav-index head-nav-active';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 2) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place head-nav-active';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 3) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve head-nav-active';
        document.getElementById('_j_nav_sales').className = 'head-nav-place';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 4) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place head-nav-active';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 5) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel head-nav-active';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 6) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place head-nav-active';
    }
</script>
</body>
</html>