<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>首页</title>
	<%--<link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>--%>
	<%--<link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>--%>
	<%-- <link rel='stylesheet' href='<%=path %>/css/slidetounlock.css'>--%>
	<link rel='stylesheet' href='<%=path %>/css/slide-unlock.css'>
	<link rel='stylesheet' href='<%=path %>/css/bootstrap/bootstrap.min.css' type="text/css">
	<script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-migrate-1.1.1.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="<%=path %>/js/custom.js"></script>
	<%--   <script type="text/javascript" src="<%=path %>/js/slidetounlock.js"></script>--%>
	<script type="text/javascript" src="<%=path %>/js/jquery.slideunlock.js"></script>
	<%
		session.removeAttribute("teacherInfo");

	%>
	<script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('#login').submit(function () {
                var u = jQuery('#username').val();
                var p = jQuery('#password').val();
                if (u == '' && p == '') {
                    jQuery('.login-alert').fadeIn();
                    return false;
                }
            });
        });
	</script>
</head>
<body class="loginpage " style="width: 90%;height: 100%;background: #0a6bce">
<div class="row" style="margin-top:150px ">
	<div class="col-md-3 col-md-offset-5 col-xs-10 col-xs-offset-2">
		<div class="col-md-8 col-md-offset-2 col-xs-8 col-xs-offset-2" style="padding: 0"><h2 style="margin-top: 10px" >
			<font color="#f0f8ff" face="楷体">企明星考核</font></h2>
		</div>
		<br>
		<form id="login" action="login.action" method="post" class="form-horizontal">
			<div class="col-md-12 col-xs-12 ">

				<span id="error" style="color:red"><s:actionerror/></span>
			</div>
			<div class="form-group form-group-md">
				<label for="username" class="col-md-3 control-label col-xs-12 text-info"  style="padding-left: 0;padding-right: 0"><font size="4" color="#fffff" face="楷体">用户名:</font></label>
				<div class="col-md-9 col-xs-12 " style="padding-left: 0">
					<input type="text" name="username" id="username" class="form-control input-lg"/>
				</div>

			</div>
			<div class="form-group form-group-md">
				<label for="password" class="col-md-3 control-label col-xs-12" style="padding-left: 0;padding-right: 0"><font size="4" color="#fffff" face="楷体">密码:</font></label>
				<div class="col-md-9 col-xs-12" style="padding-left: 0">
					<input type="text" name="password" id="password" class="form-control input-lg"/>
				</div>
			</div>
			<br>
			<div class="inputwrapper animate3 bounceIn">
				<input type="hidden" name="role" value="student"/>
			</div>

			<br>
			<div>
				<button id="submit"  name="submit"  class="btn btn-lg" style="background-color:#1e82e8;width: 100%">
					登录
				</button>
			</div>
		</form>
	</div>
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
</div>
<!--loginpanelinner-->
</div><!--loginpanel-->

</body>
</html>