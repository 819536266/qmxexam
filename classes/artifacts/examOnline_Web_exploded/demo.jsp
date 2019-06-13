<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK href="${pageContext.request.contextPath}/css/Style.css" type="text/css" rel="stylesheet">
    <!-- 日期插件，使用jquery -->
    <script type="text/javascript" src="jquery/jquery-1.4.2.js"></script>
    <link rel="stylesheet" href="jquery/jquery.datepick.css" type="text/css">
    <script type="text/javascript" src="jquery/jquery.datepick.js"></script>
    <script type="text/javascript" src="jquery/jquery.datepick-zh-CN.js"></script>
</HEAD>
<script type="text/javascript">
    $(document).ready(function () {
        //使用class属性处理  'yy-mm-dd' 设置格式"yyyy/mm/dd"
        $('#birthday').datepick({dateFormat: 'yy-mm-dd'});
    });
</script>
<body>
<input type="text" id="birthday"/>
</body>
</HTML>
