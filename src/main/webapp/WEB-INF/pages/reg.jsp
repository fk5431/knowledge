<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 20/03/17
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>注册 </title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reg.css">
</head>

<body class="pg-unitive-signup theme--maoyan">

<header class="header--mini">
    <div class="wrapper cf">
        <a class="site-logo" href="${pageContext.request.contextPath}">福州文娱演出票务网</a>
    </div>
</header>



<div class="content">
    <div class="J-unitive-signup-form">

        <div class="sheet" style="display:block">
            <form action="${pageContext.request.contextPath}/regis" method="POST">

                <div class="form-field form-field--pwd2">
                    <label>输入姓名</label>
                    <input type="text" name="name" class="f-text J-pwd2"/>
                </div>
                <div class="form-field form-field--pwd2">
                    <label>输入账户</label>
                    <input type="text" name="email" class="f-text J-pwd2"/>
                </div>
                <div class="form-field form-field--pwd2">
                    <label>输入密码</label>
                    <input type="password" name="password" class="f-text J-pwd2"/>
                </div>
                <div class="form-field">
                    <input data-mtevent="signup.submit" type="submit" name="commit" class="btn" value="注册账户" />
                    <a href="" target="_blank"></a>
                </div>
                <input type="hidden" name="fingerprint" class="J-fingerprint" value="" />
            </form>
        </div>
    </div>
</div>
<footer class="footer--mini">
    <p class="copyright">
        ©2017&nbsp;
        <a class="f1" target="_blank" href="#">*ICP证*****号</a>&nbsp;
        <span class="f1">京公网安备***********号</span>
    </p>
</footer>
</body>
</html>
