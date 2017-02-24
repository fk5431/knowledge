<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>帐号登录 - 大学生穷游网</title>
  <link href="${pageContext.request.contextPath}/css/login_1.css" rel="stylesheet" type="text/css">
  <script language="javascript" src="${pageContext.request.contextPath}/js/login_1.js" type="text/javascript"></script>


</head>
<body class="login_login">

<div class="wrapper">
  <div class="container">
    <a href="${pageContext.request.contextPath}/index" title="返回首页" class="logo">大学生穷游网</a>
    <div class="signup-forms flip">
      <div class="signup-box" id="_j_signup_box">
        <div class="inner">
          <form action="${pageContext.request.contextPath}/regis" method="post" id="_j_signup_form">
            <input name="token" value="ea4901e43bf174a159252d7ba21573ca" type="hidden">
            <div class="form-field">
              <input name="name" placeholder="您的姓名" value="" type="text">
              <div class="err-tip"></div>
            </div>
            <div class="form-field">
              <input name="email" placeholder="您的邮箱"  class="verification[required,maxSize[50],custom[email]]" value="" type="text">
              <div class="err-tip"></div>
            </div>
            <div class="form-field">
              <input name="password" placeholder="您的密码" value="" type="password">
              <div class="err-tip"></div>
            </div>

            <div class="submit-btn">
              <button type="submit">立即注册</button>
            </div>
          </form>
        </div>
        <div class="bottom-link">
          已经注册?<a href="#">马上登录</a>
        </div>
      </div>
      <div class="login-box" id="_j_login_box">
        <div class="inner">
          <form action="${pageContext.request.contextPath}/loginUser" method="post" id="_j_login_form">
            <div class="form-field">
              <input name="email" placeholder="您的邮箱"  class="verification[required,maxSize[50],custom[email]]" value="" type="text">
              <div class="err-tip"></div>
            </div>
            <div class="form-field">
              <input name="password" placeholder="您的密码"  type="password">
              <div class="err-tip"></div>
            </div>

            <div class="form-link"><a href="${pageContext.request.contextPath}/forget">忘记密码</a></div>
            <div class="submit-btn">
              <button type="submit">登 录</button>
            </div>
          </form>
        </div>
        <div class="bottom-link">
          还没有帐号?<a href="#">马上注册</a>
        </div>
      </div>
    </div>
  </div>
</div>

<script language="javascript" src="${pageContext.request.contextPath}/js/login_2.js" type="text/javascript"></script>


<script language="javascript" src="${pageContext.request.contextPath}/js/login_3.js" type="text/javascript"></script>




</body></html>