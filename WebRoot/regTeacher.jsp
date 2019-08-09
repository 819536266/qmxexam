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
    <title>注册页面</title>
    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
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
    <!--<script type="text/javascript">
        /*jQuery(document).ready(function(){
            jQuery('#reg').submit(function(){
                var u = jQuery('#username').val();
                var p = jQuery('#password').val();
                if(u == '' && p == '') {
                    jQuery('.login-alert').fadeIn();
                    return false;
                }
            });
        });*/
    </script>
    -->

</head>
<body class="loginpage">


<div class="loginpanel">
    <div class="loginpanelinner">
        <div class="logo animate0 bounceIn"><img src="images/logo.png" alt=""/></div>

        <s:form action="regTeacherAction.action" method="post">

        <div class="inputwrapper login-alert">
            <div class="alert alert-error">Invalid username or password</div>
        </div>

        <!--管理员ID-->
        <div class="inputwrapper animate2 bounceIn">
            <label>管理员ID：</label>
            <div>
                <input type="text" name="teacherID" placeholder="请输老师号">
            </div>
        </div>

        <!--密码-->
        <div class="inputwrapper animate2 bounceIn">
            <label> 密码：</label>
            <div>
                <input type="password" name="password" placeholder="请输入密码">
            </div>
        </div>
    </div>
    <div class="inputwrapper animate2 bounceIn">
        <label> 部门:</label>
        <select name="sclass" class="form-control" style="width: 100%;height: 100%">
            <option value="" selected="selected">--选择部门--</option>
            <option value="移动云办公">移动云办公</option>
            <option value="会计信息化">会计信息化</option>
            <option value="新媒体工程">新媒体工程</option>
        </select>
    </div>
    <div class="inputwrapper animate2 bounceIn">
        <label> 部门:</label>
        <select name="sclass1" class="form-control" style="width: 100%;height: 100%">
            <option value="" selected="selected">--选择部门--</option>
            <option value="移动云办公">移动云办公</option>
            <option value="会计信息化">会计信息化</option>
            <option value="新媒体工程">新媒体工程</option>
        </select>
    </div>
    <div class="inputwrapper animate2 bounceIn">
        <label> 部门:</label>
        <select name="sclass2" class="form-control" style="width: 100%;height: 100%">
            <option value="" selected="selected">--选择部门--</option>
            <option value="移动云办公">移动云办公</option>
            <option value="会计信息化">会计信息化</option>
            <option value="新媒体工程">新媒体工程</option>
        </select>
    </div>
    <div class="inputwrapper animate2 bounceIn">
        <label> 部门:</label>
        <select name="sclass3" class="form-control" style="width: 100%;height: 100%">
            <option value="" selected="selected">--选择部门--</option>
            <option value="移动云办公">移动云办公</option>
            <option value="会计信息化">会计信息化</option>
            <option value="新媒体工程">新媒体工程</option>
        </select>
    </div>
    <div class="inputwrapper animate5 bounceIn">
        <input type="submit" value="注册" class="btn-reg" style="width: 100%"/>
    </div>

    </s:form>
    <!--注册按钮-->
    <div class="inputwrapper animate5 bounceIn">
        <a style="background-color: #e6e6e6;" href="<%=path %>/login.jsp">
            <button>返回>></button>
        </a>
    </div>
</div><!--loginpanelinner-->
</div><!--loginpanel-->


</body>


</html>