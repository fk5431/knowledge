<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>请确认支付</title>
    <link href="${pageContext.request.contextPath}/css/index_1.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${pageContext.request.contextPath}/js/shop/buy_1.js"
            type="text/javascript"></script>

    <script language="javascript" src="${pageContext.request.contextPath}/js/shop/buy_2.js"
            type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/css/shop/buy_4.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${pageContext.request.contextPath}/js/shop/buy_3.js"
            type="text/javascript"></script>

</head>
<body>
<div id="header">
    <div class="mfw-header">
        <div class="header-wrap clearfix">
            <div class="head-logo"><a class="mfw-logo" title="蚂蜂窝自由行" href="${pageContext.request.contextPath}"></a>
            </div>
            <ul class="head-nav" data-cs-t="headnav" id="_j_head_nav">
                <li class="head-nav-index head-nav-active" id="head_1"><a
                        href="${pageContext.request.contextPath}/index">首页</a>
                </li>
                <li class="head-nav-place" id="head_2"><a href="${pageContext.request.contextPath}/mdd"
                                                          title="目的地">目的地</a>
                </li>
                <li class="head-nav-gonglve" id="head_3"><a href="${pageContext.request.contextPath}/content_list"
                                                            title="旅游攻略">旅游攻略</a>
                </li>
                <li class="head-nav-place" id="_j_nav_sales">
                    <a href="${pageContext.request.contextPath}/sales"
                       data-sales-nav="穷游商城">
                        <span>穷游商城<%--<i class="icon-caret-down"></i>--%></span>
                    </a>
                </li>
                <li class="head-nav-place" id="head_4"><a href="${pageContext.request.contextPath}/my"
                                                          title="个人中心">个人中心</a>
                </li>

            </ul>
            <div id="pagelet-block-abb1ca45f330cf8a24ad20466d690c67" class="pagelet-block">
                <div class="login-out">
                    <% String login = (String) request.getAttribute("login");
                        if (login == null || "".equals(login) || !"yes".equals(login)) { %>
                    <a id="_j_showlogin" title="登录" href="${pageContext.request.contextPath}/login"
                       rel="nofollow">登录</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/register" title="注册帐号"
                       rel="nofollow">注册</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/forget" title="找回密码"
                       rel="nofollow">找回密码</a>
                    <%} else {%>
                    <a id="_j_showlogin" title="我的" href="${pageContext.request.contextPath}/my"
                       rel="nofollow">我的</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/logout" title="注册帐号"
                       rel="nofollow">登出</a>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="shadow"></div>
    </div>
</div>

<div class="wrapper">
    <div class="order-cont clearfix">
        <div class="order-lt">
            <div class="buy-step">
                <ul class="clearfix">
                    <li class="step1">
                        <p><i></i></p>
                        <em>提交订单</em>
                    </li>
                    <li class="step2">
                        <p><i></i></p>
                        <em>确认支付</em>
                    </li>
                    <li class="step3">
                        <p><i></i></p>
                        <em>完成购买</em>
                    </li>
                </ul>
            </div>
            <form action="${pageContext.request.contextPath}/buyshop" method="get" id="shop">
            <div class="trav-inf"><h2><i>1</i>出行人信息（<span>用于安排出行人行程</span>）</h2>
                <div class="template-form">
                    <div class="main-trav"><h3><span class="name">主要出行人</span></h3>
                        <ul class="clearfix"></ul>
                    </div>
                    <div class="user-int clearfix">
                        <div class="form-sec flt1 w508"><label for="template_101">收货地址</label>
                            <input type="text" class="template-field bord-red" placeholder="收货地址"
                              data-title="收货地址" data-helper="此地址为最终收货地址请谨慎填写" id="template_101"
                            data-required="1" data-key="adress"  data-parentid="19" value="" data-rule="8" name="adress">
                        </div>
                    </div>
                </div>
            </div>
            <div class="res-inf" id="baseInfoForm">
                <h2><i>2</i>预订人信息（<span>用于接收订单反馈</span>）</h2>
                <div class="user-int clearfix">
                    <div class="form-sec flt1" style="clear: both">
                        <label for="base_name">姓名</label>
                        <input id="base_name" type="text" class="bord-red" placeholder="请填写您的真实姓名" value=""
                               data-required="1" data-title="姓名" name="name">
                    </div>
                    <div class="form-sec flt1" style="clear: both">
                        <label for="base_email">邮箱</label>
                        <div class="parentCls">
                            <input data-E id="base_email" type="text" class="bord-red" placeholder="请填写邮箱" value=""
                                   data-required="1" data-title="邮箱" name="email">
                        </div>
                    </div>
                    <div class="form-sec flt1" style="clear: both">
                        <label for="base_wechat">微信</label>
                        <input id="base_wechat" type="text" placeholder="仅作为备用联系方式" value="" name="wechat">
                    </div>
                    <div class="ver-code clearfix">
                        <p class="form-sec flt1">
                            <input id="base_phone" type="tel" placeholder="手机" value="" data-required="1"
                                   data-title="手机号" name="mob">
                            <label for="base_phone">手机</label>
                        </p>
                    </div>
                    <div class="form-sec form-tare">
                        <label for="base_description">备注信息</label>
                        <textarea id="base_description" type="text" placeholder="备注信息" name="other"></textarea>
                    </div>
                    <input name="id" value="${order.id}" hidden>
                </div>
            </div>
            </form>
        </div>
        <div class="order-rt">
            <div class="focus-img">
                <img src="${order.image}" width="310" height="182">

                <p>大学生穷游网<i>认证商家</i></p>
            </div>
            <div class="order-adv">
                <h2>${order.title}</h2>
                <ul>
                    <li>
                        <p><span>${order.type}</span></p>
                        <p class="clearfix"><b>数量</b>
                            <i>x1</i>
                        </p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="order-count clearfix">
        <div class="price-list flt2">
            <ul>
                <li class="clearfix">
                    <span>产品金额：</span>
                    <em>
                        ${order.price}元
                    </em>

                </li>
                <li class="clearfix price-count"><span>支付总金额：</span><b>￥<i id="money_payment">
                    ${order.price}</i>
                </b></li>
            </ul>
        </div>
    </div>
    <div class="sub-order">
        <p><i class="on" id="agreement"></i>我已阅读并同意
            <a href="${pageContext.request.contextPath}/salesagreement" target="_blank">《大学生穷游网服务使用协议》</a>
        </p>
        <div class="btn-order"   id="submit" >提交订单</div>
    </div>
    <div style="height: 200px;"></div>
</div>

<script type="text/javascript">
    var SALES_ID = '328691';
    var MDD_ID = '';
    var STOCK_ID = '68015262';
    var GO_DATE = '';
    var ADULT_NUM = '1';
    var KID_NUM = '0';
    var INFANT_NUM = '0';
    var ROOM_NUM = '0';
    var TOTAL_PRICE = '${order.price}';
    var APP_REDUCE_PRICE = 0;
    var EXT_QUERY = "&cid=1010402";
    var USER_PHONE = '';
    var VALID_MOBILE = true;
    var GIFT_CODE = '';
    var OTHER_PEOPLE = {};
    var BARGAIN_ORDER = '';
    var HONEY_MAX = 0;
</script>
<script>
    bookingFun.init();
</script>
<script>
    $(function () {
//  收起展开
        var bOpen = true;
        $('.main-trav h3 span.collect').click(function () {
            if (bOpen) {
                $(this).parent().next().slideUp();
                $(this).addClass('act').html('展开<i></i>');
                bOpen = false;
            } else {
                $(this).parent().next().slideDown();
                $(this).removeClass('act').html('收起<i></i>');
                bOpen = true;
            }
        });
//  input框选中效果
        $('.form-sec').each(function () {
            var $this = $(this).on('focusin', function () {
                $(this).addClass('form-sec-active');
            }).on('focusout change', function () {
                $(this).removeClass('form-sec-active');
            }).on('change focusout', function () {
                if ($this.find('input,select,textarea').val().length > 0) {
                    $(this).addClass('form-sec-focus');
                } else {
                    $(this).removeClass('form-sec-focus');
                }
            });
//            $this.find('label').click(function(){
//                $(this).next().focus();
//            });
        });
        $('input[data-helper],textarea[data-helper]').focus(function () {
            var holder = $(this).attr('placeholder');
            $(this).data('_placeholder', holder);
            $(this).attr('placeholder', $(this).data('helper'));
        }).blur(function () {
            $(this).attr('placeholder', $(this).data('_placeholder'));
        });
        // 邮箱提示
        $("[data-E]").mailAutoComplete({
            boxClass: "parentCls", //外部box样式
            /* listClass: "list_box", //默认的列表样式
             focusClass: "focus_box", //列表选样式中
             markCalss: "mark_box", //高亮样式*/
            autoClass: false,
            textHint: false, //提示文字自动隐藏
            hintText: "请输入邮箱地址",
            focusColor: '',
            blurColor: ''
        });
    })
</script>
<link href="${pageContext.request.contextPath}/css/shop/buy_2.css" rel="stylesheet" type="text/css"/>

<div id="footer">
    <div class="ft-content">

        <div class="ft-copyright">
            <a href="${pageContext.request.contextPath}"><i class="ft-mfw-logo"></i></a>
            <p>© 2017 Mafengwo.cn <a href="${pageContext.request.contextPath}" target="_blank"
                                     rel="nofollow">京ICP备******号</a> 京公网安备*******号 <a
                    href="${pageContext.request.contextPath}" target="_blank"
                    rel="nofollow">京ICP证*****号</a></p>
            <p><a href="${pageContext.request.contextPath}" target="_blank" rel="nofollow">营业执照</a>
                ********* 客服电话：<span class="highlight">*******</span>
            </p>
        </div>
    </div>
</div>

<link href="${pageContext.request.contextPath}/css/shop/bug_1.css" rel="stylesheet" type="text/css"/>

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
        M.loadResource("${pageContext.request.contextPath}/js/shop/buy_4.js");
    }
    var state = ${index};
    if (state == 0) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
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
