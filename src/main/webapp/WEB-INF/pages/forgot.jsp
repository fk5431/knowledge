<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 13/02/17
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>登录 | 找回登录密码</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/for.css">
</head>

<body class="pg-retrieve theme--maoyan">

<header class="header--mini">
    <div class="wrapper cf">
        <a class="site-logo" href="http://www.maoyan.com">美团</a>
    </div>
</header>

<div class="content">
    <h3 class="headline"><span class="headline__content">找回登录密码</span></h3>
    <ul class="steps-bar steps-bar--dark cf">
        <li class="step step--first step--current" style="z-index:3">
            <span class="step__num">1.</span>
            <span>确认账号</span>
            <span class="arrow__background"></span><span class="arrow__foreground"></span>
        </li>
    </ul>


    <div class="form__wrapper">
        <form class="form__content" method="POST" action="${pageContext.request.contextPath}/sendmail">
            <div class="form-field">
                <label>邮箱账户</label>
                <input class="f-text account" name="email" type="text" placeholder="邮箱" />
                <span class="tip" style="display:none;"><i class="icon"></i><span></span></span>
            </div>
            <div class="form-field">
                <input type="hidden" name="csrf" value="jKZJZpBo-RKFYL-zEwrK7L-Nao_m0FcbdbkM" />
                <input type="submit" class="btn" value="下一步" />
            </div>
        </form>
    </div>
</div>

<footer class="footer--mini">
    <p class="copyright">
        ©2017
        <a class="f1" target="_blank" href="#">*ICP证******号</a>&nbsp;
        <span class="f1">×公网安备********号</span>
    </p>
</footer>

</body>
</html>

