<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>首页</title>
<link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css" />
<link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>
<link rel='stylesheet' href='<%=path %>/css/slidetounlock.css'>

<script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/modernizr.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=path %>/js/custom.js"></script>
<script type="text/javascript" src="<%=path %>/js/slidetounlock.js"></script>
<%
	session.removeAttribute("studentInfo");
	
 %>
<script type="text/javascript">
   
    jQuery(document).ready(function(){
        jQuery('#login').submit(function(){
            var u = jQuery('#username').val();
            var p = jQuery('#password').val();
            if(u == '' && p == '') {
                jQuery('.login-alert').fadeIn();
                jQuery('#error').html("用户名和身份证号不得为空");
                jQuery('#erro').html("");
                return false;
            }
			/* // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X 
			var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
			if(reg.test(p) === false) { 
				jQuery('#error').html("身份证输入不合法");
				jQuery('#erro').html("");
				return false; 
			}  */

        });
    });
  
    
</script>
</head>
<body class="loginpage">


 	
 	
<div class="loginpanel">
    <div class="loginpanelinner">
        <div class="logo animate0 bounceIn">
			<h2 style="margin-top: 10px;" ><font color="#f0f8ff" face="楷体">企明星考核系统</font></h2>
			<%--<img src="<%=path %>/images/logo.png" alt="" />--%></div>
        <s:form id="login" action="login" >
       

             <span id="erro" style="color:red">  <s:actionerror/> </span>
            <div style="width: 100%;height: 25px">
				<font  size="4" color="white" face="楷体" style="float: left;" >用户名:</font>
				<input type="text" name="username" id="username" style="float: right;height:100%;"  />
			</div>
            <span></span><br>
          	  <span></span><br>
            <div style="width: 100%;height: 25px">
				<font  size="4" color="white" face="楷体" style="float: left;" >身份证:</font>
				<input type="text" name="password" id="password" style="float: right;height:100%;" />

            </div>
          	 <input type="hidden" name="role" value="student">
          	  <span></span><br>
          	   <span></span><br>
          	 <div class="inputwrapper animate5 bounceIn">
                <button  name="submit" class="btn" style="background-color: rgb(30, 130, 232); ">登录</button>
            </div>
       	</s:form>
       	</div>
       	<!--loginpanelinner-->
</div><!--loginpanel-->
</body>
</html>