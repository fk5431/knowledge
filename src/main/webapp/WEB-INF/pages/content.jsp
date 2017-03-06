<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.TravelBean" %>
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
                    <a href="http://www.mafengwo.cn/sales/"
                       data-sales-nav="自由行商城">
                        <span>自由行商城<%--<i class="icon-caret-down"></i>--%></span>
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

                    <div class="feed-item _j_feed_item" data-fid="11533" data-type="3" data-cs-p="位置_1">
                        <a href="https://www.mafengwo.cn/localdeals/mdd_topic_1019/?cid=1010616" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num">1064</span> 穷游客体验过<i class="icon-cart"></i></span>
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
                    <div class="hr"></div>

                    <div class="feed-item _j_feed_item" data-fid="8594" data-type="2" data-cs-p="位置_2">
                        <a href="http://www.mafengwo.cn/wenda/detail-6917494.html" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num">1933</span> 蜂蜂赞<i class="icon-hand"></i></span>
                                <span class="type"><i class="icon-wenda"></i>来自 <strong>问答</strong></span>
                            </div>
                            <div class="title">
                                有哪些美食相关的日本电影或电视剧推荐？
                            </div>
                            <dl class="art clearfix">
                                <dt>
                                    <img src="http://n1-s.mafengwo.net/c_lfill,w_220,h_150,q_100/s9/M00/94/ED/wKgBs1eXLLOATbHiAAeiTcmlNf8000.png">
                                </dt>
                                <dd>
                                    <div class="info">
                                        故事发生在一个新宿红灯区附近的一家只在深夜营业的小餐馆中，这里的菜单只有猪肉味增汤套餐一种，但是老板可以根据客人的要求利用现有食材做出各种料理，午夜12点，报时钟响起，城市的一隅，伴随着剧中好听的背景音乐与旁白，属于一家食堂的时间开始了。
                                    </div>
                                    <span class="art-tag">电视剧</span>
                                    <span class="art-tag">电影</span>
                                    <span class="art-tag">美食</span>
                                    <span class="art-tag">日本</span>
                                    <div class="ext-r"><span class="nums">101677浏览，79回答</span></div>
                                </dd>
                            </dl>
                        </a>
                    </div>
                    <div class="hr"></div>


                    <div class="feed-item _j_feed_item" data-fid="14497" data-type="3" data-cs-p="位置_3">
                        <a href="https://www.mafengwo.cn/localdeals/mdd_topic_1400/?cid=1010616" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num">64</span> 蜂蜂体验过<i class="icon-cart"></i></span>
                                <span class="type"><i class="icon-sales"></i>来自 <strong>自由行攻略</strong></span>
                            </div>
                            <div class="title">
                                去日本买买买的另一种打开方式——日本中古店购物攻略
                            </div>
                            <div class="txt">
                                <div class="info">去日本买买买的时候你是不是只知道品牌专卖店和药妆店，还有一个地方是时尚达人和真正了解日本购物文化的人一定会去淘宝的，那就是&quot;中古店&quot;。在日本有个神奇的文化就是中古，在日语里是“二手”的意思，各大购物中心都坐落着大大小小无数个性鲜明的古着店家。名牌商品的限定版、独立设计师的得意之作、奢饰品牌的经典款...</div>





                            </div>
                            <div class="imgs">
                                <ul class="clearfix">
                                    <li><img src="http://c1-q.mafengwo.net/s9/M00/79/11/wKgBs1hXuaeAGBRrAAE6k3Bb0z892.jpeg?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li><img src="http://c2-q.mafengwo.net/s9/M00/4B/54/wKgBs1hSdlSAC-pIAAi_8pYHuFY020.png?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li><img src="http://n1-q.mafengwo.net/s9/M00/4D/0E/wKgBs1hSdyaACMwAAAkF0IuhEsQ332.png?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li class="ext-r">35374浏览</li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <div class="feed-item _j_feed_item" data-fid="8072" data-type="5" data-cs-p="位置_4">
                        <a href="http://www.mafengwo.cn/weixin/article-285.html" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num">378</span> 蜂蜂喜欢<i class="icon-hand"></i></span>
                                <span class="type"><i class="icon-notes"></i>来自 <strong>官方账号</strong></span>
                            </div>
                            <div class="title">
                                再不去就来不及了！那些即将消失的全球7大美景&gt;&gt;&gt;
                            </div>
                            <div class="txt">
                                <div class="info">因为军变、天灾人祸、历史等原因，很多令人震惊的景点已经消失或者正在逐渐消失，让爱旅游的人痛心疾首，趁现在还来得及，赶紧去“朝圣”吧！</div>





                            </div>
                            <div class="imgs">
                                <ul class="clearfix">
                                    <li><img src="http://n4-q.mafengwo.net/s8/M00/89/4B/wKgBpVVtbxiAeUGYAAlTHfp1vxk997.png?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li><img src="http://a4-q.mafengwo.net/s5/M00/C2/C5/wKgB20_833PLOoqcAAHyHGMGXac41.jpeg?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li><img src="http://a1-q.mafengwo.net/s8/M00/A5/7E/wKgBpVXVap-ATepyABf-7OWgFcY53.jpeg?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li class="ext-r">50046浏览</li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <div class="feed-item _j_feed_item" data-fid="7079" data-type="9" data-cs-p="位置_5">
                        <a href="http://www.mafengwo.cn/traveller/article.php?id=966" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num">15360</span> 蜂蜂阅读<i class="icon-hand"></i></span>
                                <span class="type"><i class="icon-line"></i>来自 <strong>官方账号</strong></span>
                            </div>
                            <div class="title">
                                台北：买不完的书店
                            </div>
                            <dl class="art clearfix">
                                <dt>
                                    <img src="http://c2-q.mafengwo.net/s9/M00/41/AF/wKgBs1dGbRCAeBRuAASJ9u523pk81.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100" style="width: 220px;">
                                </dt>
                                <dd>
                                    <div class="info">那些天里，我们逛各类书店，预期的书差不多都没买到。因为我们和朋友们想找的书，大多都是很早以前出版的了，但计划外的书倒是买了不少。和在其他城市一样，我们最后一天的行程是去邮局寄书。一大箱书寄下来，比我们预料的邮费更便宜，心里暗暗后悔，早知道就买更多的书了，也因此给了自己一个理由，下次为了买书，还要...</div>
                                    <span class="art-tag">旅行家专栏</span>
                                    <div class="ext-r">
                                        <span class="author"><img src="https://b3-q.mafengwo.net/s7/M00/F5/53/wKgB6lPGJf6AYr1xAAB1vwJNrZo32.jpeg?imageMogr2%2Fthumbnail%2F%2120x20r%2Fgravity%2FCenter%2Fcrop%2F%2120x20%2Fquality%2F100">西门媚</span>
                                        <span class="nums">2评论</span>
                                    </div>
                                </dd>
                            </dl>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <div class="feed-item _j_feed_item" data-fid="3113" data-type="6" data-cs-p="位置_6">
                        <a href="http://www.mafengwo.cn/mdd/route/10083_261.html" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><em>29%</em> 蜂蜂会选择这条线路</span>
                                <span class="type"><i class="icon-line"></i>来自 <strong>目的地专家</strong></span>
                            </div>
                            <div class="title">
                                曼谷芭提雅7日玩法
                            </div>

                            <dl class="art clearfix">
                                <dt>
                                    <img src="http://n2-q.mafengwo.net/s9/M00/99/32/wKgBs1dNMyGAG7obAABxtYmW4Yw155.png?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100" style="width: 220px;">
                                </dt>
                                <dd>
                                    <div class="info txt-line">
                                        集中时间和精力游玩曼谷、芭提雅最热门的景点及商圈，让本次旅行在美景、美食、购物、娱乐上得到全方位满足。
                                        <br>















                                        曼谷
                                        <span class="arrow"></span>
                                        芭提雅

                                    </div>
                                    <span class="art-tag">最佳季节：11月-次年3月</span>
                                    <div class="ext-r"><span class="nums">173502浏览，56评论</span></div>
                                </dd>
                            </dl>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <div class="feed-item _j_feed_item" data-fid="3071" data-type="2" data-cs-p="位置_7">
                        <a href="http://www.mafengwo.cn/wenda/detail-6750460.html" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num">1529</span> 蜂蜂赞<i class="icon-hand"></i></span>
                                <span class="type"><i class="icon-wenda"></i>来自 <strong>问答</strong></span>
                            </div>
                            <div class="title">
                                【纯干货】上海迪士尼乐园怎么玩儿？
                            </div>
                            <dl class="art clearfix">
                                <dt>
                                    <img src="http://a2-q.mafengwo.net/s9/M00/13/A3/wKgBs1d0wEWAalj6AAuUsDHbOOE541.png?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100">
                                </dt>
                                <dd>
                                    <div class="info">
                                        1--关于试运营期间是否所有场馆/项目/秀/花车开放？
                                        试运营期间是11：30am-20:00pm。门票是可以一天之内多次出入的，需刷购买者的身份证。

                                        六大主题区明日世界、奇想花园、米奇大街、梦幻世界、宝藏湾、探险岛都已开放（不用担心到时找不到路，我也是个路盲，入园后在入口处先领一张地图，各个主题区之间并没有明显...
                                    </div>
                                    <span class="art-tag">迪士尼</span>
                                    <span class="art-tag">当地体验</span>
                                    <span class="art-tag">上海</span>
                                    <span class="art-tag">上海必问TOP10</span>
                                    <div class="ext-r"><span class="nums">128175浏览，61回答</span></div>
                                </dd>
                            </dl>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <div class="feed-item _j_feed_item" data-fid="3398" data-type="6" data-cs-p="位置_8">
                        <a href="http://www.mafengwo.cn/mdd/cityroute/154447_48.html" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><em>56%</em> 蜂蜂会选择这条线路</span>
                                <span class="type"><i class="icon-line"></i>来自 <strong>目的地专家</strong></span>
                            </div>
                            <div class="title">
                                大峡谷南缘经典1日玩法
                            </div>

                            <dl class="art clearfix">
                                <dt>
                                    <img src="http://b4-q.mafengwo.net/s9/M00/90/4C/wKgBs1bnx36AdpamAACXbis5tNk083.png?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100" style="width: 220px;">
                                </dt>
                                <dd>
                                    <div class="info txt-line">
                                        大峡谷南缘是来到大峡谷最经典的旅行地，走隐士之路和沙漠景观路两个线路便可用1天游览图萨扬遗址、利帕观景台、沙漠瞭望塔等知名景点。
                                        <br>















                                        隐士之路沿线
                                        <span class="arrow"></span>
                                        沙漠观景路

                                    </div>
                                    <span class="art-tag">最佳季节：夏季和秋季</span>
                                    <div class="ext-r"><span class="nums">16053浏览</span></div>
                                </dd>
                            </dl>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <div class="feed-item _j_feed_item" data-fid="11527" data-type="3" data-cs-p="位置_9">
                        <a href="https://www.mafengwo.cn/localdeals/mdd_topic_1016/?cid=1010616" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num">209</span> 蜂蜂体验过<i class="icon-cart"></i></span>
                                <span class="type"><i class="icon-sales"></i>来自 <strong>自由行攻略</strong></span>
                            </div>
                            <div class="title">
                                穿街走巷，寻找厦门地道美食，寻找心中的老味道（附好评餐厅...
                            </div>
                            <div class="txt">
                                <div class="info">除了游客好奇厦门到底有什么好吃的，本地人也想知道祖辈口中的老味道到底是什么。网上最不缺的「厦门攻略」就是关于美食的，而上千个版本的“必吃推荐”大多只是作者个人偏好的叠加，极少站在旅行者的角度去给出合理的引导。这篇攻略专为这样的你准备，告诉你什么必吃，什么要慎重选吃，让吃货不虚此行，甚至带朋友去也...</div>





                            </div>
                            <div class="imgs">
                                <ul class="clearfix">
                                    <li><img src="http://a1-q.mafengwo.net/s9/M00/D2/A5/wKgBs1f-9EeASnP8ACc9D5Y5-_o804.gif?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li><img src="http://b2-q.mafengwo.net/s9/M00/70/7B/wKgBs1hE9juAHfC6ABbqBn-Q5rQ636.png?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li><img src="http://b2-q.mafengwo.net/s9/M00/70/9C/wKgBs1hE9kyABujeABXfsxwoy7M239.png?imageMogr2%2Fthumbnail%2F%21220x130r%2Fgravity%2FCenter%2Fcrop%2F%21220x130%2Fquality%2F100"></li>
                                    <li class="ext-r">35517浏览</li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <div class="feed-item _j_feed_item" data-fid="7502" data-type="2" data-cs-p="位置_10">
                        <a href="http://www.mafengwo.cn/wenda/detail-6662389.html" target="_blank">
                            <div class="bar clearfix">
                                <span class="stat"><span class="num">2574</span> 蜂蜂赞<i class="icon-hand"></i></span>
                                <span class="type"><i class="icon-wenda"></i>来自 <strong>问答</strong></span>
                            </div>
                            <div class="title">
                                旅途中有没有那么一首歌，陪你翻山又过河？
                            </div>
                            <dl class="art clearfix">
                                <dt>
                                    <img src="http://c2-q.mafengwo.net/s9/M00/07/BE/wKgBs1d0r16AWBxSAADv7WVBPKs80.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100">
                                </dt>
                                <dd>
                                    <div class="info">
                                        在我的旅行中，有一个人的，也有三两好友一起出行的，当然更多的是两个人的旅程，其实旅途中，大约还是一个人的时候出现单曲循环听音乐的情况居多。我也是一个会在一段时间内单曲循环N次同一首歌的人，有时候是因为歌确实好听，可有时候却是因为这首歌完全符合了自己当时的心情。所以说，在旅行这样一个最容易激发自己各...
                                    </div>
                                    <span class="art-tag">实用指南</span>
                                    <div class="ext-r"><span class="nums">165600浏览，692回答</span></div>
                                </dd>
                            </dl>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <a rel="nofollow" data-page="1" class="_j_page_loader" data-cs-p="加载更多_1"><span>加载更多</span><i></i></a>
                </div>
            </div>
        </div>
        <div class="sidebar">
            <div class="side-hd">旅游攻略导航</div>
            <div class="nav-drop">
                <div class="drop-item">
                    <div class="trigger"><i></i>国内</div>
                    <div class="drop-pop">
                        <div class="inner">
                            <ul>
                                <li><a href="/gonglve/mdd-sc-0-0-1.html#list" target="_blank">四川(26)</a></li>
                                <li><a href="/gonglve/mdd-yn-0-0-1.html#list" target="_blank">云南(26)</a></li>
                                <li><a href="/gonglve/mdd-js-0-0-1.html#list" target="_blank">江苏(23)</a></li>
                                <li><a href="/gonglve/mdd-zj-0-0-1.html#list" target="_blank">浙江(20)</a></li>
                                <li><a href="/gonglve/mdd-bj-0-0-1.html#list" target="_blank">北京(19)</a></li>
                                <li><a href="/gonglve/mdd-gd-0-0-1.html#list" target="_blank">广东(18)</a></li>
                                <li><a href="/gonglve/mdd-heb-0-0-1.html#list" target="_blank">河北(16)</a></li>
                                <li><a href="/gonglve/mdd-tw-0-0-1.html#list" target="_blank">台湾(16)</a></li>
                                <li><a href="/gonglve/mdd-gz-0-0-1.html#list" target="_blank">贵州(13)</a></li>
                                <li><a href="/gonglve/mdd-nm-0-0-1.html#list" target="_blank">内蒙古(13)</a></li>
                                <li><a href="/gonglve/mdd-sd-0-0-1.html#list" target="_blank">山东(12)</a></li>
                                <li><a href="/gonglve/mdd-xz-0-0-1.html#list" target="_blank">西藏(12)</a></li>
                                <li><a href="/gonglve/mdd-gx-0-0-1.html#list" target="_blank">广西(11)</a></li>
                                <li><a href="/gonglve/mdd-jx-0-0-1.html#list" target="_blank">江西(11)</a></li>
                                <li><a href="/gonglve/mdd-qh-0-0-1.html#list" target="_blank">青海(11)</a></li>
                                <li><a href="/gonglve/mdd-hn-0-0-1.html#list" target="_blank">河南(10)</a></li>
                                <li><a href="/gonglve/mdd-ah-0-0-1.html#list" target="_blank">安徽(9)</a></li>
                                <li><a href="/gonglve/mdd-fj-0-0-1.html#list" target="_blank">福建(9)</a></li>
                                <li><a href="/gonglve/mdd-hainan-0-0-1.html#list" target="_blank">海南(9)</a></li>
                                <li><a href="/gonglve/mdd-jl-0-0-1.html#list" target="_blank">吉林(9)</a></li>
                                <li><a href="/gonglve/mdd-xj-0-0-1.html#list" target="_blank">新疆(9)</a></li>
                                <li><a href="/gonglve/mdd-hlj-0-0-1.html#list" target="_blank">黑龙江(8)</a></li>
                                <li><a href="/gonglve/mdd-s1x-0-0-1.html#list" target="_blank">山西(8)</a></li>
                                <li><a href="/gonglve/mdd-s3x-0-0-1.html#list" target="_blank">陕西(8)</a></li>
                                <li><a href="/gonglve/mdd-hub-0-0-1.html#list" target="_blank">湖北(7)</a></li>
                                <li><a href="/gonglve/mdd-hunan-0-0-1.html#list" target="_blank">湖南(7)</a></li>
                                <li><a href="/gonglve/mdd-gs-0-0-1.html#list" target="_blank">甘肃(6)</a></li>
                                <li><a href="/gonglve/mdd-ln-0-0-1.html#list" target="_blank">辽宁(6)</a></li>
                                <li><a href="/gonglve/mdd-mc-0-0-1.html#list" target="_blank">澳门(3)</a></li>
                                <li><a href="/gonglve/mdd-sh-0-0-1.html#list" target="_blank">上海(3)</a></li>
                                <li><a href="/gonglve/mdd-hk-0-0-1.html#list" target="_blank">香港(3)</a></li>
                                <li><a href="/gonglve/mdd-cq-0-0-1.html#list" target="_blank">重庆(3)</a></li>
                                <li><a href="/gonglve/mdd-nx-0-0-1.html#list" target="_blank">宁夏(2)</a></li>
                                <li><a href="/gonglve/mdd-tj-0-0-1.html#list" target="_blank">天津(2)</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="drop-item">
                    <div class="trigger"><i></i>国外</div>
                    <div class="drop-pop">
                        <div class="inner">
                            <ul>
                                <li><a href="/gonglve/mdd-oz-0-0-1.html#list" target="_blank">欧洲(101)</a></li>
                                <li><a href="/gonglve/mdd-dny-0-0-1.html#list" target="_blank">东南亚(68)</a></li>
                                <li><a href="/gonglve/mdd-bmz-0-0-1.html#list" target="_blank">北美(37)</a></li>
                                <li><a href="/gonglve/mdd-dy-0-0-1.html#list" target="_blank">东亚(25)</a></li>
                                <li><a href="/gonglve/mdd-dyz-0-0-1.html#list" target="_blank">大洋洲(23)</a></li>
                                <li><a href="/gonglve/mdd-ny-0-0-1.html#list" target="_blank">南亚(22)</a></li>
                                <li><a href="/gonglve/mdd-fz-0-0-1.html#list" target="_blank">非洲(17)</a></li>
                                <li><a href="/gonglve/mdd-xy-0-0-1.html#list" target="_blank">西亚(7)</a></li>
                                <li><a href="/gonglve/mdd-nmz-0-0-1.html#list" target="_blank">南美(3)</a></li>
                                <li><a href="/gonglve/mdd-njz-0-0-1.html#list" target="_blank">南极洲(1)</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="drop-item">
                    <div class="trigger"><i></i>主题</div>
                    <div class="drop-pop">
                        <div class="inner">
                            <ul>
                                <li><a href="/gonglve/zt-1049-0-0-0.html#list"  target="_blank">休闲(22)</a></li>
                                <li><a href="/gonglve/zt-1037-0-0-0.html#list"  target="_blank">户外(18)</a></li>
                                <li><a href="/gonglve/zt-1022-0-0-0.html#list"  target="_blank">文化(17)</a></li>
                                <li><a href="/gonglve/zt-1051-1-0-0.html#list"  target="_blank">数据报告(16)</a></li>
                                <li><a href="/gonglve/zt-1006-0-0-0.html#list"  target="_blank">美食(13)</a></li>
                                <li><a href="/gonglve/zt-1027-0-0-0.html#list"  target="_blank">购物(12)</a></li>
                                <li><a href="/gonglve/zt-1046-0-0-0.html#list"  target="_blank">特别策划(11)</a></li>
                                <li><a href="/gonglve/zt-1044-0-0-0.html#list"  target="_blank">节庆(10)</a></li>
                                <li><a href="/gonglve/zt-1017-0-0-0.html#list"  target="_blank">自驾(9)</a></li>
                                <li><a href="/gonglve/zt-1023-0-0-0.html#list"  target="_blank">必备(9)</a></li>
                                <li><a href="/gonglve/zt-1026-0-0-0.html#list"  target="_blank">观赏(9)</a></li>
                                <li><a href="/gonglve/zt-1014-0-0-0.html#list"  target="_blank">周边(8)</a></li>
                                <li><a href="/gonglve/zt-1016-0-0-0.html#list"  target="_blank">摄影(7)</a></li>
                                <li><a href="/gonglve/zt-1050-0-0-0.html#list"  target="_blank">旅行主义(7)</a></li>
                                <li><a href="/gonglve/zt-1047-0-0-0.html#list"  target="_blank">建筑(5)</a></li>
                                <li><a href="/gonglve/zt-1033-0-0-0.html#list"  target="_blank">家庭(4)</a></li>
                                <li><a href="/gonglve/zt-1045-0-0-0.html#list"  target="_blank">星旅行(3)</a></li>
                                <li><a href="/gonglve/zt-1003-0-0-0.html#list"  target="_blank">滑雪(1)</a></li>
                                <li><a href="/gonglve/zt-1028-0-0-0.html#list"  target="_blank">登山(1)</a></li>
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

<div class="mfw-toolbar" id="_j_mfwtoolbar" style="display: block;">
    <div class="toolbar-item-top" style="display: none;">
        <a role="button" class="btn _j_gotop">
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