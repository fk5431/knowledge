<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 24/04/17
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">

    <title>文件上传 </title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/css/operative/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/operative/custom.min.css" rel="stylesheet">

    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/uedite/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/uedite/ueditor.all.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/uedite/zh-cn.js"></script>
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="head.jsp"></jsp:include>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>上传相关</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>上传
                                    <small>文件上传</small>
                                </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br/>
                                <form id="demo-form2" action="${pageContext.request.contextPath}/addfile"
                                      class="form-horizontal form-label-left" enctype="multipart/form-data" method="post">

                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">标题
                                            <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="last-name" name="title" required="required"
                                                   class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="middle-name"
                                               class="control-label col-md-3 col-sm-3 col-xs-12">标签<span
                                                class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input id="middle-name" class="form-control col-md-7 col-xs-12"
                                                   required="required" type="text" name="tags" value="以英文逗号分隔">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">类型</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <select class="form-control" name="ftype">
                                                <c:forEach var="f" items="${ftype}">
                                                    <option value="${f.ftypeid}">${f.ftypename}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">能否转换</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <select class="form-control" name="ftype">
                                                <option value="1" selected>不能</option>
                                                <option value="0">能</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">分类</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <select class="select2_multiple form-control" multiple="multiple"
                                                    name="ktype">
                                                <c:forEach var="k" items="${ktype}">
                                                    <option value="${k.ktypeid}">${k.ktype}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">文件</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input class="form-control col-md-7 col-xs-12" type="file" name="file">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="middle-name"
                                               class="control-label col-md-3 col-sm-3 col-xs-12">简介<span
                                                class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input class="form-control col-md-7 col-xs-12" type="text"
                                                   required="required" name="abstract_S">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="middle-name"
                                               class="control-label col-md-3 col-sm-3 col-xs-12">描述<span
                                                class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <script id="editor" type="text/plain" name="content"></script>
                                            <script type="text/javascript">
                                                //实例化编辑器
                                                //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                                var ue = UE.getEditor('editor');


                                                function isFocus(e) {
                                                    alert(UE.getEditor('editor').isFocus());
                                                    UE.dom.domUtils.preventDefault(e)
                                                }
                                                function setblur(e) {
                                                    UE.getEditor('editor').blur();
                                                    UE.dom.domUtils.preventDefault(e)
                                                }
                                                function insertHtml() {
                                                    var value = prompt('插入html代码', '');
                                                    UE.getEditor('editor').execCommand('insertHtml', value)
                                                }
                                                function createEditor() {
                                                    enableBtn();
                                                    UE.getEditor('editor');
                                                }
                                                function getAllHtml() {
                                                    alert(UE.getEditor('editor').getAllHtml())
                                                }
                                                function getContent() {
                                                    var arr = [];
                                                    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
                                                    arr.push("内容为：");
                                                    arr.push(UE.getEditor('editor').getContent());
                                                    alert(arr.join("\n"));
                                                }
                                                function getPlainTxt() {
                                                    var arr = [];
                                                    arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
                                                    arr.push("内容为：");
                                                    arr.push(UE.getEditor('editor').getPlainTxt());
                                                    alert(arr.join('\n'))
                                                }
                                                function setContent(isAppendTo) {
                                                    var arr = [];
                                                    arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
                                                    UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
                                                    alert(arr.join("\n"));
                                                }
                                                function setDisabled() {
                                                    UE.getEditor('editor').setDisabled('fullscreen');
                                                    disableBtn("enable");
                                                }

                                                function setEnabled() {
                                                    UE.getEditor('editor').setEnabled();
                                                    enableBtn();
                                                }

                                                function getText() {
                                                    //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
                                                    var range = UE.getEditor('editor').selection.getRange();
                                                    range.select();
                                                    var txt = UE.getEditor('editor').selection.getText();
                                                    alert(txt)
                                                }

                                                function getContentTxt() {
                                                    var arr = [];
                                                    arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
                                                    arr.push("编辑器的纯文本内容为：");
                                                    arr.push(UE.getEditor('editor').getContentTxt());
                                                    alert(arr.join("\n"));
                                                }
                                                function hasContent() {
                                                    var arr = [];
                                                    arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
                                                    arr.push("判断结果为：");
                                                    arr.push(UE.getEditor('editor').hasContents());
                                                    alert(arr.join("\n"));
                                                }
                                                function setFocus() {
                                                    UE.getEditor('editor').focus();
                                                }
                                                function deleteEditor() {
                                                    disableBtn();
                                                    UE.getEditor('editor').destroy();
                                                }
                                                function disableBtn(str) {
                                                    var div = document.getElementById('btns');
                                                    var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
                                                    for (var i = 0, btn; btn = btns[i++];) {
                                                        if (btn.id == str) {
                                                            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                                                        } else {
                                                            btn.setAttribute("disabled", "true");
                                                        }
                                                    }
                                                }
                                                function enableBtn() {
                                                    var div = document.getElementById('btns');
                                                    var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
                                                    for (var i = 0, btn; btn = btns[i++];) {
                                                        UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                                                    }
                                                }

                                                function getLocalData() {
                                                    alert(UE.getEditor('editor').execCommand("getlocaldata"));
                                                }

                                                function clearLocalData() {
                                                    UE.getEditor('editor').execCommand("clearlocaldata");
                                                    alert("已清空草稿箱")
                                                }
                                            </script>
                                        </div>

                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button class="btn btn-primary" type="reset">重置</button>
                                            <button type="submit" class="btn btn-success">提交</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                冯凯
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/operative/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/js/operative/bootstrap.min.js"></script>


<!-- Switchery -->
<script src="${pageContext.request.contextPath}/js/operative/switchery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/operative/custom.min.js"></script>

</body>
</html>
