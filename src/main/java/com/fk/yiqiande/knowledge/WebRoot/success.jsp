<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>File Upload Success</title>

</head>
<body>
<script type="text/javascript">
function del(){
  var msg=confirm("上传成功，您要继续上传吗？");
if(msg==true){
   window.location.href="upload.html";
 }else{
  window.location.href="center";
 }
}
del();
</script>
</body>
</html>