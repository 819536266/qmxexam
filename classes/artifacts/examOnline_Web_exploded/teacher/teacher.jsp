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
    <script src="<%=path %>/js/vue/vue.min.js"></script>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">企明星</strong>
                                    </span>
                                </span>
                        </a>
                    </div>
                    <div class="logo-element">企明星
                    </div>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">分类</span>
                </li>
                <li>
                    <a class="J_menuItem" href="<%=path %>/teacher/index.jsp">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <li class="active">
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">员工管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path %>/teacher/studentAdd.jsp">添加员工</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path %>/teacher/student/list.jsp">查看员工</a>
                        </li>
                    </ul>
                </li>
                <li class="line dk"></li>
                <li>
                    <a class="J_menuItem" href="<%=path %>/teacher/salary/salary.jsp">
                        <i class="fa fa-safari"></i>
                        <span class="nav-label">工资管理</span>
                    </a>
                </li>
                <li class="line dk"></li>
                <li>
                    <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">分数管理 </span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path %>/teacher/studentQuery.action">查询员工考试分数</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path %>/teacher/studentAssessQuery.action">查询员工考核分数</a>
                        </li>
                       <%-- <li>
                            <a class="J_menuItem" href="<%=path %>/target_query.action">查询考核指标</a>
                        </li>--%>
                        <li>
                            <a class="J_menuItem" href="<%=path %>/teacher/studentJfree.jsp">显示部门柱状图</a>
                        </li>
                    </ul>
                </li>
                <li class="line dk"></li>

                <li>
                    <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">试题管理 </span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="<%=path %>/teacher/subjectAdd.jsp">添加试题</a>
                        </li>
                        <li><a class="J_menuItem" href="<%=path %>/teacher/querySubject.action">查询所有试题</a>
                        </li>
                        <li><a class="J_menuItem" href="<%=path %>/teacher/subjectQuery.jsp">搜索试题</a>
                        </li>
                    </ul>
                </li>
                <li class="line dk"></li>

                <li>
                    <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">分类管理 </span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="<%=path %>/teacher/bigtype_query.action">一级分类</a>
                        </li>
                        <li><a class="J_menuItem" href="<%=path %>/teacher/centre_query.action">二级分类</a>
                        </li>
                        <%--<li><a class="J_menuItem" href="<%=path %>/teacher/small_query.action">三级分类</a>
                        </li>--%>
                    </ul>
                </li>
                <li class="line dk"></li>

                <li>
                    <a href="javascript:;" data-toggle="modal" data-target="#modal"><i class="fa fa-envelope"></i>
                        <span class="nav-label">修改密码 </span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header" style="width: 30%"> <a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>

                </div>

                    <ul class="nav navbar-nav navbar-right col-sm-2 col-xs-5" style="margin-right: 10px;">
                        <li>
                            <div class="btn-group">
                                <button class="btn btn-primary navbar-btn" onclick="fan()" >上一页</button>&nbsp;
                                <script>
                                    function fan() {
                                        history.go(-1);
                                    }
                                    function shua() {
                                        document.getElementById('J_iframe').contentWindow.location.reload(true);
                                    }
                                </script>
                                &nbsp; <button class="btn btn-primary navbar-btn" onclick="shua()"><span class="glyphicon glyphicon-repeat"></span></button>
                            </div>
                        </li>

                    </ul>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src="<%=path %>/teacher/index.jsp" frameborder="0" data-id="index_v1.html" seamless="no"></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
    <div id="app">
        <div id="modal" class="modal fade bs-example-model-lg"   tabindex="-1" role="dialog" aria-labelledby="">
            <div class="modal-dialog modal-sm" role="document"  >
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"  data-dismiss="modal" >
                        <span aria-hidden="true">
                            &times;
                        </span>
                            <span class="sr-only">
                            关闭
                        </span>
                        </button>
                        <h4 class="modal-title">修改密码<span><font color="red" >{{font}}</font></span></h4>
                    </div>
                    <div class="modal-content" >
                        <div class="ibox ">
                            <div class="ibox-content" >
                                <form  id="form">
                                    <div class="form-group">
                                        <label  for="name" >用户名:</label>
                                        <input id="name" class="form-control" type="text" v-model="name" readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label for="password1"> 原始密码:</label>
                                        <input id="password1" class="form-control" name="password1" v-model="password1"  type="password"  >
                                    </div>
                                    <div class="form-group">
                                        <label for="password2"> 修改密码:</label>
                                        <input id="password2" class="form-control" name="password" v-model="password2" type="password"  >
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button"  class="btn btn-white" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" v-on:click="subimt" >保存</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="<%=path %>/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=path %>/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=path %>/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=path %>/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=path %>/admin/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="<%=path %>/admin/js/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=path %>/admin/js/index.js"></script>

<!-- 第三方插件 -->
<script src="<%=path %>/admin/js/plugins/pace/pace.min.js"></script>
<script>
$(function () {
    student="${sessionScope.teacherInfo.sysid}";
    if(student==null||student==''){
        alert("未登录,跳转至登录界面")
        window.location.href="<%=path %>/teacher/login.jsp"
    }
})
    new Vue({
        el: '#app',
        data: {
            name: '${teacherInfo.teacherID}',
            password1: '',
            password2: '',
            font: '',
        },
        methods: {
            subimt: function() {
                if(this.name==''){
                    this.font='检查是否登录!';
                }else if(this.password1==''){
                    this.font='原始密码为空!';
                }else if(this.password2===''||this.password2.length<6){
                    this.font='修改密码大于或等于6位!';
                }else{
                    $.ajax({
                        type: 'post',
                        url: 'update_teacherUpdate.action',
                        data:{
                            'teacher.sysid':'${teacherInfo.sysid}',
                            'teacher.teacherID':this.name,
                            'teacher.password':this.password1,
                            'teacherpd':this.password2
                        },
                        success:function (data) {
                            if(data=='success'){
                                alert('修改成功,下次登录生效')
                            }else{
                                alert('修改失败')
                            }
                        }
                    })
                }
            }
        }
    })
</script>
</body>

</html>
