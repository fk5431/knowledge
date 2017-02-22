<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 13/02/17
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>找回密码 - 大学生穷游网</title>
    <link href="${pageContext.request.contextPath}/css/login_1.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="${pageContext.request.contextPath}/js/login_1.js" type="text/javascript"></script>


</head>
<body class="login">

<div class="wrapper">
    <div class="container">
        <a href="${pageContext.request.contextPath}/index" title="返回首页" class="logo">大学生穷游网</a>
        <div class="signup-forms">
            <div class="signup-box" id="_j_forget_box">
                <div class="add-info">
                    <div class="hd">找回密码</div>
                    <form action="${pageContext.request.contextPath}/sendmail" method="post" id="_j_forget_form">
                        <input name="token" value="a87a7dc2c7e6fa79b27268aeb1653ce8" type="hidden">
                        <div class="form-field">
                            <input name="email" placeholder="您的邮箱" autocomplete="off" data-type="email" data-verification-name="邮箱" class="verification[required,maxSize[50],custom[email]]" value="" type="text">
                            <div class="err-tip"></div>
                        </div>
                        <div class="submit-btn">
                            <button type="submit">立即找回</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script language="javascript" src="${pageContext.request.contextPath}/js/login_2.js" type="text/javascript"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js/login_3.js" type="text/javascript"></script>

 </body></html>