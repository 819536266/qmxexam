<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<head>
    <meta charset="utf-8">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
    <link rel="stylesheet" href="<%=path %>/css/student.css" type="text/css"/>
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


    <title>企明星考核系统</title>
</head>
<body>
<div class="container">

    <div class="header">
        <div class="logo">
            <a href="dashboard.html"><img src="<%=path %>/images/logo.png" alt=""/></a>
        </div>
        <div class="headerinner">
            <ul class="headmenu">

                <li class="right">
                    <div class="userloggedinfo">
                        <div class="userinfo">
                            <ul>
                                <li><a href="http://cj63495025.net/school/query.jsp">
                                    <button style="width: 100px;height: 50px;background-color: rgba(144, 238, 144,0.9); ">
                                        返回
                                    </button>
                                </a></li>
                            </ul>
                        </div>

                    </div>
                </li>
            </ul>
            <!--headmenu-->
        </div>
    </div>
</div>
<div class="examed_uc maincontentinner">
    <div style="width:400px;margin: auto;" id="id">
        <p>
            <font size="5" face="楷体">员工姓名:
                <span class="field">${students.studentName}</span></font>
        </p>
        <p>
            <font size="5" face="楷体">员工编号:
                <span class="field">${students.sysid}</span></font>
        </p>
        <p>
            <font size="5" face="楷体">员工号码:
                <span class="field">${students.studentID }</span></font>
        </p>
        <p>
            <font size="5" face="楷体">员工部门:
                <span class="field">${students.sclass} </span></font>
        </p>
        <p>
            <font size="5" face="楷体">日期:
                <span class="field"> ${students.term}</span></font>
        </p>
        </p>

        <font size="5" face="楷体">分数:</font><br>
        <c:if test="${students.sr.size()>0}">
            <c:forEach items="${students.sr}" var="scorde">
                <font size="3" face="楷体">提交时间:
                    <span class="field"> ${scorde.testtime}</span></font>

                <font size="3" face="楷体">分数:
                    <span class="score"> ${scorde.timescore}</span>分</font>
                <br>
                <br>
            </c:forEach>
            <font size="4" face="楷体" id="">该员工平均分:
                <span class="field" id="span"></span></font>
            <br>
            <font size="4" face="楷体">该员工最高分:
                <span class="field" id="max"></span></font>
            <br>
            <span id="min"></span>

        </c:if>
        <c:if test="${students.sr.size()<=0}">
            <font size="3" face="楷体" color="red">该员工暂无考试成绩</font>
        </c:if>
        </p>
    </div>
</div><!--widgetcontent-->
</div><!--widget-->

<br/><br/>

<div class="footer" >
    <div class="footer-left">
        <span>&copy; 2019. 企明星考核系统.</span>
    </div>

</div><!--footer-->

</div><!--mainwrapper-->

</body>
<script type="text/javascript">

    jQuery(document).ready(function () {
        var j = 0;
        var maxx = [$("#id .score").length];
        $("#id .score").each(function (i) {
            maxx[i] = parseInt($(this).html());
            j += parseInt($(this).html());

        })
        var max = Math.max.apply(Math, maxx);
        var min = Math.min.apply(Math, maxx);
        if (min != 0 && $("#id .score").length > 1) {
            $("#min").html("<font size='3' face='楷体' >该员工最低分:" + min + "</font>");
        }
        $("#max").html(max);
        j = j / ($("#id .score").length);
        j = Math.round(j * 100) / 100;
        $("#span").html(j);

    });
</script>
</html>