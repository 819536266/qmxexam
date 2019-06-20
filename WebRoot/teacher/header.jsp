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
</head>
<body>
<div class="header">
    <div class="logo">
        <h2 style="margin-top: 10px;" ><font color="#f0f8ff" face="楷体">企明星考核系统</font></h2>
        <%--<a href="<%=path %>/teacher/teacher.jsp"><img src="<%=path %>/images/logo.png" alt=""/></a>--%>
    </div>
    <div class="headerinner">
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
    </div>
</div>
<div class="leftpanel" style="margin-left: 0px;">

    <div class="leftmenu">
        <ul class="nav nav-tabs nav-stacked">
            <li class="nav-header">Navigation</li>

            <li class="dropdown "><a href=""><span class="iconfa-pencil"></span> 员工管理</a>
                <ul>
                    <li><a href="<%=path %>/teacher/studentAdd.jsp">添加员工</a></li>
                    <li><a href="<%=path %>/teacher/studentQuery.action">查询员工考试分数</a></li>
                    <li><a href="<%=path %>/teacher/studentAssessQuery.action">查询员工考核分数</a></li>
                    <li><a href="<%=path %>/target_query.action">查询考核指标</a></li>
                    <li><a href="<%=path %>/teacher/studentJfree.jsp">显示部门柱状图</a></li>
                </ul>
            </li>
            <li class="dropdown active"><a href=""><span class="iconfa-briefcase"></span> 试题管理</a>
                <ul>
                    <li><a href="<%=path %>/teacher/subjectAdd.jsp">添加试题</a></li>
                    <li><a href="<%=path %>/teacher/querySubject.action">查询所有试题</a></li>
                    <li><a href="<%=path %>/teacher/subjectQuery.jsp">搜索试题</a></li>
                </ul>
            </li>
            <li class="dropdown"><a href=""><span class="iconfa-briefcase"></span>类型管理</a>
                <ul>
                    <li><a href="<%=path %>/teacher/bigtype_query.action">一级分类</a></li>
                    <li><a href="<%=path %>/teacher/centre_query.action">二级分类</a></li>
                    <li><a href="<%=path %>/teacher/small_query.action">三级分类</a></li>
                </ul>
            </li>
        </ul>
    </div><!--leftmenu-->

</div>
</body>
</html>
