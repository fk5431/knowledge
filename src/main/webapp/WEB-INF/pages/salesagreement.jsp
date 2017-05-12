<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 17/03/17
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>大学生穷游网</title>
    <link href="${pageContext.request.contextPath}/css/index_1.css"
          rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/css/index_2.css"
          rel="stylesheet" type="text/css">
    <script language="javascript" src="${pageContext.request.contextPath}/js/mdd/mdd_1.js"
            type="text/javascript"></script>
</head>
<body>
<div id="header">
    <div class="mfw-header">
        <div class="header-wrap clearfix">
            <div class="head-logo"><a class="mfw-logo" title="大学生穷游网自由行" href="${pageContext.request.contextPath}"></a>
            </div>
            <ul class="head-nav" data-cs-t="headnav" id="_j_head_nav">
                <li class="head-nav-index head-nav-active" id="head_1"><a
                        href="${pageContext.request.contextPath}/index">首页</a>
                </li>
                <li class="head-nav-place" id="head_2"><a href="${pageContext.request.contextPath}/mdd" title="目的地">目的地</a>
                </li>
                <li class="head-nav-gonglve" id="head_3"><a href="${pageContext.request.contextPath}/content_list" title="旅游攻略">旅游攻略</a>
                </li>
                <li class="head-nav-place" id="_j_nav_sales" >
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
                    <% String login = (String)request.getAttribute("login");
                        if(login == null || "".equals(login) || !"yes".equals(login)){ %>
                    <a id="_j_showlogin" title="登录" href="${pageContext.request.contextPath}/login"
                       rel="nofollow">登录</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/register" title="注册帐号"
                       rel="nofollow">注册</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/forget" title="找回密码"
                       rel="nofollow">找回密码</a>
                    <%}else{%>
                    <a id="_j_showlogin" title="个人中心" href="${pageContext.request.contextPath}/my"
                       rel="nofollow">个人中心</a>
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

<div class="wrapper" >

    <div class="article">
        <h1>大学生穷游网商城平台服务协议</h1>

        <p>欢迎使用大学生穷游网商城平台服务！（下称本服务）。</p>

        <p>本服务上的信息除特别明确说明外，均为第三方卖家、商户或商家等企业或个人（下称第三方）提供。如果您通过任何形式和途径使用本服务，即<strong>表明您已经理解本服务的第三方性质，并已经阅读、理解、同意大学生穷游网网各类相关服务协议、隐私政策、权利声明等使用规范或条件，并愿意接受大学生穷游网各类协议的约束。根据上述规范，并结合本服务的特点，大学生穷游网制定了本《大学生穷游网商城平台服务协议》（下称本服务协议或本协议），作为一般服务协议的特别规定，</strong>如果本协议的条款与其他协议有不一致之处，则以本协议为准。
        </p>

        <p><strong>第一条 帐户安全</strong></p>

        <p><strong>如果您使用本服务，您应该理解本服务具有平台性质、理解本平台服务项下将发生或可能发生资金变动等，您理解并同意将以超出一般服务的严格态度维护和管理您的帐户和密码的保密性并限制第三方使用/访问您的计算机或移动设备，并且，您明确同意对在您的帐户和密码下发生的所有活动承担责任。</strong>
        </p>

        <p>大学生穷游网仅向具有支付能力的成年人提供本服务。如果您未满18周岁，您只能在父母或监护人的参与下使用本服务。</p>

        <p>大学生穷游网保留自行决定拒绝提供服务、关闭帐户、删除或编辑内容或取消订单的权利。</p>

        <p><strong>第二条 本服务的信息、各种服务或产品的品质</strong></p>

        <p>
            大学生穷游网努力使本服务上的各类信息尽可能准确。您通过使用本服务任何信息订购的服务或产品，除明确提示为大学生穷游网提供外，均为第三方独立提供，因此，该服务或产品的导致的一切问题、任何风险及各类纠纷将由您与第三方直接沟通处理，大学生穷游网将对您作出必要的协助。</p>

        <p>鉴于大学生穷游网不负责审查和评估也不担保任何第三方的待售服务或产品以及它们网站/网页的内容。大学生穷游网对第三方的行为、商品和内容不承担责任，大学生穷游网建议您应仔细阅读第三方服务所约定的服务协议、使用条件、预订购买须知及隐私政策等。</p>


        <p><strong>第三条 禁止任何形态的商业使用</strong></p>

        <p>本服务面向大学生穷游网终端用户提供，因此不允许包括但不限于代购销售、产品宣传、不正当竞争等一切形态的商业行为。否则，大学生穷游网有权单方删除该等内容，并单方终止向用户提供本服务。</p>

        <p><strong>第四条 评论、意见、信息交流和其他内容</strong></p>

        <p>您可以在本服务提供的相关位置张贴评论、意见、图片和其他内容，以及提出建议、想法、
            意见、问题或其他信息。但上述一切内容应遵守大学生穷游网的《服务协议》规定，并适用《游记协议》相关的规定进行规范、管理或使用。大学生穷游网网站尊重知识产权。如果您认为本服务中存在对您的权利的侵犯，请按照大学生穷游网的《网络信息侵权通知指引》进行处理。</p>

        <p><strong>第五条 合同缔结</strong></p>

        <p><strong>如果您通过本服务订购服务或产品，除大学生穷游网或第三方另有特别说明外，大学生穷游网网站（或APP）上展示的服务或产品的信息、照片、价格等信息仅仅是要约邀请，您的订单将成为订购相关服务或产品的要约。收到您的订单后，大学生穷游网或第三方将通过网站专门页面、站内信、电子邮件或短信等途径或形式向您发送信息确认大学生穷游网已收到您的订单，其中可能载明订单的细节，但该确认不代表大学生穷游网接受您的订单。甚至您的付款行为也不表明您的订单已经被接受，只有当作为最终服务提供商第三方、或第三方的供应商等向您发出服务或产品已经可以使用的通知时，才构成对您的订单的接受，您与第三方或大学生穷游网之间的订购合同才成立。如果您在一份订单里订购了多种服务或产品，而只向您发出了其中部分服务或产品的确认信息时，第三方或大学生穷游网与您之间的订购合同仅就该部分服务或产品成立。</strong>
        </p>

        <p><strong>第六条 价格及价格信息错误</strong></p>

        <p>除非第三方或其他另有规定，在大学生穷游网网站上显示的服务或产品价格代表该等服务或产品的市场零售价格，当该等服务或产品由第三方卖家或大学生穷游网销售时，该等产品或服务的市场价由该商家提供。</p>

        <p><strong>如上所述，对于服务或产品的信息，直到第三方或大学生穷游网通知您使用该等服务，才能确认该服务或产品的销售价格。</strong></p>

        <p><strong>尽管大学生穷游网尽最大的努力确保本服务上第三方提供或大学生穷游网提供的服务或产品价格的准确性，但技术或人为等原因，本服务的一小部分服务或产品的价格信息可能偶尔会出现错误。如果某一服务或产品的定价信息出现错误，大学生穷游网或第三方有权咨询您的变更意愿，或直接取消您的订单。</strong>
        </p>

        <p><strong>当然，对于价格信息错误的情况，第三方如果有不同的政策或规定，请遵守该等规定。</strong></p>

        <p><strong>第七条 退订、退款的特殊性</strong></p>

        <p><strong>除非有具体的说明外，本服务提供的商品主要为旅游服务或产品，具有很强的时效性等特点，大量产品一经售出将无法退回，也无法跟普通的网络商品销售一样可以执行如七天退货等相关的网络退货政策。请认真仔细阅读相关产品的订购和退订的具体约定。</strong>
        </p>

        <p><strong>第八条 不承诺担保和责任限制</strong></p>

        <p><strong>如上所述，本服务属于第三方服务平台性质，服务、产品、信息均由具体的第三方提供。除非另有明确的书面说明，本服务及其所包含的或以其它方式通过大学生穷游网网站（或APP）提供给您的全部信息、内容、材料、商品（包括软件）和服务，是在“现状”和“现存”的基础上提供的。除非另有明确的书面说明,大学生穷游网不对本网站的运营及包含在本网站上的信息、内容、材料、商品（包括软件）或服务作任何形式的、明示或默示的声明或担保（根据中华人民共和国法律另有规定的除外）。您明确同意自担风险使用本网站。</strong>
        </p>

        <p><strong>在适用法律所允许的最大限度内
            ，大学生穷游网不承诺所有明示或默示的担保，包括但不限于对适销性和满足特定目的的默示担保。大学生穷游网不担保本网站、其所包含的或以其它方式通过本网站提供给您的全部信息、内容、材料、商品（包括软件）和服务、其服务器或从本网站发出的电子信件没有病毒或其他有害成分。除非另有明确的书面说明，大学生穷游网不对由于使用本网站、或由于其所包含的或以其它方式通过本网站提供给您的全部信息、内容、材料、商品（包括软件）和服务、或购买和使用产品引起的任何损害承担责任（除非根据中华人民共和国法律应承担责任的以外），包括但不限于直接、间接或附带的惩罚性和结果性的损害赔偿。</strong>
        </p>

        <p><strong>第九条 特别提示</strong></p>

        <p><strong>您应确保出行人身体条件适合您预订的旅游度假产品，如出行人为60岁以上的老年人、孕妇或有心脏病、高血压、呼吸系统疾病等病史，请在征得医院专业医生和家属同意后出行。您应当根据自己的身体情况在充分了解旅游活动的内容后选择旅游活动，并严格遵守旅游活动的安全规定。</strong>
        </p>

        <p><strong>您应保证您提供的证件、通讯方式、配送地址等相关资料均真实、有效。</strong></p>

        <p><strong>旅游期间，您应尊重当地的宗教信仰、民族习惯和风土人情，自觉保护当地自然环境。</strong></p>

        <p><strong>您有权自愿选择和购买旅游人身意外保险及其他保险。在旅行行过程中，为了获得更为全面的保障，大学生穷游网建议您出游时根据个人意愿和需要自行投保有关保险。</strong></p>

        <p>大学生穷游网有权收取您预订和购买旅游产品应支付的费用。</p>

        <p>为了保证您预订和购买的产品顺利确认，大学生穷游网有权获得您的个人必要信息。大学生穷游网会对您的个人资料信息保密并妥善保管您提交的各种证件。</p>

        <p>如您为持非中国大陆护照的游客或自备签证的旅游者，应自行办理本次旅行签证和再次回中国大陆的签证。</p>

        <p><strong>第十条 隐私政策</strong></p>

        <p>请阅读大学生穷游网的《隐私政策》以了解大学生穷游网的隐私政策及相关惯例。该声明适用于您对本服务的使用。</p>

        <p><strong>第十一条 许可和网站进入</strong></p>

        <p>
            您在遵守本服务协议的条件下使用本服务。大学生穷游网对您使用本服务的许可均基于您个人且非商业使用服务授予有限许可，该许可为非排他的、不可转让的且不可再许可的许可。未经大学生穷游网的书面许可，任何企业、个人或任何用户严禁对本服务的内容进行系统获取以直接或间接创建或编辑文集、汇编、数据库或人名地址录（无论是否通过Robots、Spiders、自动仪器或手工操作）。</p>

        <p><strong>第十二条 适用法律和争议解决</strong></p>

        <p>通过使用本服务，您同意本服务协议以及您和本服务之间发生的任何争议均适用中华人民共和国法律。</p>

        <p>有关与您访问本网站或通过本网站购买的商品或服务的任何形式的争议应提交北京市有管辖权的法院诉讼解决。</p>

        <p><strong>第十三条 网站政策、修改和可分性</strong></p>

        <p>请阅读大学生穷游网网站上发布的其他协议、规定或政策。这些政策同样适用于您对本服务的使用。<strong>大学生穷游网保留在任何时候对大学生穷游网各类协议、规定或政策和本服务协议作出修改的权利，该等修改一经张贴即发生法律效力，而您同意接受该等随时作出的修订。</strong>如果本服务协议中任何一条被视为废止、无效或因任何理由不可执行，该使用条件应视为可分割的且不影响任何其余条款的有效性和可执行性。
        </p>

        <p>本协议内容中以黑体、加粗等方式显著标识的条款，请您着重阅读。</p>


    </div>
</div>
<script language="javascript" src="${pageContext.request.contextPath}/js/mdd/mdd_3.js"
        type="text/javascript"></script>

<link href="${pageContext.request.contextPath}/css/mdd/index3.css" rel="stylesheet" type="text/css"/>

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

<link href="${pageContext.request.contextPath}/css/mdd/index2.css" rel="stylesheet" type="text/css"/>
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
        M.loadResource("${pageContext.request.contextPath}/js/mdd/mdd_2.js");
    }
</script>

<script>
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
