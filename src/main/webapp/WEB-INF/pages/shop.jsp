<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.RecordBean" %>
<%@ page import="com.fk.bean.HotelBean" %>
<%@ page import="com.fk.bean.LineBean" %>
<%@ page import="com.fk.bean.OrdersBean" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 10/03/17
  Time: 09:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${order.title}</title>

    <link href="${pageContext.request.contextPath}/css/shop/shop_3.css" rel="stylesheet" type="text/css"/>

    <script language="javascript" src="${pageContext.request.contextPath}/js/shop/shop_2.js" type="text/javascript"></script>
    <script type="text/javascript">
        var __mfw_uid = parseInt('0');
    </script>
    <script language="javascript" src="${pageContext.request.contextPath}/js/shop/shop_3.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/css/shop/shop_4.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${pageContext.request.contextPath}/js/shop/shop_4.js" type="text/javascript"></script>

</head>
<body>


<div id="header">
    <div class="mfw-header">
        <div class="header-wrap clearfix">
            <div class="head-logo"><a class="mfw-logo" title="大学生穷游网" href="${pageContext.request.contextPath}"></a>
            </div>
            <ul class="head-nav" data-cs-t="headnav" id="_j_head_nav">
                <li class="head-nav-index head-nav-active" id="head_1"><a href="${pageContext.request.contextPath}/index">首页</a>
                </li>
                <li class="head-nav-place" id="head_2"><a href="${pageContext.request.contextPath}/index"
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
                <li class="head-nav-place" id="head_4"><a href="${pageContext.request.contextPath}/index"
                                                          title="论坛">论坛</a>
                </li>
                <li class="head-nav-place" id="_j_nav_community">
                    <a href="${pageContext.request.contextPath}/index" title="留言薄">留言薄</a>
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





