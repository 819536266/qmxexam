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
    <script type="text/javascript">
        jQuery(document).ready(function () {
            // dynamic table
            jQuery('#dyntable').dataTable({
                "sPaginationType": "full_numbers",
                "aaSortingFixed": [[0, 'asc']],
                "fnDrawCallback": function (oSettings) {
                    jQuery.uniform.update();
                }
            });

            jQuery('#dyntable2').dataTable({
                "bScrollInfinite": true,
                "bScrollCollapse": true,
                "sScrollY": "300px"
            });

        });
    </script>
</head>
<title>老师登陆成功</title>
<body>


        <div class="maincontent">
            <div class="table-responsive">

                <h4 class="widgettitle">试题库</h4>
                <hr>
                <font size="5" color="red">以下试题存储失败,请查看是否已添加或者文档中格式不正确!</font>
                <form action="subjectworderror" method="post">
                    <table id="dyntable" class="table-hover table-bordered text-nowrap">

                        <tbody>

                        <s:iterator value="#request.subjectserror" var="subjecterror" status="ls">
                            <div style="margin: auto;">
                                <font size="4">
                                    <xmp> ${ls.index+1},${subjecterror.stTitle}</xmp>
                                </font>
                            </div>
                            <div style="margin: auto;">
                                <font size="4">
                                    <xmp>选项A:${subjecterror.stOptionA}
                                        选项B:${subjecterror.stOptionB}
                                        选项C:${subjecterror.stOptionC}
                                        选项D:${subjecterror.stOptionD}</xmp>
                                </font>
                            </div>
                            <div style="margin: auto;">
                                <font size="4">
                                    <xmp>答案:${subjecterror.stAnswer}</xmp>
                                </font>
                            </div>
                            <div style="margin: auto;">
                                <font size="4">
                                    <xmp>解析:${subjecterror.stParse}</xmp>
                                </font>
                            </div>
                        </s:iterator>
                        </tbody>
                    </table>
                    <br/><br/>

                </form>
            </div><!--maincontentinner-->
        </div><!--maincontent-->

</body>
</html>
	