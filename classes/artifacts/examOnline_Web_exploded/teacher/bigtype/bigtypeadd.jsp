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

    <style type="text/css">
        select {
            padding: 5px;
            border-radius: 5px;
            outline: none;
        }
    </style>


    <title>企明星考核系统</title>
</head>
<body>

<div class="mainwrapper">
    <c:include value="../header.jsp"/>


    <div class="rightpanel">

        <ul class="breadcrumbs">
            <li><a href="<%=path %>/teacher/teacher.jsp"><i class="iconfa-home"></i></a> <span class="separator"></span>
            </li>
            <li>分类管理 <span class="separator"></span></li>
            <li>添加一级分类</li>

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
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle">添加</h4>
                    <div class="widgetcontent">

                        <form class="stdform" action="bigtype_add.action" method="post" id="login">


                            <label>一级分类名称：</label>
                            <span class="field">
                      			<input type="text" id="bigName" name="bigtype.bigName" class="input-xlarge" style="width:215px"
                                       placeholder="请输入..." required="required" />
                            	<span id="txt"></span><!-- 验证 -->
                            </span>

                            <label>一级分类简写：</label>
                            <span class="field"><input type="text" id="bigNano"  name="bigtype.bigNano" style="width:215px"
                                                       class="input-xlarge" placeholder="请输入..."
                                                       required="required"/></span>


                            <p class="stdformbutton">
                                <input class="btn btn-primary" type="submit" value="添加" style="width:100px">
                            </p>


                        </form>

                    </div><!--widgetcontent-->
                </div><!--widget-->

                <br/><br/>

                <div class="footer" style="position: fixed;bottom:0px;">
                    <div class="footer-left">
                        <span>&copy; 2019. 企明星考核系统.</span>
                    </div>

                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->

    </div><!--rightpanel-->

</div><!--mainwrapper-->

<script type="text/javascript">

    //提交之前
    jQuery('#login').submit(function () {
        if($("#bigName").val()==null||$("#bigName").val()==''||$("#bigNano").val()==''||$("#bigNano").val()==null){
            return false;
        }else{
            return true;
        }
    });


</script>
</body>
</html>