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
    <script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-migrate-1.1.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=path %>/js/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/responsive-tables.js"></script>
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

        //ajax
        function showStatus(str) {
            //如果form表单中的字符串为空的话，就把显示的返回值清空，并且返回函数，不再往下执行
            if (str.length == 0) {
                document.getElementById("txt").innerHTML = "";
                return;
            }
            if (window.XMLHttpRequest) {
                //chrome Firefox opera Safari……
                var xmlhttp = new XMLHttpRequest();
            } else {
                //兼容老版本
                var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                //如果可以连接的通
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    // 并且返回值是HTTP200
                    document.getElementById("txt").innerHTML = xmlhttp.responseText;
                    // 获取ajax 从后台回传的数据
                }
            }
            //打开ajax
            xmlhttp.open("GET", "checkStudentID.action?studentID=" + str, true);
            //发送请求
            xmlhttp.send();
        }
    </script>
    <title>企明星考核系统</title>
</head>
<body>

<div class="mainwrapper">
    <c:include value="header.jsp"/>


    <div class="rightpanel">

        <ul class="breadcrumbs">
            <li><a href="<%=path %>/teacher/teacher.jsp"><i class="iconfa-home"></i></a> <span class="separator"></span>
            </li>
            <li>员工管理 <span class="separator"></span></li>
            <li>删除员工</li>

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
                    <h4 class="widgettitle">删除员工</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="delete.action" method="post">

                            <label>员工编号：</label>
                            <span class="field">
                      			<input type="text" id="id" name="studentID" class="input-xlarge" placeholder="请输入..."
                                       required="required"/>
                                <!-- <span id="txt"></span><!-- 验证 -->
                            </span>

                            <label>员工姓名：</label>
                            <span class="field"><input type="text" name="studentName" class="input-xlarge"
                                                       placeholder="请输入..." required="required"/></span>

                            <label>所属部门:</label>
                            <span class="field">
                          	  <select name="sclass" class="form-control">
                          	  	<option value="移动云办公" selected="selected">移动云办公</option>
                          	  	<option value="会计信息化">会计信息化</option>
                          	  	<option value="新媒体工程">新媒体工程</option>
                          	  </select>
                            </span>

                            <p class="stdformbutton">
                                <input class="btn btn-primary" type="submit" value="删除">
                                <input class="btn btn-primary" type="reset" value="重置">
                            </p>

                        </form>
                    </div><!--widgetcontent-->
                </div><!--widget-->

                <br/><br/>

                <div class="footer" >
                    <div class="footer-left">
                        <span>&copy; 2019. 企明星考核系统.</span>
                    </div>

                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->

    </div><!--rightpanel-->

</div><!--mainwrapper-->

</body>
</html>