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
    }else if (errorcode == 3){
        alert("密码错误，请您重新登录！");
        window.history.back(-1);
    }else if (errorcode == 4){
        alert("该用户名已存在，请您重新登录！");
        window.history.back(-1);
    }else if (errorcode == 5){
        alert("已存在的值，请您重新输入！");
        window.history.back(-1);
    }else if (errorcode == 6){
        alert("缺少相应字段，请您重新输入！");
        window.history.back(-1);
    }else if (errorcode == 7){
        alert("文件不要使用中文，请您重新选择！");
        window.history.back(-1);
    }else if (errorcode == 8){
        alert("你没有权限添加管理员，请您重新选择！");
        window.history.back(-1);
    }
</script>
</body>
</html>