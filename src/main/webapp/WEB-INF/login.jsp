<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 24/04/17
  Time: 09:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML >
<html>
<head>
    <title>知识库管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/login/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/login/login.js"></script>
    <link href="${pageContext.request.contextPath }/css/login.css"
          rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>
    知识库管理系统<sup>V2017</sup>
</h1>
<div align="center" class="login" style="margin-top:50px;">
    <div class="header">
        <div class="switch" id="switch">
            <a class="switch_btn_focus" id="switch_qlogin"
               href="javascript:void(0);" tabindex="7">快速登录</a> <a
                class="switch_btn" id="switch_login" href="javascript:void(0);"
                tabindex="8">快速注册</a>
            <div class="switch_bottom" id="switch_bottom"
                 style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>
    <div class="web_qr_login" id="web_qr_login"
         style="display: block; height: 235px;">
        <!--登录-->
        <div class="web_login" id="web_login">

            <div class="login-box">

                <div class="login_form">
                    <form action="${pageContext.request.contextPath }/login" name="loginform" id="login_form"
                          class="loginForm" method="post">
                        <%--<input type="hidden" name="did" value="0"/> --%>
                        <%--<input type="hidden" name="to" value="log"/>--%>
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips" for="u">帐号：</label>
                            <div class="inputOuter" id="uArea">
                                <input type="text" id="u" name="uname" class="inputstyle"/>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                            <label class="input-tips" for="p">密码：</label>
                            <div class="inputOuter" id="pArea">
                                <input type="password" id="p" name="pwd" class="inputstyle"/>
                            </div>
                        </div>
                        <div style="padding-left:50px;margin-top:20px;">
                            <input type="submit" value="登 录" style="width:150px;" class="button_blue"/>
                        </div>
                        <div>
                            <a href="${pageContext.request.contextPath}/forgot">忘记密码</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--登录end-->
    </div>
    <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
        <div class="web_login">
            <form name="form2" id="regUser" accept-charset="utf-8" action="${pageContext.request.contextPath }/register"
                  method="post">
                <%--<input type="hidden" name="to" value="reg"/>--%>
                <%--<input type="hidden"        name="did" value="0"/>--%>
                <ul class="reg_form" id="reg-ul">
                    <div id="userCue" class="cue">快速注册请注意格式</div>
                    <li><label for="user" class="input-tips2">用户名：</label>
                        <div class="inputOuter2">
                            <input type="text" id="user" name="uname" maxlength="16" class="inputstyle2"/>
                        </div>
                    </li>
                    <li><label for="user" class="input-tips2">邮箱：</label>
                        <div class="inputOuter2">
                            <input type="text" id="email" name="email" value="此邮箱用于找回密码" class="inputstyle2"/>
                        </div>
                    </li>
                    <li><label for="passwd" class="input-tips2">密码：</label>
                        <div class="inputOuter2">
                            <input type="password" id="passwd" name="pwd" maxlength="16" class="inputstyle2"/>
                        </div>
                    </li>
                    <li><label for="passwd2" class="input-tips2">确认密码：</label>
                        <div class="inputOuter2">
                            <input type="password" id="passwd2" maxlength="16" class="inputstyle2"/>
                        </div>
                    </li>

                    <li>
                        <div class="inputArea">
                            <input type="button" id="reg"
                                   style="margin-top:10px;margin-left:85px;" class="button_blue"
                                   value="同意协议并注册"/>
                        </div>

                    </li>
                    <div class="cl"></div>
                </ul>
            </form>

        </div>

    </div>
    <!--注册end-->
</div>
<div class="jianyi">*推荐使用ie9或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</body>
</html>