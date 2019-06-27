<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>企明星考核系统</title>

		<link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css" />
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-fileupload.min.css" type="text/css" />
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-timepicker.min.css" type="text/css" />
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
	<title>老师登陆成功</title>
<body>

       
          <div class="maincontent">
            <div class="maincontentinner">
            
                <h4 class="widgettitle">添加</h4>
                <hr>
                <div style="width: 20%;height: 20%;margin: auto;">
                 	<font style="width: 100%;height: 100%;" color="red" size="3">添加成功!</font><br>
                    <a  href="javascript:history.go(-1);">返回上一页</a>
                </div>
              
                <div class="footer" >
                    <div class="footer-left">
                        <span>&copy; 2019. 企明星考核系统.</span>
                    </div>
                    
                </div><!--footer-->
            
            </div><!--maincontentinner-->
        </div><!--maincontent-->


</body>
</html>
	