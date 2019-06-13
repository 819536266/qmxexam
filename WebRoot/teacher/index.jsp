<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/responsive-tables.css">
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-fileupload.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-timepicker.min.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>

    <%-- <script type="text/javascript" src="<%=path %>/jquery/jquery-1.4.2.js"></script> --%>
    <%-- 	<link rel="stylesheet" href="<%=path %>/jquery/jquery.datepick.css" type="text/css">
        <script type="text/javascript" src="<%=path %>/jquery/jquery.datepick.js"></script>
        <script type="text/javascript" src="<%=path %>/jquery/jquery.datepick-zh-CN.js"></script> --%>

    <link rel="stylesheet" href="<%=path %>/css/BeatPicker.min.css"/>
    <script src="<%=path %>/js/jquery-2.1.4.min.js"></script>
    <script src="<%=path %>/js/BeatPicker.min.js"></script>
    <script src="<%=path %>/js/select.js"></script>
    <title>企明星考核系统</title>
</head>
<body>

<c:include value="header.jsp"/>

<div class="leftpanel" style="margin-left: 0px;">

    <div class="leftmenu">
        <ul class="nav nav-tabs nav-stacked">
            <li class="nav-header">Navigation</li>

            <li class="dropdown active"><a href=""><span class="iconfa-pencil"></span> 员工管理</a>
                <ul>
                    <li><a href="<%=path %>/teacher/studentAdd.jsp">添加员工</a></li>
                    <%-- <li ><a  href="<%=path %>/teacher/studentDelete.jsp">删除员工</a></li> --%>
                    <%-- <li ><a  href="<%=path %>/teacher/studentUpdate.jsp">修改员工</a></li> --%>
                    <li><a href="<%=path %>/teacher/studentQuery.action">查询所有员工</a></li>
                    <li><a href="<%=path %>/teacher/studentJfree.jsp">显示部门柱状图</a></li>
                </ul>
            </li>
            <li class="dropdown"><a href=""><span class="iconfa-briefcase"></span> 试题管理</a>
                <ul>
                    <li><a href="<%=path %>/teacher/subjectAdd.jsp">添加试题</a></li>
                    <li><a href="<%=path %>/teacher/querySubject.action">查询所有试题</a></li>
                    <li><a href="<%=path %>/teacher/subjectQuery.jsp">搜索试题</a></li>
                </ul>
            </li>

        </ul>
    </div><!--leftmenu-->

</div><!-- leftpanel -->


<div class="rightpanel">

    <ul class="breadcrumbs">
        <li><a href="<%=path %>/teacher/teacher.jsp"><i class="iconfa-home"></i></a> <span class="separator"></span></li>


        <li class="right">
            <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
            <ul class="dropdown-menu pull-right skin-color">
                <li><a href="default">Default</a></li>
                <li><a href="navyblue">Navy Blue</a></li>
                <li><a href="palegreen">Pale Green</a></li>
                <li><a href="red">Red</a></li>
                <li><a href="green">Green</a></li>
                <li><a href="brown">Brown</a></li>
            </ul>
        </li>
    </ul>



    <div class="maincontent" style="">
        <div class="maincontentinner" style="width: 93% ;height:100px">

              <%--  <c:include value="bigtypeadd.jsp"/>--%>
            <br /><br />

            <div class="footer" >
                <div class="footer-left">
                    <span>&copy; 2019. 企明星考核系统.</span>
                </div>

            </div><!--footer-->

        </div><!--maincontentinner-->
    </div><!--maincontent-->

</div><!--rightpanel-->
</body>

</html>
