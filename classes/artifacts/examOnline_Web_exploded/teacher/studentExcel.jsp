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
    <title>企明星考核系统</title>
    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-fileupload.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-timepicker.min.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-migrate-1.1.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap-fileupload.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.autogrow-textarea.js"></script>
    <script type="text/javascript" src="<%=path %>/js/charCount.js"></script>
    <script type="text/javascript" src="<%=path %>/js/colorpicker.js"></script>
    <script type="text/javascript" src="<%=path %>/js/ui.spinner.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=path %>/js/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/custom.js"></script>
</head>
<title>企明星考核系统</title>
<body>

<div class="mainwrapper">

    <div class="mainwrapper">
        <c:include value="header.jsp"/>

        <div class="rightpanel">

            <ul class="breadcrumbs">
                <li><a href="<%=path %>/teacher/teacher.jsp"><i class="iconfa-home"></i></a> <span
                        class="separator"></span></li>
                <li><a href="">试题管理</a> <span class="separator"></span></li>
                <li>添加员工</li>

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


            <div class="maincontent">
                <div class="maincontentinner">

                    <h4 class="widgettitle">添加员工</h4>
                    <div class="widgetcontent">
                        <form id="login" class="stdform" action="studentExcel.action" method="post" enctype="multipart/form-data">
                            <label>选择部门:</label>
                            <span class="field" id="span">
                                <select class="form-control"  id="selectone" onchange="fun1()" style="width:110px"></select>
                                <select class="form-control"  name="sclass" id="selecttwo" onchange="fun2()" style="width:110px">
                            </select>
                            </span>
                            <script type="text/javascript">

                                $(function () {
                                    $.ajax({
                                        type:"post",
                                        url:"<%=path %>/bigtype_queryall.action",
                                        success: function (data) {
                                            $("#selectone").empty();
                                            data=JSON.parse(data);
                                            $(data).each(function(i,n){
                                                $("#selectone").append("<option na='"+n.bigNano+"' url='"+n.bigId+"'  value='"+n.bigName+"'>"+n.bigName+"</option>");

                                            });
                                            fun1(data[0].bigId);
                                        }
                                    })

                                })

                                function  fun1(bid){
                                    id= $("#selectone").find("option:selected").attr("url");
                                    if(id==null||id==""){
                                        id=bid;
                                    }
                                    $.ajax({
                                        type:"post",
                                        url:"${pageContext.request.contextPath}/centre_queryByPid.action",
                                        data:{'centrePid.bigId':id},
                                        success: function (data) {
                                            $("#selecttwo").empty();
                                            $(JSON.parse(data)).each(function(i,n){
                                                $("#selecttwo").append("<option na='"+n.centreNano+"' url='"+n.centreId+"'  value='"+n.centreName+"'>"+n.centreName+"</option>");

                                            });
                                            fun2(data[0].centreId);
                                        }
                                    })

                                }
                                function  fun2(centreId){

                                    id= $("#selecttwo").find("option:selected").attr("url");
                                    if(id==null||id==""){
                                        id=centreId;
                                    }
                                    $.ajax({
                                        type:"post",
                                        url:"${pageContext.request.contextPath}/small_queryByPid.action",
                                        data:{'smallPid.centreId':id},
                                        success: function (data) {
                                            data=JSON.parse(data);
                                            if(data.length>0){
                                                $("#span #selectthree").remove();
                                                $("#selecttwo").attr("name","");
                                                selectthree=$("<select class='form-control' name='sclass' id='selectthree' style='width:110px'></select>");
                                                $("#span").append(selectthree);
                                                $(data).each(function(i,n){
                                                    $(selectthree).append("<option na='"+n.smallNano+"' url='"+n.smallId+"'  value='"+n.smallName+"'>"+n.smallName+"</option>");
                                                });

                                            }else{
                                                $("#selecttwo").attr("name","sclass");
                                                $("#span #selectthree").remove();

                                            }
                                        }
                                    })
                                }
                            </script>
                            <input type="hidden" name="sclassone" id="sclassone">
                            <label>选择部门:</label>
                            <span class="field" >
                                <input type="file" name="upload"><span><font
                                    color="red">${requestScope.error}</font></span>
                            </span>
                            <p class="stdformbutton">
                                <input type="submit" class="btn btn-primary" style=" width: 100px"
                                       value="录入"><span> <s:fielderror><s:param>error</s:param></s:fielderror> </span>
                            </p>
                        </form>
                    </div>




                </div>
                <!--widgetcontent-->
            </div>
            <!--widget-->

            <div class="footer" >
                <div class="footer-left">
                    <span>&copy; 2013.  All Rights Reserved.</span>
                </div>

            </div>
            <!--footer-->

        </div>
        <!--maincontentinner-->
    </div>
    <!--maincontent-->

</div>
<!--rightpanel-->

</div>
<!--mainwrapper-->

</body>
<script>
    jQuery('#login').submit(function () {
        id= $("#selecttwo").find("option:selected").attr("na");
        $("#sclassone").val(id);
    });
</script>
</html>


	