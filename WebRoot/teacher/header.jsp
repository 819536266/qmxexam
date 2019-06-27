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
    <title>Title</title>
    <style>

            @media (max-width: 752px) {
                #menu{
                    margin-top:90px;
                    width: 100%;
                }
            }
            @media (min-width: 752px) {
                #menu{
                    margin-top:55px;
                    height: 800px;
                    width: 250px;
                }
            }

    </style>
</head>

<body>
<nav class="nav navbar-default navbar-fixed-top" style="background-color: #0866c6">
    <div class="row">
        <div class="col-md-2 col-md-offset-0 col-xs-10 col-xs-offset-1">
            <div class="navbar-header ">
                <a class="navbar-toggle collapsed" data-toggle="collapse" href="#sub" >
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a href="#" class="navbar-brand"><font color="#f0f8ff" size="4" face="楷体">企明星考核系统</font></a>
                <%--<a href="<%=path %>/teacher/teacher.jsp"><img src="<%=path %>/images/logo.png" alt=""/></a>--%>
            </div>
        </div>
        <div class="col-md-3 col-md-offset-6 col-xs-10 col-xs-offset-1 navbar-right">
            <ul class="nav  " style="margin-right: 20px;">
                <div class="row" >
                    <div class="col-xs-3 col-xs-offset-1">
                        <li><a href="#" style="padding: 0"   ><img src="<%=path %>/images/photos/thumb1.png" alt="" width="40px" height="40px"  /></a></li>

                    </div>
                    <div class="col-xs-3 ">
                        <li><a><font color="#f0f8ff" face="楷体">${sessionScope.teacherInfo.teacherID}</font>
                        </a> <br><a href="<%=path %>/login.jsp" class="btn  btn-danger btn-xs">退出登录</a></li>
                    </div>
                    <div class="col-xs-3 ">

                    </div>
                </div>
            </ul>
        </div>
    </div>
    <div class="nav-collapse" >

    </div>
   <%-- <div class="headerinner">
        <ul class="headmenu">

            <li class="right">
                <div class="userloggedinfo">
                    <img src="<%=path %>/images/photos/thumb1.png" alt=""/>
                    <div class="userinfo">
                        <h5>${sessionScope.teacherInfo.teacherID}
                            <small></small>
                        </h5>
                        <ul>
                            <li><a href="<%=path %>/login.jsp">退出登录</a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul><!--headmenu-->
    </div>--%>
</nav>
    <div id="menu" class="navbar-default navbar-collapse col-md-4 col-md-offset-0 col-xs-10 col-xs-offset-2 " style=" margin-left: 0px;">
                <ul class="nav nav-stacked" id="sub">
                    <li href="#sub1" class="" data-toggle="collapse">
                        <a href=""><span class="iconfa-pencil"></span> 员工管理
                                <span class="glyphicon glyphicon-chevron-right" ></span>
                        </a>
                        <ul id="sub1" class="collapse nav">
                            <li ><a href="<%=path %>/teacher/studentAdd.jsp" >添加员工</a></li>
                            <li><a href="<%=path %>/teacher/studentQuery.action">查询员工考试分数</a></li>
                            <li><a href="<%=path %>/teacher/studentAssessQuery.action">查询员工考核分数</a></li>
                            <li><a href="<%=path %>/target_query.action">查询考核指标</a></li>
                            <li><a href="<%=path %>/teacher/studentJfree.jsp">显示部门柱状图</a></li>
                        </ul>
                    </li>
                    <li  href="#sub2"  data-toggle="collapse">
                        <a href="#"><span class="iconfa-briefcase"></span> 试题管理
                            <span class="glyphicon glyphicon-chevron-right" style=""></span>
                        </a>
                        <ul  id="sub2" class="collapse nav">
                            <li><a href="<%=path %>/teacher/subjectAdd.jsp">添加试题</a></li>
                            <li><a href="<%=path %>/teacher/querySubject.action">查询所有试题</a></li>
                            <li><a href="<%=path %>/teacher/subjectQuery.jsp">搜索试题</a></li>
                        </ul>
                    </li>
                    <li href="#sub3"  data-toggle="collapse">
                        <a href=""><span class="iconfa-briefcase"></span>类型管理
                            <span class="glyphicon glyphicon-chevron-right" style=""></span>
                        </a>
                        <ul id="sub3" class="collapse nav">
                            <li><a href="<%=path %>/teacher/bigtype_query.action">一级分类</a></li>
                            <li><a href="<%=path %>/teacher/centre_query.action">二级分类</a></li>
                            <li><a href="<%=path %>/teacher/small_query.action">三级分类</a></li>
                        </ul>
                    </li>
                </ul>
        <script>
            $(function () {
                $("#menu li li").click(function (e) {
                    e.preventDefault()
                    $(this).tab('show');
                    document.getElementById("iframe").src= $(this).children('a').attr('href')
                })
            })
        </script>
    </div>
</body>
</html>
