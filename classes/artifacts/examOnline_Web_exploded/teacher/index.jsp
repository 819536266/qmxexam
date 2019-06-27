<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>企明星考核系统</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico"> <link href="<%=path %>/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/admin/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/admin/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<img alt="" height="100%" width="100%" src="<%=path %>/images/chengjian.jpg" >



</body>

</html>
