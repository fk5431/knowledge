<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/operative/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper_flash.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper_flash_debug.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/swfobject.js"></script>
    <style type="text/css" media="screen">
        html,body {
            height: 100%;
        }

        body {
            margin: 0;
            padding: 0;
            overflow: auto;
        }

        #flashContent {
            display: none;
        }
    </style>

    <title>文档在线预览系统</title>
</head>
<body>
<div align="center">
    <a id="viewerPlaceHolder"
       style="width:100%;height:600px;display:block"></a>

    <script type="text/javascript">
        var fp = new FlexPaperViewer('FlexPaperViewer',
            'viewerPlaceHolder', {
                config : {
                    SwfFile : decodeURI('${url}'),
                    Scale : 2,
                    ZoomTransition : 'easeOut',
                    ZoomTime : 0.5,
                    ZoomInterval : 0.2,
                    FitPageOnLoad : false,
                    FitWidthOnLoad : false,
                    FullScreenAsMaxWindow : false,
                    ProgressiveLoading : false,
                    MinZoomSize : 0.2,
                    MaxZoomSize : 5,
                    SearchMatchAll : false,
                    InitViewMode : 'Portrait',

                    ViewModeToolsVisible : true,
                    ZoomToolsVisible : true,
                    NavToolsVisible : true,
                    CursorToolsVisible : true,
                    SearchToolsVisible : true,

                    localeChain : 'en_US'
                }
            });
    </script>
</div>
</body>
</html>