<div class="container">
    <br>
    <br>
    <div class="wrapper">
        <div class="sales-intro clearfix">
            <div class="intro-l">
                <div class="sales-photo">
                    <ul data-type="salesPhoto">
                        <li><img src="${order.image}"></li>
                    </ul>
                </div>

                <div id="calendar_wrap">

                </div>
                <div class="l-ft clearfix">

                    <span class="tuan">· 如需预订更多人数请咨询客服</span>
                    <a class="btn-collect " href="${pageContext.request.contextPath}/count_shop?id=${order.id}">
                        <i></i>收藏
                        <span class="num">${order.count}</span>
                    </a>
                    <div class="share">
                        <a class="btn-share" href="javascript:void(0)"><i></i>分享</a>
                    </div>
                </div>
            </div>
            <div class="intro-r">
                <div class="sales-title">
                    <h1>
                        ${order.title}
                    </h1>
                    <div class="s-label clearfix">
                        <%
                            List<RecordBean> record = (List)request.getAttribute("record");
                            String[] img = (String[]) request.getAttribute("images");
                            List<HotelBean> hotels = (List)request.getAttribute("hotels");
                            List<LineBean> lines = (List)request.getAttribute("lines");
                            OrdersBean ordersBean = (OrdersBean)request.getAttribute("order");
                            for(int i=0;i<ordersBean.getSubject().split("!=end=!").length;i++){
                        %>
                        <span><%=ordersBean.getSubject().split("!=end=!")[i]%></span>
                        <%}%>
                    </div>
                </div>

                <div class="price-panel clearfix">
                    <ul>
                        <li class="item-price"><em>￥</em><strong>${order.price}</strong> 起/人
                            <span id="priceDesc">
                                <a href="javascript:void(0);">价格说明</a>
                                <span id="priceDescMsg">${order.type}</span>
                            </span>
                        </li>
                        <li class="item-discount">
                        <li class="item-sold">
                            近三月售出 ${order.sellcount} 份
                        </li>
                        <!---- <li class="item-reviews"><a href="javascript:void(0)">92 条评论</a></li>---->
                    </ul>
                </div>
                <div class="info-panel">

                    <div class="info-tips">
                        <span class="label">预订须知</span>
                        <div class="info-tips-box">
                            <p>
                                <span data-desc>此产品为二次确认产品，在支付成功时间起的24小时内供应商将进行二次确认。核实是否有位。</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="r-line"></div>

                <!-- //Stock Begin -->
                <div class="property-panel">
                    <div id="stock_wrap">
                        <div data-stock-level="0" class="stock_0">
                            <dl class="clearfix tj-type">
                                <dt class="label">
                                    产品类型
                                </dt>
                                <dd>
                                    <ul class="ui-selProp clearfix">
                                        <li data-stock-id="59794071"data-child-type="2"data-level="0"data-name="6天5晚半自由行"data-role="0"><a href="javascript:void(0);"><span>${order.type}</span><i></i></a></li>
                                    </ul>
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <!-- 出行日期 -->
                    <dl class="clearfix top-bar" id="top_calendar_block" style="display: none;">
                        <dt class="label">2017年5月</dt>
                        <dd>
                            <div class="ui-date">
                                <div class="trigger bookDate-trigger">
                                    <span class="label" data-date></span>
                                    <i></i>
                                </div>
                                <div class="s_popup bookDate-pop" style="display: none">
                                    <i class="i-arrow"></i>
                                    <div class="book-calendar" id="top_calendar_wrap">

                                    </div>
                                    <p>此产品为二次确认产品，在支付成功时间起的24小时内供应商将进行二次确认。核实是否有位。</p>                                </div>
                            </div>
                        </dd>
                    </dl>
                    <!-- 出行日期 end-->
                </div>
                <div class="action-panel clearfix">
                    <div class="total">
                        <em id="flag_total_price" class="rmb-flag hide">￥</em><strong id="text_total_price">${order.price}</strong>
                        <span class="total-price-ext"></span>
                        <span class="price-sg-room" style="display: none">(包含<span class="total-price">0</span>元单房差)</span></div>
                    <div class="on-countdown-hide">
                        <div class="bargain">
                            <a class="btn btn-disabled" href="javascript:void(0);">优惠购买</a>
                        </div>
                        <span class="buy">
                            <a class="btn" data-booking-btn="1" href="javascript:void(0);">立即购买</a>
                        </span>
                    </div>
                </div>
                <div class="s_popup cart-pop" style="display:none;">
                    <i class="i-arrow"></i>

                </div>
                <!-- //Stock End -->
                <div class="safeguard">
                    <span><i></i>拒签全退</span>
                    <span><i></i>全时中文</span>
                    <span><i></i>快速响应</span>
                </div>
            </div>
        </div>
        <div class="sales-nav-wrap">
            <div class="sales-nav">
                <ul class="clearfix">

                    <li class="on"><a href="#target_introduce">产品介绍</a></li>


                    <li><a href="#target_cost">费用说明</a></li>


                    <li><a href="#target_purchase">购买须知</a></li>

                    <li><a href="#target_deal">成交记录</a></li>
                </ul>
            </div>
        </div>
        <div class="clearfix detail-wrapper">
            <div class="main-detail">
                <a id="target_introduce" class="nav-anchor"></a>
                <!--产品介绍-->
                <div class="m-panel">
                    <div class="m-hd">
                        <h2>产品介绍</h2>
                    </div>
                    <div class="m-bd">
                        <!--机票-->
                        <dl class="detail-notes">
                            <dt class="subtitle">
                                参考行程
                            </dt>
                            <dd class="notes-content m-route">
                                <div class="react-expand expanded">
                                    <div class="expand-wrap">

                                        <div class="timeline day-timeline">
                                            <%
                                                for(int i=0;i<lines.size();i++){
                                            %>
                                            <dl class="clearfix">
                                                <dt>
                                                    <span class="day-round"><b>0<%=i+1%></b></span><%=lines.get(i).getTitle()%>
                                                </dt>
                                                <dd><%=lines.get(i).getSummary()%></dd>                                </dl>
                                            <dl class="clearfix">
                                                <dt><i class="i-flag i-flag-hotel"></i><%=lines.get(i).getHotle()%></dt>
                                            </dl>
                                            <dl class="clearfix">
                                                <dt><i class="i-flag i-flag-food"></i><%=lines.get(i).getMeal()%></dt>
                                            </dl>
                                            <%}%>
                                        </div>
                                        <div class="intro" style="margin:2em 0 0 2em;color:#666;">以上行程安排可能会根据当天实际情况进行适当调整</div>
                                        <div class="expand-light"></div>
                                    </div>
                                    <a class="expand-more" href="#">更多内容</a>
                                </div>
                            </dd>
                        </dl>

                        <!--机票-->
                        <dl class="detail-notes">
                            <dt class="subtitle">
                                酒店信息
                            </dt>
                            <dd class="notes-content m-hotel">
                                <div class="intro">以下酒店仅供参考，如遇出行高峰碰上酒店无空房情况，供应商会安排转至同级酒店。</div>
                                <%

                                    for(int i=0;i<hotels.size();i++){
                                %>
                                <div class="react-expand" style="max-height: 700px;">
                                    <div class="expand-wrap">
                                        <div class="item-hotel clearfix">
                                            <div class="image"><a ><img src="<%=hotels.get(i).getImg()%>"></a></div>
                                            <div class="hotel-detail">
                                                <div class="h-title">
                                                    <h3><a ><%=hotels.get(i).getTitle()%></a></h3>
                                                    <p><%=hotels.get(i).getEtitle()%></p>
                                                </div>
                                                <div class="h-info">
                                                    <span class="h-star">酒店星级<span class="star star<%=hotels.get(i).getStar()%>"></span></span>
                                                    <span class="h-score">评分 <b><%=hotels.get(i).getScore()%></b> 分</span>
                                                    <p class="h-address">
                                                        地址：<span><%=hotels.get(i).getAdress()%></span>
                                                        <a  href="javascript:void(0);" ></a>
                                                    </p>
                                                </div>
                                                <ul class="nums">
                                                    <li><a ><em></em><br>穷游网评价</a></li>
                                                </ul>
                                                <div class="summary"><%=hotels.get(i).getSummary()%></div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </dd>
                        </dl>

                        <!--行程参考-->

                        <!--机票-->
                        <dl class="detail-notes">
                            <dt class="subtitle">
                                图文详情
                            </dt>
                            <dd class="notes-content">

                                <p>
                                    <%
                                        for(int i=0;i<img.length;i++){
                                    %>
                                    <img src="<%=img[i]%>">
                                    <%}%>
                                </p>

                            </dd>
                        </dl>


                    </div>
                </div>
                <a id="target_cost" class="nav-anchor"></a>
                <!--费用说明-->
                <div class="m-panel m-cost">
                    <div class="m-hd">
                        <h2>费用说明</h2>
                    </div>
                    <div class="m-bd">

                        <dl class="detail-notes">
                            <dt class="subtitle">费用包含</dt>
                            <dd class="notes-content">
                                <p>${order.cost}</p>
                            </dd>
                        </dl>
                        <dl class="detail-notes">
                            <dt class="subtitle">费用不含</dt>
                            <dd class="notes-content">
                                <p>1.单房差:此产品为两人入住一间价格，单人入住需补房差；<br />2.签证:此产品不含签证费用，客户需自行办理；<br />3.接送机:当地机场至酒店往返费用；<br />4.旅游人身意外保险。建议购买旅游人身意外保险；<br />5. 因交通延阻、战争、政变、罢工、大风、大雾、飞机故障、 航班取消或更改时间等不可抗力原因所引致的额外费用；<br />6.一切个人消费以及&ldquo;费用包含&rdquo;中未提及的任何费用。</p>
                            </dd>
                        </dl>
                        <dl class="detail-notes">
                            <dt class="subtitle">儿童政策</dt>
                            <dd class="notes-content">
                                <p>1. 此产品儿童与成人同价。</p>
                            </dd>
                        </dl>

                    </div>
                </div>

                <a id="target_purchase" class="nav-anchor"></a>
                <!--购买须知-->
                <div class="m-panel m-notice">
                    <div class="m-hd">
                        <h2>购买须知</h2>
                    </div>
                    <div class="m-bd">



                        <dl class="detail-alert">
                            <dt class="subtitle">退改政策</dt>
                            <dd class="notes-content">
                                在二次确认后无消费使用（即无出门票，酒店无预订），可与供应商协商退款，二次确认后因个人原因无法出行或者超出了有效期恕不予以退款，敬请谅解。<br>
                            </dd>
                        </dl>
                        <dl class="detail-notes">
                            <dt class="subtitle">重要提示</dt>
                            <dd class="notes-content">
                                <p>注意事项:（为了保护您的消费权益请仔细阅读活动规则） <br />1.拍前请先咨询客服确认位置&nbsp;<br />请亲们拍下宝贝前与客服联系，确定当前情况并确认您的出行日期、人数等。<br />3.自备证件 <br />报名必需自备前往港澳通行证和身份证有效证件，报名时请提供参团人的姓名、性别、出生年月日、签发地、通行证W开头的证号、联系电话，通行证签注类别是团队（L）或是个人旅游（G）。如因个人原因导致无法正常出行，责任自负。 <br />4.适合人群 <br />a、此线路不接受孕妇、患有传染病等可能危害其他旅游者健康和安全的客人，未满18周岁及75岁以上的老人恕不接待。如有隐瞒自身健康状况而产生意外或导致其他损失，概由游客承担，旅行社不承担责任；<br />5.确认评价 <br />请您在行程结束后对我们的服务做出评价，如有任何建议或投诉，请先与客服沟通，根据售后服务来评分和评价。我们的努力体现在您的评价上，您的满意是我们最大的动力！谢谢！ <br />6.特别提示 <br />a.节假日期间行程中如有景点被政府征用或管制则取消，费用不退，望周知。 <br />b.如遇旺季，皇岗口岸过关的人流比较多，会导致我们团队过关比较慢，过关时间比较长，敬请客人积极配合，并耐心等待！ <br />c.本次活动之游客必须全程随团活动，不得中途擅自离团，否则公司不承担由此产生的任何法律上的责任。 <br />d.以下行程在景点不减少的情况下，游览先后次序以当地接待社安排为准。 <br />f.全程无强制自费，无强迫购物！ 若要走完全不进购物店的行程请联系客服更换其他行程。<br />g.个别酒店不备牙刷、牙膏、拖鞋、毛巾，最好自备牙刷、牙膏、拖鞋、毛巾。 <br />h.国家法定节假日及香港法定节假日酒店门票价格上调，价格会有起伏，需补交旺季房差，具体以实际情况为准。<br />（本次活动必须全程随团不得擅自离团，否则加收1000元的团费，由离团出行的任何问题我社不承担此产生的任何法律上的责任）</p>
                            </dd>
                        </dl>

                        <dl class="detail-notes">
                            <dt class="subtitle">产品服务信息</dt>
                            <dd class="notes-content">
                                <p>该旅游产品由
                                    大学生穷游网 提供
                                </p>
                            </dd>
                        </dl>

                    </div>
                </div>

                <!--TODO成交记录---->
                <a id="target_deal" class="nav-anchor"></a>
                <div class="m-panel m-dealorder order-record">
                    <div class="m-hd"><h2>成交记录</h2></div>
                    <div class="m-bd">
                        <table id="tb_payment">
                            <thead>
                            <tr>
                                <td class="td-user">用户名</td>
                                <td class="td-price">拍下价格</td>
                                <td class="td-num">数量</td>
                                <td class="td-time">付款时间</td>
                                <td class="td-info">产品详情</td>
                            </tr>
                            <%
                                for(int i=0;i<record.size();i++) {
                            %>
                                <tr>
                                    <td class="td-user"><%=record.get(i).getName()%></td>
                                    <td class="td-price"><%=record.get(i).getPrice()%></td>
                                    <td class="td-num"><%=record.get(i).getNum()%></td>
                                    <td class="td-time"><%=record.get(i).getTime()%></td>
                                    <td class="td-info"><%=record.get(i).getType()%></td>
                                </tr>
                            <%} %>
                            </thead>
                            <tbody></tbody>
                        </table>
                        <div align="right" class="m-pagination" id="payment_page_box"></div>
                    </div>
                </div>
                <!--成交记录end---->
            </div>
        </div>
        <!-- 相关推荐 begin-->
        <div class="m-recommend">
            <div class="hd">相关推荐</div>
            <ul class="bd clearfix">
                <li class="item" data-stat-area="相关推荐" data-stat-id="2151254">
                    <a href="#" target="_blank">
                        <div class="image">
                            <img src="http://a2-q.mafengwo.net/s10/M00/D4/8F/wKgBZ1i1OjuARt4-AAJymOvaBFY96.jpeg?imageMogr2%2Fthumbnail%2F%21235x168r%2Fgravity%2FCenter%2Fcrop%2F%21235x168%2Fquality%2F100">





                            <span class="mark-type type-1">
                                <strong>香港</strong>
                                <span>多日游</span>
                            </span>

                        </div>
                        <div class="info">
                            <h4>【香港纯玩】深圳出发 海洋公园+ 市区观光+维多利亚港邮轮+自由行  2...</h4>
                            <div class="price">
                                <strong>¥ 480
                                    <span style="font-size: 14px;">起/人</span>
                                </strong>
                                <span>新品上线</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="item" data-stat-area="相关推荐" data-stat-id="2145808">
                    <a href="#" target="_blank">
                        <div class="image">
                            <img src="http://n3-q.mafengwo.net/s9/M00/F6/9F/wKgBs1gQF0CAeiQ6AANkpm2VY2Y13.jpeg?imageMogr2%2Fthumbnail%2F%21235x168r%2Fgravity%2FCenter%2Fcrop%2F%21235x168%2Fquality%2F100">





                            <span class="mark-type type-1">
                                <strong>香港</strong>
                                <span>半自由行</span>
                            </span>

                        </div>
                        <div class="info">
                            <h4>深圳出发乐园游香港+澳门4日3晚半自由行（纯玩无购物+无附加费+海洋馆...</h4>
                            <div class="price">
                                <strong>¥ 2050
                                    <span style="font-size: 14px;">/人</span>
                                </strong>
                                <span>已售4件</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="item" data-stat-area="相关推荐" data-stat-id="2144752">
                    <a href="#" target="_blank">
                        <div class="image">
                            <img src="http://n2-q.mafengwo.net/s9/M00/87/5E/wKgBs1gRa16AGR9rAAZvcsdius018.jpeg?imageMogr2%2Fthumbnail%2F%21235x168r%2Fgravity%2FCenter%2Fcrop%2F%21235x168%2Fquality%2F100">





                            <span class="mark-type type-1">
                                <strong>香港</strong>
                                <span>半自由行</span>
                            </span>

                        </div>
                        <div class="info">
                            <h4>深圳出发港澳3日2晚半自由行（特价+舒适四星+夜游维港+海洋公园+一天...</h4>
                            <div class="price">
                                <strong>¥ 1780
                                    <span style="font-size: 14px;">/人</span>
                                </strong>
                                <span>新品上线</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="item" data-stat-area="相关推荐" data-stat-id="2117534">
                    <a href="#" target="_blank">
                        <div class="image">
                            <img src="http://n4-q.mafengwo.net/s9/M00/0D/C0/wKgBs1hFWXuATpYgAA5H57yZtMs23.jpeg?imageMogr2%2Fthumbnail%2F%21235x168r%2Fgravity%2FCenter%2Fcrop%2F%21235x168%2Fquality%2F100">





                            <span class="mark-type type-1">
                                <strong>香港</strong>
                                <span>接送机</span>
                            </span>

                        </div>
                        <div class="info">
                            <h4>[豪华轿车] 香港机场至香港区接送机服务奔驰轿车</h4>
                            <div class="price">
                                <strong>¥ 499
                                    <span style="font-size: 14px;">/车</span>
                                </strong>
                                <span>已售1件</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="item" data-stat-area="相关推荐" data-stat-id="2149921">
                    <a href="#" target="_blank">
                        <div class="image">
                            <img src="http://n3-q.mafengwo.net/s9/M00/F6/9F/wKgBs1gQF0CAeiQ6AANkpm2VY2Y13.jpeg?imageMogr2%2Fthumbnail%2F%21235x168r%2Fgravity%2FCenter%2Fcrop%2F%21235x168%2Fquality%2F100">





                            <span class="mark-type type-1">
                                <strong>香港</strong>
                                <span>半自由行</span>
                            </span>

                        </div>
                        <div class="info">
                            <h4>深圳出发乐园游香港迪士尼4天3晚半自由行（纯玩无购物+无附加费+蜡像...</h4>
                            <div class="price">
                                <strong>¥ 2280
                                    <span style="font-size: 14px;">/人</span>
                                </strong>
                                <span>新品上线</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="item" data-stat-area="相关推荐" data-stat-id="2059512">
                    <a href="#" target="_blank">
                        <div class="image">
                            <img src="http://n1-q.mafengwo.net/s10/M00/A4/0F/wKgBZ1ir6Y2AA3WDAAFJHx1Zcx421.jpeg?imageMogr2%2Fthumbnail%2F%21235x168r%2Fgravity%2FCenter%2Fcrop%2F%21235x168%2Fquality%2F100">





                            <span class="mark-type type-1">
                                <strong>深圳</strong>
                                <span>景点门票</span>
                            </span>

                        </div>
                        <div class="info">
                            <h4>深圳世界之窗门票</h4>
                            <div class="price">
                                <strong>¥ 68
                                    <span style="font-size: 14px;">起</span>
                                </strong>
                                <span>已售242件</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="item" data-stat-area="相关推荐" data-stat-id="2074902">
                    <a href="#" target="_blank">
                        <div class="image">
                            <img src="http://n2-q.mafengwo.net/s9/M00/79/4E/wKgBs1fkmAeAXKOlAADIh0LOB9E24.jpeg?imageMogr2%2Fthumbnail%2F%21235x168r%2Fgravity%2FCenter%2Fcrop%2F%21235x168%2Fquality%2F100">





                            <span class="mark-type type-1">
                                <strong>香港</strong>
                                <span>机票</span>
                            </span>

                        </div>
                        <div class="info">
                            <h4>北京直飞香港4-5日往返机票含税（G签L签可收+L签免费送关）</h4>
                            <div class="price">
                                <strong>¥ 1130
                                    <span style="font-size: 14px;">起/人</span>
                                </strong>
                                <span>已售32件</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="item" data-stat-area="相关推荐" data-stat-id="2144787">
                    <a href="#" target="_blank">
                        <div class="image">
                            <img src="http://a4-q.mafengwo.net/s10/M00/79/EC/wKgBZ1ilaV-ACtFFAALSn_9YlvA78.jpeg?imageMogr2%2Fthumbnail%2F%21235x168r%2Fgravity%2FCenter%2Fcrop%2F%21235x168%2Fquality%2F100">

                            <span class="mark-type type-1">
                                <strong>香港</strong>
                                <span>半自由行</span>
                            </span>

                        </div>
                        <div class="info">
                            <h4>深圳出发港澳4日3晚半自由行（特价冲量+一价全含+无购物无自费+升级四...</h4>
                            <div class="price">
                                <strong>¥ 1860
                                    <span style="font-size: 14px;">/人</span>
                                </strong>
                                <span>新品上线</span>
                            </div>
                        </div>
                    </a>
                </li>

            </ul>
        </div>
        <!-- 相关推荐 end-->
    </div>

</div>

<link href="${pageContext.request.contextPath}/css/shop/shop_2.css" rel="stylesheet" type="text/css"/>

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


<link href="${pageContext.request.contextPath}/css/shop/shop_1.css" rel="stylesheet" type="text/css"/>

<div class="mfw-toolbar" id="_j_mfwtoolbar">
    <div class="toolbar-item-top">
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
    <div class="toolbar-item-down">
        <a role="button" class="btn _j_gobottom">
            <i class="icon_down"></i>
            <em>页面底部</em>
        </a>
    </div>
</div>



<script language="javascript" type="text/javascript">
    if (typeof M !== "undefined" && typeof M.loadResource === "function") {
        M.loadResource("${pageContext.request.contextPath}/js/shop/shop_1.js");
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

