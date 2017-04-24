<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 24/04/17
  Time: 09:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误</title>
</head>
<body>
<script>
    var errorcode = ${errorcode};
    if (errorcode == 1){
        alert("该邮箱已被注册，请您直接登录！");
        window.history.back(-1);
    }else if (errorcode == 2){
        alert("用户名不存在，请您注册！");
        window.history.back(-1);
    }else  if (errorcode == 3){
        alert("密码错误，请您重新登录！");
        window.history.back(-1);
    }
</script>
</body>
</html>
